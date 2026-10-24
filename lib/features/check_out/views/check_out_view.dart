import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/core/utils/extentions.dart';
import 'package:hungery/features/check_out/widgets/order_details_widget.dart';
import 'package:hungery/features/check_out/widgets/success_dialog.dart';
import 'package:hungery/features/product_details/widgets/Add_to_cart_row.dart';
import 'package:hungery/shared/custom_button.dart';
import 'package:hungery/shared/custom_text.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  String selectedMethod = 'Cash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.popBackScreen(),
          icon: Icon(Icons.arrow_back, size: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Order summary',
                size: 20,
                weight: FontWeight.bold,
              ),
              Gap(20),
              Column(
                children: [
                  OrderDetailsWidget(
                    order: '90',
                    taxes: '5.65',
                    fees: '3.6',
                    total: '100.67',
                  ),
                  Gap(50),
                ],
              ),
              CustomText(
                text: 'Payment methods',
                size: 20,
                weight: FontWeight.bold,
              ),
              Gap(20),
              // cash on delivery
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMethod = 'Cash';
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                tileColor: Color(0xff3C2F2F),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                title: CustomText(
                  text: 'Cash on Delivery',
                  size: 16,
                  weight: FontWeight.w500,
                  color: AppColors.colorWhite,
                ),
                trailing: Radio<String>(
                  activeColor: AppColors.colorWhite,
                  value: 'Cash',
                  groupValue: selectedMethod,
                  onChanged: (value) => setState(() {
                    selectedMethod = value!;
                  }),
                ),
              ),
              Gap(15),

              // credit/debit card
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMethod = 'Visa';
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                tileColor: Colors.blue.shade900,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 15,
                ),
                leading: Image.asset('assets/images/visa.png', width: 50),
                title: CustomText(
                  text: 'Debit/Credit Card',
                  size: 16,
                  weight: FontWeight.w500,
                  color: AppColors.colorWhite,
                ),
                subtitle: CustomText(
                  text: '**** **** **** 1234',
                  color: AppColors.colorWhite,
                ),
                trailing: Radio<String>(
                  activeColor: AppColors.colorWhite,
                  value: 'Visa',
                  groupValue: selectedMethod,
                  onChanged: (value) => setState(() {
                    selectedMethod = value!;
                  }),
                ),
              ),
              Gap(5),

              Row(
                children: [
                  Checkbox(
                    value: true,
                    activeColor: Color(0xffEF2A39),
                    onChanged: (v) {},
                  ),
                  CustomText(
                    text: 'Save this card for future payments',
                    color: Colors.grey.shade500,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 49, 48, 48).withOpacity(0.4),
              blurRadius: 13,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: AddToCartRow(
          price: '100.67',
          textForCustomButton: 'Pay Now ',
          onPressed: () {
            showDialog(
              context: context,
              builder: (mariam) {
                return const SuccessDialog();
              },
            );
          },
          text: 'Total price',
        ),
      ),
    );
  }
}
