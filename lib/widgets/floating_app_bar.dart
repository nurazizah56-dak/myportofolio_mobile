import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/utils/web_history.dart';
import 'package:provider/provider.dart';

// Komponen AppBar melayang berbentuk kapsul/pill dengan sudut melengkung
// Menampilkan tombol kembali / hamburger drawer, judul halaman, dan avatar inisial
class FloatingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? showBackButton;
  final VoidCallback? onBack;
  final Color? accentColor;

  const FloatingAppBar({
    super.key,
    required this.title,
    this.showBackButton,
    this.onBack,
    this.accentColor,
  });

  /// True when this bar is showing the Home/root page.
  bool get isHome => title == 'MyPortfolio';

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
            // Tombol Navigasi: Back jika bukan root (isHome == false), atau Hamburger jika di root
            Builder(
              builder: (BuildContext context) {
                final bool isHome = title == 'MyPortfolio';
                final bool shouldShowBack = showBackButton ?? (!isHome);

                if (shouldShowBack) {
                  return IconButton(
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
                    onPressed: onBack ?? () => appNavigateBack(context),
                    tooltip: 'Back',
                  );
                }

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

            // Tombol langsung ke Home jika berada di sub-halaman
            if (!isHome)
              IconButton(
                icon: Icon(Icons.home_rounded,
                    color: accentColor ?? const Color(0xFF1D4ED8)),
                tooltip: 'Home',
                onPressed: () {
                  context.go('/');
                },
              ),

            // Tombol Drawer tambahan jika berada di sub-halaman yang memiliki drawer
            Builder(
              builder: (BuildContext context) {
                final bool canPop = Navigator.canPop(context);
                final bool isHome = title == 'MyPortfolio';
                final bool shouldShowBack =
                    showBackButton ?? (!isHome || canPop);
                final bool hasDrawer =
                    Scaffold.maybeOf(context)?.hasDrawer ?? false;

                if (shouldShowBack && hasDrawer) {
                  return IconButton(
                    icon: const Icon(Icons.menu,
                        color: Color(0xFF1E293B), size: 22),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            // Tombol "Masuk" jika belum login, atau Avatar "NA" jika sudah login
            Builder(
              builder: (context) {
                final auth = context.watch<AuthState>();
                if (!auth.isLoggedIn) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor ?? const Color(0xFF1D4ED8),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        context.push('/login');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }

                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    if (!isHome) {
                      context.go('/');
                    }
                  },
                  child: Container(
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
