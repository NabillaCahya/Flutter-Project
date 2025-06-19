import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_after_test.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final userId = prefs.getString('userId') ?? '';

    if (isLoggedIn && userId.isNotEmpty) {
      final hasCompletedTest = prefs.getBool('hasCompletedTest_$userId') ?? false;
      if (hasCompletedTest) {
        await prefs.setString('lastPage', 'home_after_test');
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (_) => HomeAfterTest(userId: userId),
          ),
        );
      } else {
        await prefs.setString('lastPage', 'home');
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(userId: userId),
          ),
        );
      }
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background_splash.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 180,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }
}