import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthState>().isLoggedIn;

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1D4ED8), // Royal Blue atas
                  Color(0xFF3B82F6), // Blue mid
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Portfolio',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Manage and track your education, skills, and personal portfolio!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              context.go('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder_outlined),
            title: const Text('Projects'),
            onTap: () {
              Navigator.pop(context);
              context.push('/projects');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text('Add Project'),
            onTap: () async {
              Navigator.pop(context);
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn || !context.mounted) return;
              context.pushReplacement('/project-form');
            },
          ),
          ListTile(
            leading: const Icon(Icons.school_outlined),
            title: const Text('Education'),
            onTap: () {
              Navigator.pop(context);
              context.push('/educations');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Education'),
            onTap: () async {
              Navigator.pop(context);
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn || !context.mounted) return;
              context.pushReplacement('/education-form');
            },
          ),
          ListTile(
            leading: const Icon(Icons.lightbulb_outline),
            title: const Text('Skills'),
            onTap: () {
              Navigator.pop(context);
              context.push('/skills');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_task),
            title: const Text('Add Skill'),
            onTap: () async {
              Navigator.pop(context);
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn || !context.mounted) return;
              context.pushReplacement('/skill-form');
            },
          ),
          ListTile(
            leading: const Icon(Icons.work_outline),
            title: const Text('Experience'),
            onTap: () {
              Navigator.pop(context);
              context.push('/experiences');
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add_outlined),
            title: const Text('Add Experience'),
            onTap: () async {
              Navigator.pop(context);
              final loggedIn = await ensureLoggedIn(context);
              if (!loggedIn || !context.mounted) return;
              context.pushReplacement('/experience-form');
            },
          ),
          const Divider(),
          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context);
                context.push('/login');
              },
            )
          else
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                final messenger = ScaffoldMessenger.of(context);
                final auth = context.read<AuthState>();
                Navigator.pop(context);
                await auth.logout();
                messenger
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Logged out successfully!')),
                  );
              },
            ),
        ],
      ),
    );
  }
}
