import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/core/network/api_error.dart';
import 'package:hungery/core/utils/extentions.dart';
import 'package:hungery/features/auth/data/auth_repo.dart';
import 'package:hungery/features/auth/views/sign_up_view.dart';
import 'package:hungery/features/auth/widgets/auth_custom_button.dart';
import 'package:hungery/features/auth/widgets/auth_switch_text.dart';
import 'package:hungery/shared/app_snackbar.dart';
import 'package:hungery/root.dart';
import 'package:hungery/features/auth/widgets/background.dart';
import 'package:hungery/shared/custom_text.dart';
import 'package:hungery/shared/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  /// ──────────────────── Typing animation ────────────────────
  late final Ticker _ticker;
  final String _fullText = 'Welcome back, we missed you!';
  String _animatedText = '';
  int _charIndex = 0;

  /// ──────────────────── Controllers ────────────────────
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// ──────────────────── State ────────────────────
  bool isLoading = false;
  final AuthRepo authRepo = AuthRepo();

  /// ──────────────────── Login Logic ────────────────────
  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final user = await authRepo.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null && mounted) {
        context.navigateToScreen(const Root());
      }
    } catch (e) {
      _showError(e);
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _showError(dynamic e) {
    String errorMessage = 'An error occurred during login.';
    if (e is ApiError) errorMessage = e.message;

    ScaffoldMessenger.of(context).showSnackBar(
      appSnackBar(message: errorMessage, isSuccess: false),
     
    );
  }

  /// ──────────────────── Animation Init ────────────────────
  @override
  void initState() {
    super.initState();

    _ticker = Ticker((_) {
      if (_charIndex < _fullText.length) {
        setState(() {
          _animatedText += _fullText[_charIndex];
          _charIndex++;
        });
      } else {
        Future.delayed(const Duration(milliseconds: 600), () {
          if (!mounted) return;
          setState(() {
            _animatedText = '';
            _charIndex = 0;
          });
        });
      }
    });

    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// ──────────────────── UI ────────────────────
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 37, 37),
        body: Stack(children: [BackgroundLayer(), _foregroundLayer()]),
      ),
    );
  }

  /// ──────────────────── Foreground Layer ────────────────────
  Widget _foregroundLayer() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Gap(150),
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 260,
                color: const Color.fromARGB(255, 237, 214, 10),
              ),
              const Gap(20),
              Text(
                _animatedText,
                style: const TextStyle(
                  color: Color.fromARGB(255, 237, 214, 10),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Gap(100),

              CustomTextField(
                hint: 'Email Address',
                isPassword: false,
                controller: emailController,
              ),

              const Gap(25),

              CustomTextField(
                hint: 'Password',
                isPassword: true,
                controller: passwordController,
              ),

              const Gap(70),

              isLoading
                  ? const CupertinoActivityIndicator()
                  : AuthCustomButton(
                      onTap: login,
                      text: 'Login',
                      width: double.infinity,
                      buttonColor: const Color.fromARGB(255, 143, 14, 4),
                      textColor: AppColors.colorWhite,
                    ),

              const Gap(20),

              AuthCustomButton(
                width: double.infinity,
                buttonColor: Colors.yellow.withOpacity(0.1),
                textColor: Colors.white,
                onTap: () {
                  context.naivateWithReplacepment(const Root());
                },
                text: 'Continue as a Guest',
              ),
              const Gap(20),
              AuthSwitchText(
                prefixText: "Don't have an account ? ",
                actionText: 'Sign Up',
                onPressed: () {
                  context.naivateWithReplacepment(const SignUpVew());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
