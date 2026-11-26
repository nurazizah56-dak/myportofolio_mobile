import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/education_form.dart';
import 'package:myportofolio_mobile/screens/education_list_screen.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/experience_list_screen.dart';
import 'package:myportofolio_mobile/screens/project_form_screen.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/screens/skill_form.dart';
import 'package:myportofolio_mobile/screens/skill_list_screen.dart';
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
            // Navigate ke halaman yang sesuai dengan named route untuk riwayat browser Chrome
            if (item.name == 'View Education') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/educations'),
                  builder: (context) => const EducationListScreen(),
                ),
              );
            } else if (item.name == 'Add Education' ||
                item.name == 'Tambah Education') {
              final navigator = Navigator.of(context);
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn || !navigator.mounted) return;
              navigator.push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/education'),
                  builder: (context) => const EducationFormPage(),
                ),
              );
            } else if (item.name == 'View Skills') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/skills'),
                  builder: (context) => const SkillListScreen(),
                ),
              );
            } else if (item.name == 'Add Skill' || item.name == 'Add Skills') {
              final navigator = Navigator.of(context);
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn || !navigator.mounted) return;
              navigator.push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/skill-form'),
                  builder: (context) => const SkillFormPage(),
                ),
              );
            } else if (item.name == 'View Experience') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/experiences'),
                  builder: (context) => const ExperienceListScreen(),
                ),
              );
            } else if (item.name == 'Add Experience' ||
                item.name == 'Tambah Experience') {
              final navigator = Navigator.of(context);
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn || !navigator.mounted) return;
              navigator.push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/experience'),
                  builder: (context) => const ExperienceFormPage(),
                ),
              );
            } else if (item.name == 'View Projects') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/projects'),
                  builder: (context) => const ProjectListScreen(),
                ),
              );
            } else if (item.name == 'Add Project') {
              final navigator = Navigator.of(context);
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn || !navigator.mounted) return;
              navigator.push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/project-form'),
                  builder: (context) => const ProjectFormScreen(),
                ),
              );
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
