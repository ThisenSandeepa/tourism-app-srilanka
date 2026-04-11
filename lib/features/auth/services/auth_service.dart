import 'package:shared_preferences/shared_preferences.dart';

/// AuthService provides authentication functionality.
/// Uses SharedPreferences for demo mode (offline).
/// When Firebase is configured, swap to Firebase Auth methods.
class AuthService {
  static const String _roleKey = 'user_role';
  static const String _nameKey = 'user_name';
  static const String _emailKey = 'user_email';
  static const String _isLoggedInKey = 'is_logged_in';

  // Demo login — stores credentials locally
  Future<bool> signInWithEmail(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    // In demo mode, accept any credentials
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_emailKey, email);
    await prefs.setString(_nameKey, _extractName(email));
    return true;
  }

  Future<bool> signUpWithEmail(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_emailKey, email);
    await prefs.setString(_nameKey, name);
    return true;
  }

  Future<void> signInAsDemo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_emailKey, 'demo@ceylontours.lk');
    await prefs.setString(_nameKey, 'Demo User');
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<String?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }

  Future<void> setUserRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_roleKey, role);
  }

  Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey) ?? 'Guest';
  }

  Future<String> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey) ?? '';
  }

  String _extractName(String email) {
    final parts = email.split('@');
    if (parts.isEmpty) return 'User';
    return parts[0].split('.').map((s) => 
      s.isNotEmpty ? '${s[0].toUpperCase()}${s.substring(1)}' : ''
    ).join(' ');
  }
}
