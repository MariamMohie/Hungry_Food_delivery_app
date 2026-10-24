import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';

class AddAndRemoveCardItem extends StatelessWidget {
  const AddAndRemoveCardItem({super.key, required this.icon, this.onTap});
  final IconData icon;
  final Function()? onTap;
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.primary,
                          ),
                          child:  Icon(icon , size: 20, color:Colors.white,),
                        ),
    );
  }
}