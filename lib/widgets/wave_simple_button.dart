import 'package:flutter/material.dart';

class WaveSimpleButton extends StatelessWidget {
  const WaveSimpleButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.fontSize = 24,
  });

  final VoidCallback onPressed;
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.cyan.shade400, fontSize: fontSize),
      ),
    );
  }
}
