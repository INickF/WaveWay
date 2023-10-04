import 'package:flutter/material.dart';

class WaveStyleText extends StatelessWidget {
  const WaveStyleText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.radius = 15,
  });

  final String text;
  final double fontSize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.cyan.shade200,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ),
    );
  }
}
