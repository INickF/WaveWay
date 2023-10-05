import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'pages/registration_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'api/storage_api.dart';
import 'models/user_data.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  UserData? userData;

  final userDataString = await StorageApi.read("UserData");
  if (userDataString != null) userData = UserData.fromRawJson(userDataString);

  print(userDataString);
  print(userData);

  runApp(WaveWayApp(userData: userData));
}

class WaveWayApp extends StatelessWidget {
  const WaveWayApp({super.key, this.userData});

  final UserData? userData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WaveWay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),
        initialRoute: userData == null ? "/login" : "/main",
        routes: {
          "/": (context) => const LoginPage(),
          "/login": (context) => const LoginPage(),
          "/register": (context) => const RegistrationPage(),
          "/main": (context) => MainPage(userData: userData!),
        });
  }
}
