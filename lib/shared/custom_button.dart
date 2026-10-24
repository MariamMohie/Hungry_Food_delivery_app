import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
  });

  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,     // optional
        height: height ?? 60 ,   // optional
        padding: const EdgeInsets.symmetric(horizontal: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: onPressed == null
              ? Colors.grey.shade400
              : AppColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: CustomText(
          text: text,
          size: 17,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
