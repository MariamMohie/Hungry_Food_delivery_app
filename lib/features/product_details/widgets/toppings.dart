import 'package:flutter/material.dart';
import 'package:hungery/features/product_details/widgets/toppings_bottom_section.dart';

class FoodToppings extends StatelessWidget {
  final String image;
  final String title;

  const FoodToppings({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [

          // Image with rounded top corners
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              image,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Bottom section
          ToppingBottomSection(title: title , onAdd: (){},)
        ],
      ),
    );
  }
}
