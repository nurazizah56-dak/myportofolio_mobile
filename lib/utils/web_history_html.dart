// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

/// Web implementation that steps the native browser history backward.
bool historyBack() {
  html.window.history.back();
  return true;
}
