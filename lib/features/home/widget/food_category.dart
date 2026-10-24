import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/shared/custom_text.dart';

class FoodCategory extends StatefulWidget {
  const FoodCategory({
    super.key,
    required this.category,
    required this.selectedIndex,
  });
  final List category;
  final int selectedIndex;

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.category.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 15),
              decoration: BoxDecoration(
                color:selectedIndex == index
                    ? AppColors.lighterPrimary
                    : Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.colorWhite, width: 1.5),
              ),
              child: Center(
                child: CustomText(
                  text: widget.category[index],
                  color: selectedIndex == index
                      ? AppColors.colorWhite
                      : Colors.grey.shade600,
                  size: 15,
                  weight: FontWeight.w600,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
