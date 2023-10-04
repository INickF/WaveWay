import 'package:flutter/material.dart';
import 'pages/registration_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const RegistrationPage(),
          "/login": (context) => const LoginPage(),
          "/register": (context) => const RegistrationPage(),
        });
        
  }
}