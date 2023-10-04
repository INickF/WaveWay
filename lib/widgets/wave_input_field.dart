import 'package:flutter/material.dart';

class WaveInputField extends StatefulWidget {
  const WaveInputField({
    super.key,
    required this.icon,
    required this.controller,
    required this.width,
    this.obscureText = false,
    this.hintText = "",
  });

  final Icon? icon;
  final TextEditingController controller;
  final double? width;
  final bool obscureText;
  final String hintText;

  @override
  State<WaveInputField> createState() => _WaveInputFieldState();
}

class _WaveInputFieldState extends State<WaveInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.cyan.shade200,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.icon != null) widget.icon!,
          if (widget.icon != null) const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  border: InputBorder.none,
                  suffixIcon: widget.obscureText
                      ? IconButton(
                          onPressed: () => setState(() => _obscureText = !_obscureText),
                          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                        )
                      : null,
                ),
                obscureText: _obscureText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
