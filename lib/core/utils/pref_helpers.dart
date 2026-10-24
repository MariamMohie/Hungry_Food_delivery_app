import 'package:shared_preferences/shared_preferences.dart';

class PrefHelpers {
  static const String _tokenKey = 'auth_token';

  // Save user token to preferences
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Retrieve user token from preferences
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
   
  }

  // Remove user token from preferences
  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
