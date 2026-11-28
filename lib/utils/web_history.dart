import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'web_history_stub.dart' if (dart.library.html) 'web_history_html.dart';

/// Navigates back in a way that keeps in-app back and browser back
/// continuous and synchronized without pushing duplicate history entries.
///
/// On Web: tells the browser to step backward in its existing history
/// stack (`history.back()`), so subsequent Back Chrome presses do not cause
/// previously popped routes to re-appear.
/// On Mobile / Tests / Fallback: uses `context.pop()` or `context.go('/')`.
void appNavigateBack(BuildContext context) {
  if (kIsWeb) {
    if (context.canPop()) {
      final handled = historyBack();
      if (handled) return;
    }
  }

  if (context.canPop()) {
    context.pop();
  } else {
    context.go('/');
  }
}
