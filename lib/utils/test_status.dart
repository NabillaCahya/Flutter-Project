import 'package:shared_preferences/shared_preferences.dart';

class TestStatus {
  // Keys
  static const String keyIsLoggedIn = 'isLoggedIn';
  static const String keyUserName = 'userName';
  static const String keyUserEmail = 'userEmail';
  static const String keyHasCompletedTest = 'hasCompletedTest';
  static const String keyLastPage = 'lastPage';
  static const String keyTestResult = 'testResult';

  // Save login state
  static Future<void> saveLoginState({
  required String userName,
  required String userEmail,
}) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(keyIsLoggedIn, true);
  await prefs.setString(keyUserName, userName);
  await prefs.setString(keyUserEmail, userEmail);
  await prefs.setString('userId', userEmail); // penting!
  // Jangan set ulang status tes di sini!
}

  // Save test completion
  static Future<void> saveTestCompletion({
    required String userEmail,
    required String result,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedTest_$userEmail', true);
    await prefs.setString('lastPage_$userEmail', 'home_after_test');
    await prefs.setString('testResult_$userEmail', result);
  }

  // Get app state
  static Future<Map<String, dynamic>> getAppState(String userEmail) async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'isLoggedIn': prefs.getBool(keyIsLoggedIn) ?? false,
      'hasCompletedTest': prefs.getBool('hasCompletedTest_$userEmail') ?? false,
      'userName': prefs.getString(keyUserName),
      'userEmail': prefs.getString(keyUserEmail),
      'testResult': prefs.getString('testResult_$userEmail'),
      'lastPage': prefs.getString('lastPage_$userEmail'),
    };
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsLoggedIn, false);
  }

  // Clear all data (for logout)
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}



Future<void> printAllPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  print('isLoggedIn: ${prefs.getBool('isLoggedIn')}');
  print('userName: ${prefs.getString('userName')}');
  print('userEmail: ${prefs.getString('userEmail')}');
  print('hasCompletedTest: ${prefs.getBool('hasCompletedTest')}');
  print('lastPage: ${prefs.getString('lastPage')}');
  print('testResult: ${prefs.getString('testResult')}');
  print('users: ${prefs.getStringList('users')}');
}