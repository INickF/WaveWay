import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:waveway/api/storage_api.dart';
import '../models/user_data.dart';
import '../widgets/wave_simple_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.userData});

  final UserData userData;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late UserData userData;

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(userData.toRawJson()),
          WaveSimpleButton(
              onPressed: () async {
                await StorageApi.delete("UserData");
                if (mounted) Navigator.of(context).pushReplacementNamed("/login");
              },
              text: "remove this data"),
        ],
      ),
    );
  }
}
