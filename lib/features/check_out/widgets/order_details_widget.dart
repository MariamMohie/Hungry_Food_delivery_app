 import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/shared/custom_text.dart';

class OrderDetailsWidget extends StatefulWidget {
   const OrderDetailsWidget({super.key, required this.order, required this.taxes, required this.fees, required this.total});
   final String order,taxes,fees,total;

 
   @override
   State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
 }
 
 class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
   @override
   Widget build(BuildContext context) {
     return Column(
      children: [
          checkOutWidget('Order', widget.order, false, false),
                Gap(15),
                checkOutWidget('Taxes', widget.taxes, false, false),
                Gap(15),
                checkOutWidget('Delivery fees', widget.fees, false, false),
                Gap(15),
                Divider(
                  color: Colors.grey.shade400,
                  height: 40,
                  thickness: 0.7,
                ),
                checkOutWidget('Total', widget.total, true, false),
                Gap(10),
                checkOutWidget(
                  'Estimated delivery time',
                  '15 -30 mins',
                  true,
                  true,
                ),
      ],
     );
   }
 } 
 Widget checkOutWidget(title, price, isBold, isSmall) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: title,
        size: isSmall ? 14 : 16,
        weight: isBold ? FontWeight.bold : FontWeight.w600,
        color: isBold ? Colors.black : Colors.grey,
      ),
      CustomText(
        text: isSmall ? '$price' : '\$$price',
        size: isSmall ? 14 : 16,
        weight: isBold ? FontWeight.bold : FontWeight.w600,
        color: isBold ? Colors.black : Colors.grey,
      ),
    ],
  );
}
