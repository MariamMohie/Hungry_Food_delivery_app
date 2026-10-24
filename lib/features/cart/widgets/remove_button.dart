import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_text.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.primary, 
                          ) ,
                      child: const Center(
                        child: CustomText(text: 'Remove', weight: FontWeight.bold, color: Colors.white, size: 17,),)
                  
                      ),
    );
  }
}