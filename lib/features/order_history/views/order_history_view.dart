import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/features/auth/widgets/auth_custom_button.dart';
import 'package:hungery/shared/common_background.dart';
import 'package:hungery/shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
        
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.colorWhite,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 25.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/test.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Gap(25),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomText(
                                text: 'Hamburger Deluxe ',
                                weight: FontWeight.bold,
                                size: 18,
                              ),
                              Gap(5),
                              CustomText(
                                text: 'Quantity: X2',
                                weight: FontWeight.w500,
                                size: 16,
                              ),
                              Gap(5),
                              CustomText(
                                text: 'Price: 15.00\$',
                                weight: FontWeight.w500,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(15),
                    Center(
                      child: AuthCustomButton(
                        onTap: () {},
                        text: 'order Again',
                        buttonColor: Colors.grey.shade400,
                        textColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
