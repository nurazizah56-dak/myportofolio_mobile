import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportofolio_mobile/models/education.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/models/skill.dart';
import 'package:myportofolio_mobile/screens/education_detail_screen.dart';
import 'package:myportofolio_mobile/screens/education_form.dart';
import 'package:myportofolio_mobile/screens/education_list_screen.dart';
import 'package:myportofolio_mobile/screens/experience_detail_screen.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/experience_list_screen.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_detail_screen.dart';
import 'package:myportofolio_mobile/screens/project_form_screen.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/screens/skill_detail_screen.dart';
import 'package:myportofolio_mobile/screens/skill_form.dart';
import 'package:myportofolio_mobile/screens/skill_list_screen.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

/// GoRouter configuration.
/// 
/// Alasan migrasi dari Navigator 1.0 ke GoRouter:
/// MaterialApp(routes:) + Navigator 1.0 secara default memanggil
/// SystemNavigator.selectSingleEntryHistory(), sehingga browser hanya punya
/// 1 history entry dan Back Chrome langsung keluar dari localhost.
/// 
/// GoRouter (via MaterialApp.router) menggunakan Router API yang sinkron
/// dengan browser history secara native — setiap context.push() menambah
/// 1 browser history entry, sehingga Back Chrome = pop alami.
GoRouter _buildRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => MyHomePage(),
      ),
      // Education
      GoRoute(
        path: '/educations',
        name: 'educations',
        builder: (context, state) => const EducationListScreen(),
      ),
      GoRoute(
        path: '/education-detail',
        name: 'education-detail',
        builder: (context, state) {
          final education = state.extra! as Education;
          return EducationDetailScreen(education: education);
        },
      ),
      GoRoute(
        path: '/education-form',
        name: 'education-form',
        builder: (context, state) => const EducationFormPage(),
      ),
      // Experience
      GoRoute(
        path: '/experiences',
        name: 'experiences',
        builder: (context, state) => const ExperienceListScreen(),
      ),
      GoRoute(
        path: '/experience-detail',
        name: 'experience-detail',
        builder: (context, state) {
          final experience = state.extra! as Experience;
          return ExperienceDetailScreen(experience: experience);
        },
      ),
      GoRoute(
        path: '/experience-form',
        name: 'experience-form',
        builder: (context, state) => const ExperienceFormPage(),
      ),
      // Skills
      GoRoute(
        path: '/skills',
        name: 'skills',
        builder: (context, state) => const SkillListScreen(),
      ),
      GoRoute(
        path: '/skill-detail',
        name: 'skill-detail',
        builder: (context, state) {
          final skill = state.extra! as Skill;
          return SkillDetailScreen(skill: skill);
        },
      ),
      GoRoute(
        path: '/skill-form',
        name: 'skill-form',
        builder: (context, state) => const SkillFormPage(),
      ),
      // Projects
      GoRoute(
        path: '/projects',
        name: 'projects',
        builder: (context, state) => const ProjectListScreen(),
      ),
      GoRoute(
        path: '/project-detail',
        name: 'project-detail',
        builder: (context, state) {
          final project = state.extra! as Project;
          return ProjectDetailScreen(project: project);
        },
      ),
      GoRoute(
        path: '/project-form',
        name: 'project-form',
        builder: (context, state) => const ProjectFormScreen(),
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  MyApp({ApiClient? apiClient, super.key})
      : apiClient = apiClient ?? ApiClient();

  final ApiClient apiClient;
  late final GoRouter _router = _buildRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiClient>.value(value: apiClient),
        ChangeNotifierProvider<AuthState>(
          create: (_) => AuthState(apiClient),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'MyPortfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF1D4ED8),
            primary: const Color(0xFF1D4ED8),
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.plusJakartaSansTextTheme(),
        ),
      ),
    );
  }
}
