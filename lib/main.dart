import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportofolio_mobile/menu.dart';

void main() {
  // Titik masuk utama (entry point) aplikasi Flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp menginisialisasi tema global, sistem navigasi, dan tipografi
    return MaterialApp(
      title: 'MyPortfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Konfigurasi palet tema Material 3 selaras dengan portofolio web
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1D4ED8),
          primary: const Color(0xFF1D4ED8),
        ),
        useMaterial3: true,
        // Penerapan tipografi global menggunakan Plus Jakarta Sans
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // Halaman menu utama portofolio
      home: MyHomePage(),
    );
  }
}
