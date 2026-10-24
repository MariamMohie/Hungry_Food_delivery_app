import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.weight,
    this.size,
  });
  final String text;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      textScaler: TextScaler.linear(1.0),
      maxLines: 2,
      overflow: TextOverflow.ellipsis, 
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
