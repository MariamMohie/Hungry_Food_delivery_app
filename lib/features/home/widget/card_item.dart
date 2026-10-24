import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.name,
    required this.des,
    required this.rate,
  });

  final String image, name, des, rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // IMAGE + SHADOW
          Stack(
            alignment: Alignment.center,
            children: [
              // Shadow (under image)
              Positioned(
                bottom: -1,
                child: Image.asset(
                  'assets/images/shadow.png',
                  width: 200,
                  height: 35,
                 
                ),
              ),

              // Image
              Image.asset(
                image,
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  size: 16,
                  weight: FontWeight.bold,
                ),
                const Gap(5),
                CustomText(
                  text: des,
                  size: 16,
                  weight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: '⭐ $rate',
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    const Icon(
                      CupertinoIcons.heart,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
