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
  String _degree = 'Sarjana (S1)';
  String _location = '';
  String _startYear = '';
  String _endYear = '';
  String _mapsUrl = '';
  String _logo = '';

  // Pilihan jenjang pendidikan (setara dengan field degree di web Django)
  final List<String> _degreeOptions = [
    'SD / Sederajat',
    'SMP / Sederajat',
    'SMA / SMK / Sederajat',
    'Diploma (D3/D4)',
    'Sarjana (S1)',
    'Magister (S2)',
    'Doktor (S3)',
    'Lainnya',
  ];

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
        // Tombol kembali langsung ke halaman utama
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Putih bersih — konsisten dengan tema AppBar di halaman utama
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        elevation: 0,
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.transparent,
      ),
      // Drawer navigasi konsisten di seluruh halaman aplikasi
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Institution Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Universitas Indonesia',
                    labelText: 'Institution Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _institutionName = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Institution name tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // === Degree (Dropdown, setara Select di web Django) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Degree / Jenjang Pendidikan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: _degree,
                  // Batasi tinggi popup agar tidak memenuhi layar
                  menuMaxHeight: 280,
                  isExpanded: true,
                  items: _degreeOptions
                      .map((degree) => DropdownMenuItem(
                            value: degree,
                            child: Text(degree),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _degree = newValue!;
                    });
                  },
                ),
              ),

              // === Location ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Depok, West Java',
                    labelText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _location = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Lokasi tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // === Start Year ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '2024',
                    labelText: 'Start Year',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _startYear = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Tahun mulai tidak boleh kosong!';
                    }
                    if (int.tryParse(value.trim()) == null) {
                      return 'Masukkan angka tahun yang valid!';
                    }
                    return null;
                  },
                ),
              ),

              // === End Year (opsional, kosongkan jika masih studi) ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '2028',
                    labelText: 'End Year (leave blank if ongoing)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: 'https://maps.google.com/...',
                    labelText: 'Google Maps URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
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
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: 'https://.../logo.png',
                    labelText: 'Logo URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _logo = value!;
                    });
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {
                      // Validasi seluruh field yang memiliki validator
                      if (_formKey.currentState!.validate()) {
                        // Tampilkan pop-up konfirmasi dengan data yang dimasukkan
                        showDialog(
                          context: context,
                          builder: (context) {
                            // Bangun daftar hanya untuk field yang terisi
                            final rows = <Widget>[
                              _dialogRow('Institution', _institutionName),
                              _dialogRow('Degree', _degree),
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
                                      'Education ditambahkan!',
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
                                      _degree = 'Sarjana (S1)';
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
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
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
