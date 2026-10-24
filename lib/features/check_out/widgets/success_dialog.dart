import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/core/utils/extentions.dart';
import 'package:hungery/shared/custom_button.dart';
import 'package:hungery/shared/custom_text.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
                  backgroundColor: Colors.transparent,
                  child: Container(
                    width: 400,

                    decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 400,
                    child: Column(
                      children: [
                        Gap(30),
                        CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 40,
                          child: Image.asset(
                            'assets/images/success.png',
                            width: 50,
                          ),
                        ),

                        Gap(40),
                        Image.asset('assets/images/sucesstext.png', width: 150),
                        Gap(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: CustomText(
                            text:
                                'Your payment was successful. A receipt for this purchase has been sent to your email.',
                            size: 16,
                            weight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Gap(40),
                        CustomButton(
                          text: 'Go Back',
                          onPressed: () {
                            context.popBackScreen();
                          },
                          width: 220,
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                );
  }
}