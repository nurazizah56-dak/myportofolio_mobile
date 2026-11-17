import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/item_card.dart';

// Halaman utama portofolio — menampilkan profil pemilik dan menu navigasi
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = '2506547935';
  final String nama = 'Nur Azizah';
  final String kelas = 'PBP A';

  final List<ItemHomepage> items = [
    // Kelompok Modul Education
    ItemHomepage(
      'Lihat Education',
      Icons.school,
      const Color(0xFF1D4ED8), // Deep Royal Blue
      textColor: Colors.white,
    ),
    ItemHomepage(
      'Tambah Education',
      Icons.add_circle,
      const Color(0xFF38BDF8), // Vibrant Sky Blue
      textColor: const Color(0xFF0F172A), // Dark Navy
    ),
    // Modul Skills
    ItemHomepage(
      'Lihat Skills',
      Icons.lightbulb_outline,
      const Color(0xFF7C3AED), // Rich Violet Purple
      textColor: Colors.white,
    ),
    // Kelompok Modul Experience
    ItemHomepage(
      'Lihat Experience',
      Icons.work,
      const Color(0xFF047857), // Deep Forest Emerald
      textColor: Colors.white,
    ),
    ItemHomepage(
      'Tambah Experience',
      Icons.note_add,
      const Color(0xFF34D399), // Fresh Mint
      textColor: const Color(0xFF0F172A), // Dark Navy
    ),
    // Modul Sistem
    ItemHomepage(
      'Logout',
      Icons.logout,
      const Color(0xFFBE123C), // Deep Crimson Rose
      textColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
            letterSpacing: -0.5,
          ),
        ),
        // Putih bersih 
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        elevation: 0,
        shadowColor: Colors.black12,
        surfaceTintColor: Colors.transparent,
      ),
      drawer: const LeftDrawer(),
      backgroundColor: const Color(0xFFEFF6FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16.0 : 24.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8.0),

              // Row 3 InfoCard profil pemilik portofolio
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: nama),
                  InfoCard(title: 'Class', content: kelas),
                ],
              ),
              const SizedBox(height: 24.0),

              // Greeting Text
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Selamat datang di MyPortfolio Mobile!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 19.0,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),

              // GridView 6 Kartu Tombol (Responsif & Anti-Overflow di Layar Sempit 360px)
              GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: isMobile ? 10 : 16,
                mainAxisSpacing: isMobile ? 10 : 16,
                crossAxisCount: 3,
                childAspectRatio: isMobile ? 0.78 : 1.1,
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget kartu profil reusable untuk menampilkan NPM, Nama, dan Kelas
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.6,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            content,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFF475569),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
