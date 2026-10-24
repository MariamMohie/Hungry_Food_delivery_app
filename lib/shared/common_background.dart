
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';

class CommonBackground extends StatelessWidget {
  const 
 CommonBackground({super.key,required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Colors.white, 
      //const Color.fromARGB(255, 239, 242, 219),
    body: Stack(
      children: [
        Positioned(
          top: size.height*-0.3,
          left: size.height *-0.25,
          child: Transform.rotate(
            angle: pi/4,
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(155.0),
                border: Border.all(width: 1.0,color: const Color.fromARGB(255, 143, 14, 4))
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(152.0),
                  color: AppColors.primary
                  // const Color.fromARGB(255, 214, 233, 179),
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    ),

    );
  }
}