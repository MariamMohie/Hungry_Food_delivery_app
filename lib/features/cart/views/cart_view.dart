import 'package:flutter/material.dart';
import 'package:hungery/core/utils/extentions.dart';
import 'package:hungery/features/cart/widgets/cart_card_item.dart';
import 'package:hungery/features/check_out/views/check_out_view.dart';
import 'package:hungery/features/product_details/widgets/Add_to_cart_row.dart';
import 'package:hungery/shared/common_background.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final int itemCount = 20;
  late List<int> quantity;
  @override
  void initState() {
    super.initState();
    quantity = List.generate(itemCount, (_) => 1);
  }

  void incrementQuantity(int index) {
    setState(() {
      quantity[index]++;
    });
  }

  void decrementQuantity(int index) {
    if (quantity[index] > 1) {
      setState(() {
        quantity[index]--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 5, bottom: 120),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: CardCartItem(
                imageUrl: 'assets/images/card.png',
                title: 'Hamburger',
                subtitle: 'Veggie Burger',
                onRemove: () => decrementQuantity(index),
                onAdd: () => incrementQuantity(index),
                onDelete: () {},
                quantity: quantity[index],
              ),
            );
          },
        ),
      
        bottomNavigationBar: Container(
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
                color: Colors.grey.shade600,
                blurRadius: 15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: AddToCartRow(
            price: '99.19',
            textForCustomButton: 'Checkout',
            onPressed: () {
              context.navigateToScreen(CheckOutView());
            },
            text: 'Total',
          ),
        ),
      ),
    );
  }
}
