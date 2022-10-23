

import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed:onPressed,
        child: Text(text, style: const TextStyle(fontSize: 17)),
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: buttonColor))),
      ),
    );
  }
}
