import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/logo.svg',
                              color: AppColors.secondary,
                              height: 35,
                            ),
                            Gap(5),
                            CustomText(
                              text: 'Hello , Mariam Mohie 👋',
                              size: 16,
                              weight: FontWeight.w600,
                              color: AppColors.colorWhite,
                            ),
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: AppColors.primary,
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: AppColors.primary,
                            backgroundImage: AssetImage(
                              'assets/images/profile_pic.jpg',)
                            ),
                        ),
                      ],
                    );
  }
}