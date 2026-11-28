import 'package:flutter/foundation.dart';

/// Base URL of the Django REST Framework backend.
/// Defaults to `http://localhost:8000` on Web / Chrome, and `http://10.0.2.2:8000` on Android Emulator.
/// Can be overridden with `--dart-define=API_BASE_URL=...`
const String _envBaseUrl = String.fromEnvironment('API_BASE_URL');

final String apiBaseUrl = _envBaseUrl.isNotEmpty
    ? _envBaseUrl
    : (kIsWeb ? 'http://localhost:8000' : 'http://10.0.2.2:8000');
