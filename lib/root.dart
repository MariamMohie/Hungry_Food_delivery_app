import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/features/auth/views/profile_view.dart';
import 'package:hungery/features/cart/views/cart_view.dart';
import 'package:hungery/features/home/views/home_view.dart';
import 'package:hungery/features/order_history/views/order_history_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
   late PageController controller = PageController();
   int currentIndex = 0;
  late List<Widget>  screens;
   @override
  void initState() {
    super.initState();
  screens =[
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView()
   ];
   controller =PageController(initialPage: currentIndex);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.secondary.withOpacity(0.5),
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              controller.jumpToPage(index);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_restaurant_sharp),
              label: 'Order History',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}