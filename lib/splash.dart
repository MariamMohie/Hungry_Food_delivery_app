import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/features/auth/views/sign_up_view.dart';
import 'package:hungery/root.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoFade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoScale = Tween<double>(
      begin: 0.0,
      end: 1.0, // EXACT final size you gave
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutExpo,
      ),
    );

    _logoFade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignUpVew()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 111, 11, 4),
      body: Column(
        children: [
          const Gap(260),

          /// LOGO TEXT → SMALL TO BIG (NO SIZE CHANGE)
          FadeTransition(
            opacity: _logoFade,
            child: ScaleTransition(
              scale: _logoScale,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                color: AppColors.secondary,
              ),
            ),
          ),

          const Spacer(),

          Image.asset('assets/images/splash_image.png'),
        ],
      ),
    );
  }
}
