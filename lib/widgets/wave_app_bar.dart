import 'package:flutter/material.dart';

class WaveAppBar extends StatelessWidget {
  const WaveAppBar({
    super.key,
    required this.deviceWidth,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      height: deviceHeight * 0.3,
      decoration: BoxDecoration(
        color: Colors.cyan.shade200,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                )),
            child: Image.asset(
              "assets/images/waves.png",
              scale: deviceWidth * 0.01,
            ),
          ),
          SizedBox(width: deviceWidth * 0.05),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("WaveWay", style: TextStyle(fontSize: 36, color: Colors.white)),
              SizedBox(
                height: 5,
              ),
              Text("food delivery", style: TextStyle(fontSize: 24, color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
