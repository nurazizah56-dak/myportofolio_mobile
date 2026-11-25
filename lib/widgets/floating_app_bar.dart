import 'package:flutter/material.dart';

// Komponen AppBar melayang berbentuk kapsul/pill dengan sudut melengkung
// Menampilkan tombol hamburger drawer, judul halaman, dan avatar inisial
class FloatingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const FloatingAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.only(
            top: 10.0, left: 16.0, right: 16.0, bottom: 6.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Tombol garis 3 (hamburger menu) untuk membuka LeftDrawer
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Color(0xFF1E293B)),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            const SizedBox(width: 4.0),

            // Judul halaman
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF1E293B),
                  fontWeight: FontWeight.w800,
                  fontSize: 16.5,
                  letterSpacing: -0.5,
                ),
              ),
            ),

            // Avatar lingkaran inisial profil (NA - Nur Azizah)
            Container(
              margin: const EdgeInsets.only(right: 6.0),
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Color(0xFF0F172A), // Dark navy circle
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text(
                'NA',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 12.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
