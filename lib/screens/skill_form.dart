import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/models/skill.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/floating_app_bar.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class SkillFormPage extends StatefulWidget {
  const SkillFormPage({super.key});

  @override
  State<SkillFormPage> createState() => _SkillFormPageState();
}

class _SkillFormPageState extends State<SkillFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _category = 'soft';
  double _score = 8.0;
  int _order = 0;
  bool _isSubmitting = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final loggedIn = await ensureLoggedIn(context);
    if (!loggedIn || !mounted) return;

    final token = context.read<AuthState>().token;
    if (token == null) return;

    setState(() {
      _isSubmitting = true;
    });

    final newSkill = Skill(
      name: _name.trim(),
      category: _category,
      score: _score,
      order: _order,
    );

    try {
      final created = await context.read<ApiClient>().createSkill(
            newSkill,
            token: token,
          );
      if (!mounted) return;

      final categoryLabel =
          created.category.toLowerCase() == 'hard' ? 'Hard Skill' : 'Soft Skill';

      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Row(
              children: [
                Icon(Icons.check_circle, color: Color(0xFF7C3AED), size: 22),
                SizedBox(width: 8),
                Text('Skill Added!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dialogRow('Name', created.name),
                _dialogRow('Category', categoryLabel),
                _dialogRow('Score', '${created.score} / 10.0'),
                _dialogRow('Order', '${created.order}'),
              ],
            ),
            actions: [
              TextButton(
                child: const Text('OK, View Skills List'),
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
        context.go('/skills');
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 401) {
        await context.read<AuthState>().logout();
        if (!mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(content: Text('Session expired. Please log in again.')),
          );
        await ensureLoggedIn(context);
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('Failed to save skill (HTTP ${e.statusCode})')),
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

  Widget _dialogRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 13, color: Color(0xFF1E293B), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FloatingAppBar(title: 'Add Skill'),
      drawer: const LeftDrawer(),
      backgroundColor: const Color(0xFFEFF6FF),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Skill Name',
                    hintText: 'e.g. Flutter, Django, Python',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  onChanged: (val) => setState(() => _name = val),
                  validator: (val) =>
                      (val == null || val.trim().isEmpty) ? 'Skill name cannot be empty!' : null,
                ),
                const SizedBox(height: 16.0),
                const Text('Category', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: ChoiceChip(
                        label: const Center(child: Text('Soft Skill')),
                        selected: _category == 'soft',
                        selectedColor: const Color(0xFF7C3AED),
                        labelStyle: TextStyle(
                          color: _category == 'soft' ? Colors.white : const Color(0xFF1E293B),
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (selected) {
                          if (selected) setState(() => _category = 'soft');
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ChoiceChip(
                        label: const Center(child: Text('Hard Skill')),
                        selected: _category == 'hard',
                        selectedColor: const Color(0xFF7C3AED),
                        labelStyle: TextStyle(
                          color: _category == 'hard' ? Colors.white : const Color(0xFF1E293B),
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (selected) {
                          if (selected) setState(() => _category = 'hard');
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text('Proficiency Score: ${_score.toStringAsFixed(1)} / 10.0',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Slider(
                  value: _score,
                  min: 0.0,
                  max: 10.0,
                  divisions: 20,
                  activeColor: const Color(0xFF7C3AED),
                  label: _score.toStringAsFixed(1),
                  onChanged: (val) => setState(() => _score = val),
                ),
                const SizedBox(height: 12.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Display Order',
                    hintText: 'e.g. 1',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                  keyboardType: TextInputType.number,
                  initialValue: '0',
                  onChanged: (val) => setState(() => _order = int.tryParse(val) ?? 0),
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7C3AED),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
                    ),
                    onPressed: _isSubmitting ? null : _submit,
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'Save Skill',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
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
}
