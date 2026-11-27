import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/floating_app_bar.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

/// Form page for adding personal professional and project experience.
/// Built with StatefulWidget to manage form inputs, date picker state, and validations.
class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  // GlobalKey to identify and validate the Form state
  final _formKey = GlobalKey<FormState>();

  // State variables for form fields
  String _title = '';
  String _description = '';
  String _category = 'Full-Time';
  String _thumbnail = '';
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isOngoing = true;
  bool _isSubmitting = false;

  // Controllers for date input fields
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final loggedIn = await ensureLoggedIn(context);
    if (!loggedIn || !mounted) return;

    final token = context.read<AuthState>().token;
    if (token == null) return;

    setState(() {
      _isSubmitting = true;
    });

    final newExperience = Experience(
      title: _title.trim(),
      description: _description.trim(),
      category: _category.trim().toLowerCase(),
      thumbnail: _thumbnail.trim().isEmpty ? null : _thumbnail.trim(),
      startedAt: _startDate,
      endedAt: _isOngoing ? null : _endDate,
      isOngoing: _isOngoing,
    );

    try {
      final created = await context.read<ApiClient>().createExperience(
            newExperience,
            token: token,
          );
      if (!mounted) return;

      final rows = <Widget>[
        _dialogRow('Title', created.title),
        _dialogRow(
          'Category',
          created.categoryDisplay.isNotEmpty
              ? created.categoryDisplay
              : created.category,
        ),
        _dialogRow(
          'Start Date',
          created.startedAt != null
              ? "${created.startedAt!.year}-${created.startedAt!.month.toString().padLeft(2, '0')}-${created.startedAt!.day.toString().padLeft(2, '0')}"
              : _startDateController.text,
        ),
        _dialogRow(
          'End Date',
          created.isOngoing || created.endedAt == null
              ? 'Present (Ongoing)'
              : "${created.endedAt!.year}-${created.endedAt!.month.toString().padLeft(2, '0')}-${created.endedAt!.day.toString().padLeft(2, '0')}",
        ),
        _dialogRow('Description', created.description),
        if ((created.thumbnail ?? '').isNotEmpty)
          _dialogRow('Thumbnail URL', created.thumbnail!),
      ];

      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 24,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Row(
              children: [
                Icon(Icons.check_circle, color: Color(0xFF047857), size: 22),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Experience Added!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            content: SizedBox(
              width: 360,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: rows,
                ),
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK, View Experience List'),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          );
        },
      );

      if (!mounted) return;

      Router.neglect(context, () {
        context.go('/experiences');
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 401) {
        await context.read<AuthState>().logout();
        if (!mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Session expired. Please log in again.'),
            ),
          );
        await ensureLoggedIn(context);
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text('Failed to save experience (HTTP ${e.statusCode})'),
            ),
          );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  // Opens an interactive Material Date Picker
  Future<void> _pickDate({required bool isStart}) async {
    final DateTime initial = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());

    final DateTime firstDate = DateTime(2000);
    final DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF047857), // Forest Emerald theme
              onPrimary: Colors.white,
              onSurface: Color(0xFF1E293B),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          _startDateController.text =
              "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
          // If end date is before start date, reset end date
          if (_endDate != null && _endDate!.isBefore(_startDate!)) {
            _endDate = null;
            _endDateController.clear();
          }
        } else {
          _endDate = picked;
          _endDateController.text =
              "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        }
      });
    }
  }

  // Helper widget to build each category chip item
  Widget _buildChip(String category) {
    final bool isSelected = _category == category;
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            setState(() {
              _category = category;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF047857) : Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF047857)
                    : const Color(0xFFCBD5E1),
                width: 1.2,
              ),
            ),
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF1E293B),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 13.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Two-row Category Chips matching user design specification exactly
  Widget _buildCategoryChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            _buildChip('Full-Time'),
            const SizedBox(width: 8.0),
            _buildChip('Part-Time'),
            const SizedBox(width: 8.0),
            _buildChip('Internship'),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            _buildChip('Freelance'),
            const SizedBox(width: 8.0),
            _buildChip('Volunteer'),
            const SizedBox(width: 8.0),
            _buildChip('Research'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(
        title: 'Add Experience Form',
        accentColor: Color(0xFF047857),
      ),
      drawer: const LeftDrawer(),
      backgroundColor: const Color(0xFFEFF6FF),
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color(0xFF047857),
                ),
          ),
          child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // === Experience Title ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'e.g. Software Engineer Intern',
                      labelText: 'Experience Title / Role',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF047857), width: 1.8),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _title = value ?? '';
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Experience title cannot be empty!';
                      }
                      if (value.trim().length < 3) {
                        return 'Experience title must be at least 3 characters!';
                      }
                      return null;
                    },
                  ),
                ),

                // === Category Chips ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildCategoryChips(),
                ),

                const SizedBox(height: 6.0),

                // === Start Date Field with showDatePicker() ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: _startDateController,
                    readOnly: true,
                    onTap: () => _pickDate(isStart: true),
                    decoration: InputDecoration(
                      hintText: 'YYYY-MM-DD',
                      labelText: 'Start Date',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_month,
                            color: Color(0xFF047857)),
                        onPressed: () => _pickDate(isStart: true),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF047857), width: 1.8),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Start date cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),

                // === Currently Ongoing Checkbox ===
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: const Color(0xFFCBD5E1)),
                  ),
                  child: CheckboxListTile(
                    title: const Text(
                      'Currently Ongoing',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    subtitle: const Text(
                      'Check if you currently work or participate here',
                      style:
                          TextStyle(fontSize: 12.0, color: Color(0xFF64748B)),
                    ),
                    value: _isOngoing,
                    activeColor: const Color(0xFF047857),
                    onChanged: (bool? value) {
                      setState(() {
                        _isOngoing = value ?? true;
                        if (_isOngoing) {
                          _endDate = null;
                          _endDateController.clear();
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),

                // === End Date Field (Disabled if Currently Ongoing) ===
                if (!_isOngoing)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _endDateController,
                      readOnly: true,
                      onTap: () => _pickDate(isStart: false),
                      decoration: InputDecoration(
                        hintText: 'YYYY-MM-DD',
                        labelText: 'End Date',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month,
                              color: Color(0xFF047857)),
                          onPressed: () => _pickDate(isStart: false),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                              color: Color(0xFF047857), width: 1.8),
                        ),
                      ),
                      validator: (String? value) {
                        if (!_isOngoing) {
                          if (value == null || value.trim().isEmpty) {
                            return 'End date cannot be empty when not ongoing!';
                          }
                          if (_startDate != null &&
                              _endDate != null &&
                              _endDate!.isBefore(_startDate!)) {
                            return 'End date cannot be earlier than start date!';
                          }
                        }
                        return null;
                      },
                    ),
                  ),

                // === Description ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText:
                          'Describe your responsibilities, achievements, and contributions...',
                      labelText: 'Description',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF047857), width: 1.8),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _description = value ?? '';
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Description cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),

                // === Thumbnail URL (optional) ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      hintText: 'https://example.com/thumbnail.png (optional)',
                      labelText: 'Thumbnail URL',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF047857), width: 1.8),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _thumbnail = value ?? '';
                      });
                    },
                    validator: (String? value) {
                      if (value != null && value.trim().isNotEmpty) {
                        final Uri? uri = Uri.tryParse(value.trim());
                        if (uri == null ||
                            !uri.hasScheme ||
                            !(uri.scheme == 'http' || uri.scheme == 'https')) {
                          return 'Please enter a valid URL (starting with http:// or https://)';
                        }
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 16.0),

                // === Save Button ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF047857), // Forest Emerald theme
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      onPressed: _isSubmitting ? null : _submit,
                      child: _isSubmitting
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'Save',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  }

  // Helper widget to display clean label and value pairs in the AlertDialog
  Widget _dialogRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF1E293B),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
