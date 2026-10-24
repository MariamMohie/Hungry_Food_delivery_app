import 'package:flutter/material.dart';
import 'package:hungery/shared/custom_text.dart';

class AuthSwitchText extends StatelessWidget {
  const AuthSwitchText({
    super.key,
    required this.prefixText,
    required this.actionText,
    required this.onPressed,
  });

  final String prefixText;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: prefixText,
          color: Colors.white,
          size: 16,
          weight: FontWeight.w600,
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            actionText,
            style: const TextStyle(
              color: Color.fromARGB(255, 237, 214, 10),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
