import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static Future<bool> checkLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList('users') ?? [];
    
    return users.any((user) {
      final data = user.split('|||');
      return data[0] == email && data[1] == password;
    });
  }

  static Future<bool> emailExists(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList('users') ?? [];
    
    return users.any((user) => user.split('|||')[0] == email);
  }

  static Future<void> addUser(String email, String password, String name) async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList('users') ?? [];
    users.add('$email|||$password|||$name');
    await prefs.setStringList('users', users);
  }

  static Future<String?> getUserName(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final users = prefs.getStringList('users') ?? [];
    
    final userString = users.firstWhere(
      (user) => user.split('|||')[0] == email,
      orElse: () => '',
    );
    
    return userString.isNotEmpty ? userString.split('|||')[2] : null;
  }
}