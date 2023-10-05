import 'package:flutter/material.dart';
import '../api/user_api.dart';
import '../models/user_data.dart';
import '../widgets/wave_app_bar.dart';
import '../widgets/wave_input_field.dart';
import '../widgets/wave_simple_button.dart';
import '../widgets/wave_style_text.dart';
import '../api/storage_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WaveAppBar(deviceWidth: deviceWidth, deviceHeight: deviceHeight),
            SizedBox(height: deviceHeight * 0.05),
            _buildMenu(deviceWidth),
            SizedBox(height: deviceHeight * 0.05),
            WaveSimpleButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/register");
                },
                text: "Don`t have an account? Register!",
                fontSize: 18),
          ],
        ),
      ),
    );
  }

  Column _buildMenu(double deviceWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const WaveStyleText(
          text: "Log in",
          fontSize: 32,
        ),
        const SizedBox(height: 10),
        WaveInputField(
          icon: const Icon(
            Icons.mail,
            size: 35,
            color: Colors.white,
          ),
          controller: controllerEmail,
          width: deviceWidth * 0.8,
          hintText: "email",
        ),
        const SizedBox(height: 10),
        WaveInputField(
          icon: const Icon(
            Icons.password,
            size: 35,
            color: Colors.white,
          ),
          controller: controllerPassword,
          width: deviceWidth * 0.8,
          obscureText: true,
          hintText: "password",
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () async {
            UserData? user = await UserApi.login(
              controllerEmail.text,
              controllerPassword.text,
            );
            if (user == null) return; // TODO: Add snackbar in future
            StorageApi.write("UserData", user.toRawJson());
          },
          child: const WaveStyleText(
            text: "Login",
            fontSize: 26,
          ),
        ),
      ],
    );
  }
}
