import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthState>().isLoggedIn;

    // Mendapatkan route path saat ini untuk penanda halaman aktif
    String currentPath = '/';
    try {
      currentPath = GoRouterState.of(context).uri.path;
    } catch (_) {
      currentPath = '/';
    }

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header navy dengan avatar inisial NA, nama, dan NPM - Kelas
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 20.0,
              right: 20.0,
              bottom: 22.0,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF0D234A), // Solid dark navy
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar bulat putih dengan inisial NA
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'NA',
                    style: TextStyle(
                      color: Color(0xFF0D234A),
                      fontWeight: FontWeight.w800,
                      fontSize: 16.5,
                    ),
                  ),
                ),
                const SizedBox(height: 14.0),
                // Nama Pemilik
                const Text(
                  'Nur Azizah',
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 3.0),
                // NPM dan Kelas
                const Text(
                  '2506547935 - PBP A',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Menu navigasi lengkap sesuai foto (Home, Kategori: Education, Skills, Experience, Projects)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              children: [
                // 1. Home
                _buildMenuItem(
                  context: context,
                  title: 'Home',
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_rounded,
                  isActive: currentPath == '/',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentPath != '/') {
                      context.go('/');
                    }
                  },
                ),

                // 2. EDUCATION
                _buildCategoryHeader('EDUCATION'),
                _buildMenuItem(
                  context: context,
                  title: 'Education',
                  icon: Icons.school_outlined,
                  activeIcon: Icons.school,
                  isActive: currentPath == '/educations' ||
                      currentPath == '/education-detail',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentPath != '/educations') {
                      context.push('/educations');
                    }
                  },
                ),
                _buildMenuItem(
                  context: context,
                  title: 'Add Education',
                  icon: Icons.add_circle_outline,
                  activeIcon: Icons.add_circle,
                  isActive: currentPath == '/education-form',
                  onTap: () async {
                    Navigator.pop(context);
                    final loggedIn = await ensureLoggedIn(context);
                    if (!loggedIn || !context.mounted) return;
                    context.pushReplacement('/education-form');
                  },
                ),

                // 3. SKILLS
                _buildCategoryHeader('SKILLS'),
                _buildMenuItem(
                  context: context,
                  title: 'Skills',
                  icon: Icons.lightbulb_outline,
                  activeIcon: Icons.lightbulb,
                  isActive: currentPath == '/skills' ||
                      currentPath == '/skill-detail',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentPath != '/skills') {
                      context.push('/skills');
                    }
                  },
                ),
                _buildMenuItem(
                  context: context,
                  title: 'Add Skill',
                  icon: Icons.lightbulb_outline,
                  activeIcon: Icons.lightbulb,
                  isActive: currentPath == '/skill-form',
                  onTap: () async {
                    Navigator.pop(context);
                    final loggedIn = await ensureLoggedIn(context);
                    if (!loggedIn || !context.mounted) return;
                    context.pushReplacement('/skill-form');
                  },
                ),

                // 4. EXPERIENCE
                _buildCategoryHeader('EXPERIENCE'),
                _buildMenuItem(
                  context: context,
                  title: 'Experience',
                  icon: Icons.work_outline,
                  activeIcon: Icons.work,
                  isActive: currentPath == '/experiences' ||
                      currentPath == '/experience-detail',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentPath != '/experiences') {
                      context.push('/experiences');
                    }
                  },
                ),
                _buildMenuItem(
                  context: context,
                  title: 'Add Experience',
                  icon: Icons.note_add_outlined,
                  activeIcon: Icons.note_add,
                  isActive: currentPath == '/experience-form',
                  onTap: () async {
                    Navigator.pop(context);
                    final loggedIn = await ensureLoggedIn(context);
                    if (!loggedIn || !context.mounted) return;
                    context.pushReplacement('/experience-form');
                  },
                ),

                // 5. PROJECTS
                _buildCategoryHeader('PROJECTS'),
                _buildMenuItem(
                  context: context,
                  title: 'Projects',
                  icon: Icons.folder_outlined,
                  activeIcon: Icons.folder,
                  isActive: currentPath == '/projects' ||
                      currentPath == '/project-detail',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentPath != '/projects') {
                      context.push('/projects');
                    }
                  },
                ),
                _buildMenuItem(
                  context: context,
                  title: 'Add Project',
                  icon: Icons.create_new_folder_outlined,
                  activeIcon: Icons.create_new_folder,
                  isActive: currentPath == '/project-form',
                  onTap: () async {
                    Navigator.pop(context);
                    final loggedIn = await ensureLoggedIn(context);
                    if (!loggedIn || !context.mounted) return;
                    context.pushReplacement('/project-form');
                  },
                ),

                const SizedBox(height: 8.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    height: 1.0,
                    color: Color(0xFFE2E8F0),
                  ),
                ),
                const SizedBox(height: 6.0),

                // Tombol Logout merah (atau Login jika belum masuk) di bawah garis pemisah
                if (isLoggedIn)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 2.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(
                        horizontal: 0,
                        vertical: -2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      leading: const Icon(
                        Icons.logout_rounded,
                        color: Color(0xFFDC2626), // Merah
                        size: 20.0,
                      ),
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Color(0xFFDC2626), // Merah
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5,
                        ),
                      ),
                      onTap: () async {
                        final messenger = ScaffoldMessenger.of(context);
                        final auth = context.read<AuthState>();
                        Navigator.pop(context);
                        await auth.logout();
                        messenger
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text('Logged out successfully!'),
                            ),
                          );
                      },
                    ),
                  )
                else
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 2.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(
                        horizontal: 0,
                        vertical: -2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      leading: const Icon(
                        Icons.login_rounded,
                        color: Color(0xFF1D4ED8),
                        size: 20.0,
                      ),
                      title: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF1D4ED8),
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/login');
                      },
                    ),
                  ),
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Header kategori modul berhuruf kapital (EDUCATION, SKILLS, EXPERIENCE, PROJECTS)
  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 12.0, bottom: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF64748B),
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  // Item menu interaktif dengan penanda halaman aktif
  Widget _buildMenuItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required IconData activeIcon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1.5),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFE0EDFF)
            : Colors.transparent, // Biru muda aktif
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        leading: Icon(
          isActive ? activeIcon : icon,
          color: isActive ? const Color(0xFF1D4ED8) : const Color(0xFF334155),
          size: 20.0,
        ),
        title: Text(
          title,
          style: TextStyle(
            color:
                isActive ? const Color(0xFF1D4ED8) : const Color(0xFF1E293B),
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            fontSize: 13.5,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
