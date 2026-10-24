import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
  });

  final String text;
  final String icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 154,
        height: 60,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.primary, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(8),
            SvgPicture.asset(
              'assets/images/$icon.svg',
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                iconColor,
                BlendMode.srcIn,
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}
