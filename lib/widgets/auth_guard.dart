import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

/// Ensures the user is authenticated before accessing a protected route.
///
/// Opens /login via GoRouter (context.push) so Chrome Back works on the Login page.
/// After successful login, [item_card.dart] and [left_drawer.dart] use
/// context.pushReplacement('/...-form') so the history becomes:
///   [/] → (login replaces itself with form) → [/...-form]
/// Pressing Chrome Back from the form returns directly to Home — not to Login.
Future<bool> ensureLoggedIn(BuildContext context) async {
  if (context.read<AuthState>().isLoggedIn) return true;
  final loggedIn = await context.push<bool>('/login');
  return loggedIn ?? false;
}
