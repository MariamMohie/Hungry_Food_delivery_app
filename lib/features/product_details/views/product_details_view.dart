import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/core/utils/extentions.dart';
import 'package:hungery/features/product_details/widgets/Add_to_cart_row.dart';
import 'package:hungery/features/product_details/widgets/spicy_slider.dart';
import 'package:hungery/features/product_details/widgets/toppings.dart';
import 'package:hungery/shared/common_background.dart';
import 'package:hungery/shared/custom_text.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double spicyValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => context.popBackScreen(),
            icon: Icon(Icons.arrow_back, size: 30 , color: AppColors.secondary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpicySlider(
                  value: spicyValue,
                  onChanged: (double value) {
                    setState(() {
                      spicyValue = value;
                    });
                  },
                ),
                Gap(50),
                CustomText(text: 'Toppings', size: 22, weight: FontWeight.bold),
                Gap(20),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FoodToppings(
                            image: 'assets/images/tomato.png',
                            title: 'Tomato',
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Gap(40),
                CustomText(
                  text: 'Side Options',
                  size: 22,
                  weight: FontWeight.bold,
                ),
                Gap(20),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FoodToppings(
                            image: 'assets/images/tomato.png',
                            title: 'Tomato',
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: 100,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 49, 48, 48).withOpacity(0.4),
                blurRadius: 13,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: AddToCartRow(
            price: '100.67',
            textForCustomButton: 'Pay Now ',
            onPressed: () {},
            text: 'Total price',
          ),
        ),
      ),
    );
  }
}
