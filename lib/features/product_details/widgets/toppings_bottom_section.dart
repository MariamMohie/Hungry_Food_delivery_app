import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';

class ToppingBottomSection extends StatelessWidget {
  const ToppingBottomSection({super.key, required this.title, this.onAdd});
  final String title;
  final Function()? onAdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        // color: Color(0xFF3B2E2E), // Dark brown
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),

          // Circle add button
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: onAdd,
              child: Icon(Icons.add, size: 16, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
