import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_text.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/details.png', height: 250),
        Spacer(),
        Column(
          children: [
            Gap(20),
            CustomText(
              text:
                  'Customize Your Burger \n to Your Tastes.\n Ultimate Experience',
            ),
            Gap(40),
            Slider(
              activeColor: AppColors.primary,
              inactiveColor: Colors.grey[300],
              min: 0,
              max: 1,
              value: value,
              onChanged: onChanged,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: '🧊'),
                Gap(120),
                CustomText(text: '🌶️'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
