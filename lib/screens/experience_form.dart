import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

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

  // Controllers for date input fields
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
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
      appBar: AppBar(
        title: const Text(
          'Add Experience Form',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
            letterSpacing: -0.5,
          ),
        ),
        // Explicit back button consistent with Add Education Form
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Clean white AppBar consistent with the rest of the application
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        elevation: 0,
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.transparent,
      ),
      drawer: const LeftDrawer(),
      backgroundColor: const Color(0xFFEFF6FF),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                        icon: const Icon(Icons.calendar_month, color: Color(0xFF047857)),
                        onPressed: () => _pickDate(isStart: true),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
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
                      style: TextStyle(fontSize: 12.0, color: Color(0xFF64748B)),
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
                          icon: const Icon(Icons.calendar_month, color: Color(0xFF047857)),
                          onPressed: () => _pickDate(isStart: false),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
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
                      hintText: 'Describe your responsibilities, achievements, and contributions...',
                      labelText: 'Description',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
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
                        backgroundColor: const Color(0xFF047857), // Forest Emerald Experience theme
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      onPressed: () {
                        // Trigger comprehensive form validation
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final rows = <Widget>[
                                _dialogRow('Title', _title),
                                _dialogRow('Category', _category),
                                _dialogRow('Start Date', _startDateController.text),
                                _dialogRow(
                                  'End Date',
                                  _isOngoing ? 'Present (Ongoing)' : _endDateController.text,
                                ),
                                _dialogRow('Description', _description),
                                if (_thumbnail.trim().isNotEmpty)
                                  _dialogRow('Thumbnail URL', _thumbnail),
                              ];

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
                                    Icon(Icons.check_circle,
                                        color: Color(0xFF047857), size: 22),
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
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _formKey.currentState!.reset();
                                      _startDateController.clear();
                                      _endDateController.clear();
                                      setState(() {
                                        _title = '';
                                        _description = '';
                                        _category = 'Full-Time';
                                        _thumbnail = '';
                                        _startDate = null;
                                        _endDate = null;
                                        _isOngoing = true;
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
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
