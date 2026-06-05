import 'package:shared_preferences/shared_preferences.dart';
import 'user_role.dart';

class SessionManager {
  static const _isLoggedInKey = "is_logged_in";
  static const _roleKey = "user_role";

  static Future<void> saveSession(UserRole role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, true);
    await prefs.setString(_roleKey, role.name);
  }

  static Future<UserRole?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    final roleString = prefs.getString(_roleKey);

    if (roleString == null) return null;

    return UserRole.values.firstWhere(
      (e) => e.name == roleString,
    );
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}