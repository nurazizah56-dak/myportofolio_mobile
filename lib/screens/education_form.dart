import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

// Halaman formulir untuk menambahkan riwayat pendidikan (Education)
// Menggunakan StatefulWidget karena memerlukan pengelolaan state input form
class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  // Global key untuk mengakses, memvalidasi, dan mereset state form
  final _formKey = GlobalKey<FormState>();

  // Variabel untuk menyimpan nilai input dari setiap field
  String _institutionName = '';
  String _degree = 'Bachelor (S1)';
  String _customDegree = '';
  String _location = '';
  String _startYear = '';
  String _endYear = '';
  String _mapsUrl = '';
  String _logo = '';

  // Helper widget to build each degree chip item
  Widget _buildDegreeChip(String shortCode, String fullName) {
    final bool isSelected = _degree == fullName;
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            setState(() {
              _degree = fullName;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1D4ED8) : Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF1D4ED8)
                    : const Color(0xFFCBD5E1),
                width: 1.2,
              ),
            ),
            child: Text(
              shortCode,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF1E293B),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 12.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Interactive 2-row Degree Chips matching user design specification
  Widget _buildDegreeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Degree',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            _buildDegreeChip('SD', 'Elementary School (SD)'),
            const SizedBox(width: 6.0),
            _buildDegreeChip('SMP', 'Junior High School (SMP)'),
            const SizedBox(width: 6.0),
            _buildDegreeChip('SMA/SMK', 'High School / Vocational (SMA/SMK)'),
            const SizedBox(width: 6.0),
            _buildDegreeChip('D3/D4', 'Diploma (D3/D4)'),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            _buildDegreeChip('S1', 'Bachelor (S1)'),
            const SizedBox(width: 6.0),
            _buildDegreeChip('S2', 'Master (S2)'),
            const SizedBox(width: 6.0),
            _buildDegreeChip('S3', 'Doctorate (S3)'),
            const SizedBox(width: 6.0),
            _buildDegreeChip('Other', 'Other'),
          ],
        ),
        if (_degree == 'Other') ...[
          const SizedBox(height: 10.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'e.g. Professional Certification, Bootcamp',
              labelText: 'Specify Other Degree',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _customDegree = value ?? '';
              });
            },
            validator: (String? value) {
              if (_degree == 'Other' && (value == null || value.trim().isEmpty)) {
                return 'Please specify your degree!';
              }
              return null;
            },
          ),
        ],
        const SizedBox(height: 8.0),
        Text(
          _degree == 'Other' && _customDegree.trim().isNotEmpty
              ? 'Selected: Other ($_customDegree)'
              : 'Selected: $_degree',
          style: const TextStyle(
            fontSize: 12.0,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Education Form',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
            letterSpacing: -0.5,
          ),
        ),
        // 3-line hamburger menu icon to open drawer without back button redundancy
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        // Clean white AppBar consistent with the rest of the application
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        elevation: 0,
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.transparent,
      ),
      // Drawer navigasi konsisten di seluruh halaman aplikasi
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
                // === Institution Name ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Universitas Indonesia',
                      labelText: 'Institution Name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _institutionName = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Institution name cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),

                // === Degree Chips (Replaces Dropdown) ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildDegreeSelector(),
                ),

                // === Location ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Depok, West Java',
                      labelText: 'Location',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _location = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Location cannot be empty!';
                      }
                      return null;
                    },
                  ),
                ),

                // === Start Year ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '2024',
                      labelText: 'Start Year',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _startYear = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Start year cannot be empty!';
                      }
                      if (int.tryParse(value.trim()) == null) {
                        return 'Please enter a valid year number!';
                      }
                      return null;
                    },
                  ),
                ),

                // === End Year (opsional, kosongkan jika masih studi) ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '2028',
                      labelText: 'End Year (leave blank if ongoing)',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _endYear = value!;
                      });
                    },
                  ),
                ),

                // === Google Maps URL (opsional) ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      hintText: 'https://maps.google.com/...',
                      labelText: 'Google Maps URL',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _mapsUrl = value!;
                      });
                    },
                  ),
                ),

                // === Logo URL (opsional) ===
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      hintText: 'https://.../logo.png',
                      labelText: 'Logo URL',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _logo = value!;
                      });
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
                        backgroundColor: const Color(0xFF1D4ED8), // Royal Blue Education theme
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      onPressed: () {
                      // Validasi seluruh field yang memiliki validator
                      if (_formKey.currentState!.validate()) {
                        // Tampilkan pop-up konfirmasi dengan data yang dimasukkan
                        showDialog(
                          context: context,
                          builder: (context) {
                            // Tentukan teks gelar yang ditampilkan (termasuk deskripsi kustom jika Other)
                            final displayDegree =
                                _degree == 'Other' && _customDegree.trim().isNotEmpty
                                    ? 'Other ($_customDegree)'
                                    : _degree;

                            // Bangun daftar hanya untuk field yang terisi
                            final rows = <Widget>[
                              _dialogRow('Institution', _institutionName),
                              _dialogRow('Degree', displayDegree),
                              _dialogRow('Location', _location),
                              _dialogRow('Start Year', _startYear),
                              if (_endYear.trim().isNotEmpty)
                                _dialogRow('End Year', _endYear)
                              else
                                _dialogRow('Status', 'Ongoing'),
                              if (_mapsUrl.trim().isNotEmpty)
                                _dialogRow('Maps URL', _mapsUrl),
                              if (_logo.trim().isNotEmpty)
                                _dialogRow('Logo URL', _logo),
                            ];

                            return AlertDialog(
                              // Batasi lebar dialog agar tidak meregang di desktop
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
                                      color: Color(0xFF38BDF8), size: 22),
                                  SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      'Education Added!',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: rows,
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    // Tutup dialog dan reset form
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _institutionName = '';
                                      _degree = 'Bachelor (S1)';
                                      _customDegree = '';
                                      _location = '';
                                      _startYear = '';
                                      _endYear = '';
                                      _mapsUrl = '';
                                      _logo = '';
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

  // Helper: baris label + nilai yang compact untuk AlertDialog
  Widget _dialogRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
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
