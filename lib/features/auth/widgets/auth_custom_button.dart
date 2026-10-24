import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_text.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton({super.key, required this.onTap, required this.text,  this.buttonColor, this.textColor, this.width,});
   final Function()? onTap;
   final String text ;
   final Color ?buttonColor;
   final Color? textColor;
   final  double? width;

  
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: buttonColor?? AppColors.colorWhite,
                        border: Border.all(color: const Color.fromARGB(255, 143, 14, 4), width: 2)
                      ),
                      height: 55,

                      width: width?? 370,
                      child: Center(
                        child: CustomText(
                          text: text,
                          color: textColor?? AppColors.primary,
                          weight: FontWeight.w700,
                          size: 18,
                        ),
                      ),
                    ),
                  );
  }
}