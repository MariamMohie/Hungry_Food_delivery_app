import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_button.dart';
import 'package:hungery/shared/custom_text.dart';

class AddToCartRow extends StatelessWidget {
  const AddToCartRow({super.key, required this.price, required this.textForCustomButton,  required this.onPressed, required this.text});
 final String text;
 final String price;
 final String textForCustomButton;
 final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: text,
                        size: 17,
                        weight: FontWeight.w700,
                      ),
                      CustomText(
                        text: '\$$price',
                        size: 26,
                        weight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                  CustomButton(text: textForCustomButton, onPressed: onPressed),
                ],
              );
  }
}