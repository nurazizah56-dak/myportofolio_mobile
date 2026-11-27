import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myportofolio_mobile/config.dart';
import 'package:myportofolio_mobile/models/education.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/models/skill.dart';

/// Exception thrown when an API request returns a non-2xx status code.
class ApiException implements Exception {
  const ApiException(this.statusCode, this.message);

  final int statusCode;
  final String message;

  @override
  String toString() => 'ApiException($statusCode): $message';
}

/// HTTP client for the MyPortfolio Django REST Framework backend.
class ApiClient {
  ApiClient({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        baseUrl = baseUrl ?? apiBaseUrl;

  final http.Client _client;
  final String baseUrl;

  Uri _uri(String path) => Uri.parse('$baseUrl$path');

  Future<List<Project>> getProjects() async {
    final response = await _client.get(
      _uri('/api/v1/projects/'),
      headers: const {'Accept': 'application/json'},
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as List<dynamic>;
    return decoded
        .map((item) => Project.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Project> createProject(
    Project project, {
    required String token,
  }) async {
    final response = await _client.post(
      _uri('/api/v1/projects/'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: jsonEncode(project.toJson()),
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return Project.fromJson(decoded);
  }

  Future<List<Education>> getEducations() async {
    final response = await _client.get(
      _uri('/api/v1/education/'),
      headers: const {'Accept': 'application/json'},
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as List<dynamic>;
    return decoded
        .map((item) => Education.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Education> createEducation(
    Education education, {
    required String token,
  }) async {
    final response = await _client.post(
      _uri('/api/v1/education/'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: jsonEncode(education.toJson()),
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return Education.fromJson(decoded);
  }

  Future<List<Experience>> getExperiences() async {
    final response = await _client.get(
      _uri('/api/v1/experience/'),
      headers: const {'Accept': 'application/json'},
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as List<dynamic>;
    return decoded
        .map((item) => Experience.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Experience> createExperience(
    Experience experience, {
    required String token,
  }) async {
    final response = await _client.post(
      _uri('/api/v1/experience/'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Token $token',
      },
      body: jsonEncode(experience.toJson()),
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return Experience.fromJson(decoded);
  }

  Future<List<Skill>> getSkills() async {
    http.Response response = await _client.get(
      _uri('/api/v1/skills/'),
      headers: const {'Accept': 'application/json'},
    );
    if (response.statusCode == 404) {
      response = await _client.get(
        _uri('/api/v1/skill/'),
        headers: const {'Accept': 'application/json'},
      );
    }
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as List<dynamic>;
    return decoded
        .map((item) => Skill.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<Skill> createSkill(
    Skill skill, {
    required String token,
  }) async {
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $token',
    };
    final body = jsonEncode(skill.toJson());
    http.Response response = await _client.post(
      _uri('/api/v1/skills/'),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 404) {
      response = await _client.post(
        _uri('/api/v1/skill/'),
        headers: headers,
        body: body,
      );
    }
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return Skill.fromJson(decoded);
  }

  Future<String> obtainToken(String username, String password) async {
    final response = await _client.post(
      _uri('/api/v1/auth/token/'),
      headers: const {
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );
    _ensureSuccess(response);
    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    return decoded['token'] as String;
  }

  Future<void> logout({required String token}) async {
    final response = await _client.post(
      _uri('/api/v1/auth/logout/'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Token $token',
      },
    );
    _ensureSuccess(response);
  }

  void _ensureSuccess(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return;
    }
    throw ApiException(response.statusCode, response.body);
  }
}
