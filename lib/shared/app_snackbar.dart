import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_text.dart';

SnackBar appSnackBar({
  required String message,
  required bool isSuccess,
}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
    backgroundColor: isSuccess ? Colors.green.shade700 : Colors.red.shade900,
    content: Row(
      children: [
        Icon(
          isSuccess ? Icons.check_circle_outline : Icons.error_outline,
          color: AppColors.colorWhite,
        ),
        const Gap(8),
        Expanded(
          child: CustomText(
            text: message,
            color: AppColors.colorWhite,
            size: 14,
            weight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
