import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
  });

  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill the ${widget.hint}';
        }
        return null;
      },
      obscureText: _obscureText,
      controller: widget.controller,
      cursorColor: AppColors.colorWhite,
      cursorHeight: 15,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: _togglePassword,
                child: Icon(
                  _obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  color: Colors.white,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color.fromARGB(255, 237, 214, 10), width: 2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.white),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        fillColor:Colors.yellow.withValues(alpha: 0.1),
        filled: true,
      ),
    );
  }
}
