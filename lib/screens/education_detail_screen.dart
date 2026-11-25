import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/education.dart';
import 'package:myportofolio_mobile/widgets/floating_app_bar.dart';

class EducationDetailScreen extends StatelessWidget {
  const EducationDetailScreen({required this.education, super.key});

  final Education education;

  bool get _isLogoUrl {
    final logo = education.logo?.trim() ?? '';
    return logo.startsWith('http://') || logo.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    final period =
        '${education.startYear} - ${education.isOngoing || education.endYear == null ? 'Present' : education.endYear}';

    return Scaffold(
      appBar: FloatingAppBar(title: education.institutionName),
      backgroundColor: const Color(0xFFEFF6FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_isLogoUrl) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      education.logo!,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: double.infinity,
                        height: 120,
                        color: Colors.grey.shade200,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.school_outlined,
                          size: 48,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ] else if ((education.logo ?? '').trim().isNotEmpty) ...[
                  Text(
                    education.logo!.trim(),
                    style: const TextStyle(fontSize: 36),
                  ),
                  const SizedBox(height: 12),
                ],
                Text(
                  education.institutionName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0F172A),
                      ),
                ),
                const SizedBox(height: 8),
                Chip(
                  label: Text(education.degree),
                  backgroundColor: const Color(0xFFDBEAFE),
                  labelStyle: const TextStyle(
                    color: Color(0xFF1D4ED8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                _detailRow(Icons.calendar_today_outlined, 'Period', period),
                if (education.location.trim().isNotEmpty) ...[
                  const SizedBox(height: 10),
                  _detailRow(
                    Icons.location_on_outlined,
                    'Location',
                    education.location,
                  ),
                ],
                if ((education.mapsUrl ?? '').trim().isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Google Maps URL',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  SelectableText(
                    education.mapsUrl!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: const Color(0xFF1D4ED8)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1E293B),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
