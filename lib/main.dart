import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'welcome_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'jurusan_kampus.dart';
import 'quiz_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inisialisasi mapping jurusan ke kampus
  initJurusanKampusA();
  initJurusanKampusB();
  initJurusanKampusC();
  initJurusanKampusD();
  initJurusanKampusE();
  initJurusanKampusF();
  initJurusanKampusG();
  initJurusanKampusH();
  initJurusanKampusI();
  initJurusanKampusJ();
  initJurusanKampusK();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Minat Bakat',
      theme: ThemeData(
        primaryColor: const Color(0xFF7B5B6B),
        scaffoldBackgroundColor: const Color(0xFFF8F6F8),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/quiz': (context) => const QuizScreen(),
        // Jangan daftarkan '/home' di sini!
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final userId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => HomeScreen(userId: userId),
          );
        }
        // Tambahkan route lain dengan parameter di sini jika perlu
        return null;
      },
    );
  }
}