import 'package:flutter/material.dart';

class BackToCalculateButton extends StatelessWidget {
  const BackToCalculateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        "Back To Calculate",
        style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 12,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
