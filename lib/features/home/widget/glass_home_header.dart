import 'dart:ui';
import 'package:flutter/material.dart';

class GlassHomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  GlassHomeHeaderDelegate({
    required this.child,
    this.backgroundColor = Colors.white,
  });

  final Widget child;
  final Color backgroundColor;

  @override
  double get minExtent => 170;

  @override
  double get maxExtent => 170;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress =
        (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Stack(
      fit: StackFit.expand,
      children: [
        /// 🔹 Glass blur layer
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8 * progress,
            sigmaY: 8 * progress,
          ),
          child: Container(
            color: backgroundColor.withOpacity(0.85 * progress),
          ),
        ),

        /// 🔹 Optional subtle shadow when pinned
        if (progress > 0.2)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 0.5,
              color: Colors.black.withOpacity(0.08),
            ),
          ),

        /// 🔹 Header content
        Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: child,
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant GlassHomeHeaderDelegate oldDelegate) => true;
}
