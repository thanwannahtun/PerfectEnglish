import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AuthService extends ChangeNotifier {
  static final AuthService instance = AuthService._internal();
  AuthService._internal();

  static const String _keyToken = 'auth_token';
  static const String _keyRefreshToken = 'auth_refresh_token';
  static const String _keyUser = 'auth_user';

  final Dio _dio =
      Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 20),
            headers: {'Content-Type': 'application/json'},
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        );

  // String get baseUrl => 'http://192.168.0.143:3000/api';
  String get baseUrl => 'http://192.168.99.122:3000/api';

  String? _token;
  String? _refreshToken;
  Map<String, dynamic>? _currentUser;
  bool _initialized = false;

  bool get isLoggedIn => _token != null && _token!.isNotEmpty;
  String? get token => _token;
  String? get refreshToken => _refreshToken;
  Map<String, dynamic>? get currentUser => _currentUser;
  String get userName =>
      _currentUser?['name'] ??
      _currentUser?['email']?.split('@').first ??
      'User';
  String get userEmail => _currentUser?['email'] ?? '';

  /// Initialize auth state from SharedPreferences
  Future<void> initialize() async {
    if (_initialized) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString(_keyToken);
      _refreshToken = prefs.getString(_keyRefreshToken);
      final userStr = prefs.getString(_keyUser);
      if (userStr != null) {
        _currentUser = jsonDecode(userStr) as Map<String, dynamic>?;
      }
      _initialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint('Error initializing AuthService: $e');
    }
  }

  /// Register a new user
  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/auth/register',
        data: jsonEncode({
          'email': email.trim(),
          'password': password,
          if (name != null && name.trim().isNotEmpty) 'name': name.trim(),
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data as Map);
        await _saveAuthSession(data);
        return {'success': true, 'user': _currentUser};
      }
      return {'success': false, 'error': 'Registration failed.'};
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      return {'success': false, 'error': errorMsg};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  /// Login with email & password
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/auth/login',
        data: jsonEncode({'email': email.trim(), 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data as Map);
        await _saveAuthSession(data);
        return {'success': true, 'user': _currentUser};
      }
      return {'success': false, 'error': 'Login failed.'};
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessage(e);
      return {'success': false, 'error': errorMsg};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  /// Refresh access token using stored refresh token
  Future<bool> refreshAccessToken() async {
    if (_refreshToken == null) return false;
    try {
      final response = await _dio.post(
        '$baseUrl/auth/refresh',
        data: jsonEncode({'refreshToken': _refreshToken}),
      );

      if (response.statusCode == 200) {
        final data = Map<String, dynamic>.from(response.data as Map);
        await _saveAuthSession(data);
        return true;
      }
    } catch (e) {
      debugPrint('Token refresh failed: $e');
      await logout();
    }
    return false;
  }

  /// Logout current device
  Future<void> logout() async {
    if (_token != null && _refreshToken != null) {
      try {
        await _dio.post(
          '$baseUrl/auth/logout',
          data: jsonEncode({'refreshToken': _refreshToken}),
          options: Options(headers: {'Authorization': 'Bearer $_token'}),
        );
      } catch (_) {
        // Ignore network errors on logout
      }
    }

    _token = null;
    _refreshToken = null;
    _currentUser = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyToken);
    await prefs.remove(_keyRefreshToken);
    await prefs.remove(_keyUser);

    notifyListeners();
  }

  /// Save session variables to SharedPreferences
  Future<void> _saveAuthSession(Map<String, dynamic> data) async {
    _token = data['token'] as String?;
    _refreshToken = data['refreshToken'] as String?;
    _currentUser = data['user'] as Map<String, dynamic>?;

    final prefs = await SharedPreferences.getInstance();
    if (_token != null) await prefs.setString(_keyToken, _token!);
    if (_refreshToken != null)
      await prefs.setString(_keyRefreshToken, _refreshToken!);
    if (_currentUser != null)
      await prefs.setString(_keyUser, jsonEncode(_currentUser));

    notifyListeners();
  }

  String _extractErrorMessage(DioException e) {
    if (e.response?.data != null) {
      final data = e.response!.data;
      if (data is Map && data['error'] != null) {
        return data['error'].toString();
      }
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.connectionError) {
      return 'Cannot connect to backend server. Please check your network connection.';
    }
    return 'Authentication error occurred. Please try again.';
  }
}
