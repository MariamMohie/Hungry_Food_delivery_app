import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/features/cart/widgets/add_and_remove_card_item.dart';
import 'package:hungery/features/cart/widgets/remove_button.dart';
import 'package:hungery/shared/custom_text.dart';

class CardCartItem extends StatelessWidget {
  const CardCartItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onRemove,
    required this.onAdd,
    required this.onDelete,
    required this.quantity,
  });
  final String imageUrl;
  final String title;
  final String subtitle;
  final Function()? onRemove;
  final Function()? onAdd;
  final Function()? onDelete;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.colorWhite,
      elevation: 3,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Image.asset(imageUrl, width: 120, height: 110),
                CustomText(text: title, weight: FontWeight.bold),

                CustomText(text: subtitle),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    AddAndRemoveCardItem(icon: Icons.remove, onTap: onRemove),
                    Gap(25),
                    CustomText(
                      text: quantity.toString(),
                      weight: FontWeight.bold,
                      size: 16,
                    ),
                    Gap(25),
                    AddAndRemoveCardItem(
                      icon: CupertinoIcons.add,
                      onTap: onAdd,
                    ),
                  ],
                ),
                Gap(30),
                RemoveButton(onTap: onDelete),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
