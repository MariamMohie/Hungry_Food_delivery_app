import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.grey.shade300,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(CupertinoIcons.search, color: Colors.grey.shade500),
            Gap(10),
            Expanded(
              child: TextField(
                cursorColor: AppColors.primary,
                cursorHeight: 18,
                style: TextStyle(color: Colors.grey.shade700),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: InputBorder.none,
                  hintText: 'Search for food',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
