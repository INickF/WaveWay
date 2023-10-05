import 'package:flutter/material.dart';
import 'pages/registration_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'api/storage_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userData = await StorageApi.read("UserData");
  print(userData);

  runApp(const WaveWayApp());
}

class WaveWayApp extends StatelessWidget {
  const WaveWayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WaveWay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const LoginPage(),
          "/login": (context) => const LoginPage(),
          "/register": (context) => const RegistrationPage(),
          "/main": (context) => const MainPage(),
        });
  }
}
