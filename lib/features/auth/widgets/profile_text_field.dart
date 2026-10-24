import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.label,
    required this.value,
    this.isPassword = false,
    this.suffixIcon,
  });

  final String label;
  final String value;
  final bool isPassword;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor: Colors.white,
        cursorHeight: 20,
       
        
        
        initialValue: value,
        obscureText: isPassword,
        style: const TextStyle(
          color: Color.fromARGB(255, 105, 102, 102),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: label,
          labelStyle: const TextStyle(
            color: AppColors.secondary,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.white70, size: 20)
              : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.lighterPrimary, width: 1.3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.secondary, width: 1.6),
          ),
          filled: true,
          fillColor: AppColors.secondary.withOpacity(0.1),
        ),
      ),
    );
  }
}
