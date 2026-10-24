import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';

class BackgroundLayer extends StatelessWidget {
  const BackgroundLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.primary,
      child: Column(
        children: [
          const Spacer(),

          /// Bottom Image
          Image.asset(
            'assets/images/splash_image.png',
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}