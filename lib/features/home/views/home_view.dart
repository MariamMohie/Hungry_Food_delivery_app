import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/core/utils/extentions.dart';
import 'package:hungery/features/home/widget/card_item.dart';
import 'package:hungery/features/home/widget/food_category.dart';
import 'package:hungery/features/home/widget/search_bar.dart';
import 'package:hungery/features/home/widget/user_header.dart';
import 'package:hungery/features/product_details/views/product_details_view.dart';
import 'package:hungery/shared/common_background.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> category = ['All', 'Combo', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double blurSigma = (_scrollOffset / 50).clamp(0, 12);
    final double opacity = (_scrollOffset / 100).clamp(0, 0.85);

    return CommonBackground(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              expandedHeight: 170,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(color: Colors.transparent),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(160), // height of the card
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: (_scrollOffset / 50).clamp(0, 12),
                        sigmaY: (_scrollOffset / 50).clamp(0, 12),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.lighterPrimary.withOpacity(
                            (_scrollOffset / 100).clamp(0, 0.85),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            UserHeader(),
                            Gap(20),
                            SearchField(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Categories
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Gap(10),
                    FoodCategory(
                      category: category,
                      selectedIndex: selectedIndex,
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),

            // Products Grid
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                  onTap: () {
                    context.navigateToScreen(ProductDetails());
                  },
                  child: const CardItem(
                    image: 'assets/images/test.png',
                    name: 'Cheese Burger',
                    des: '"Wendy"s Burger',
                    rate: '4.9',
                  ),
                );
              }, childCount: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
                childAspectRatio: 0.85,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
