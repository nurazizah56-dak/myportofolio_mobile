import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

// Model data untuk setiap tombol aksi pada halaman utama
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;
  final Color textColor;

  ItemHomepage(
    this.name,
    this.icon,
    this.color, {
    this.textColor = Colors.white,
  });
}

// Widget kartu tombol aksi yang reusable untuk seluruh modul portofolio
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: item.color.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: item.color,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (item.name == 'Logout') {
              final auth = context.read<AuthState>();
              if (!auth.isLoggedIn) {
                messenger
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('You are not logged in.')),
                  );
                return;
              }
              await auth.logout();
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Logged out successfully!')),
                );
              return;
            }

            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: const Color(0xFF0F172A),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  content: Text(
                    'You tapped the ${item.name} button!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );

            // Navigasi ke halaman yang sesuai menggunakan go_router
            // context.push() menambah 1 browser history entry → Back Chrome berfungsi
            if (item.name == 'View Education') {
              context.push('/educations');
            } else if (item.name == 'Add Education' ||
                item.name == 'Tambah Education') {
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn) return;
              if (!context.mounted) return;
              context.pushReplacement('/education-form');
            } else if (item.name == 'View Skills') {
              context.push('/skills');
            } else if (item.name == 'Add Skill' || item.name == 'Add Skills') {
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn) return;
              if (!context.mounted) return;
              context.pushReplacement('/skill-form');
            } else if (item.name == 'View Experience') {
              context.push('/experiences');
            } else if (item.name == 'Add Experience' ||
                item.name == 'Tambah Experience') {
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn) return;
              if (!context.mounted) return;
              context.pushReplacement('/experience-form');
            } else if (item.name == 'View Projects') {
              context.push('/projects');
            } else if (item.name == 'Add Project') {
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn) return;
              if (!context.mounted) return;
              context.pushReplacement('/project-form');
            }
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    color: item.textColor == Colors.white
                        ? Colors.white.withOpacity(0.2)
                        : Colors.black.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.icon,
                    color: item.textColor,
                    size: 24.0,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: item.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    height: 1.15,
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
