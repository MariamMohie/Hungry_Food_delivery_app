import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/core/network/api_error.dart';
import 'package:hungery/core/utils/extentions.dart';
import 'package:hungery/features/auth/data/auth_repo.dart';
import 'package:hungery/features/auth/views/login_view.dart';
import 'package:hungery/features/auth/widgets/auth_custom_button.dart';
import 'package:hungery/features/auth/widgets/auth_switch_text.dart';
import 'package:hungery/features/auth/widgets/background.dart';
import 'package:hungery/root.dart';
import 'package:hungery/shared/custom_text_field.dart';
import 'package:hungery/shared/app_snackbar.dart';

class SignUpVew extends StatefulWidget {
  const SignUpVew({super.key});

  @override
  State<SignUpVew> createState() => _SignUpVewState();
}

class _SignUpVewState extends State<SignUpVew> {
  /// ──────────────────── Typing animation ────────────────────
  late final Ticker _ticker;
  final String _fullText = 'You are in the right place!';
  String _animatedText = '';
  int _charIndex = 0;

  /// ──────────────────── Controllers ────────────────────
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// ──────────────────── Sign Up Function ────────────────────

  AuthRepo authRepo = AuthRepo();
  bool isLoading = false;
  Future<void> _signUp() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        final user = await authRepo.signUp(name, email, password);

        if (user != null && mounted) {
          context.navigateToScreen(const Root());
          ScaffoldMessenger.of(context).showSnackBar(
            appSnackBar(message: 'Registration successful!', isSuccess: true),
          );
        }
      } catch (e) {
        String errorMessage = 'An error occurred during sign up.';
        if (e is ApiError) errorMessage = e.message;

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(appSnackBar(message: errorMessage, isSuccess: false));
      } finally {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    }
  }

  /// ──────────────────── UI ────────────────────
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 37, 37),
        body: Stack(children: [const BackgroundLayer(), _foregroundLayer()]),
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

              /// Logo
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 260,
                color: const Color.fromARGB(255, 237, 214, 10),
              ),

              const Gap(20),

              /// Animated text
              Text(
                _animatedText,
                style: const TextStyle(
                  color: Color.fromARGB(255, 237, 214, 10),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Gap(100),

              /// Name
              CustomTextField(
                hint: 'Full Name',
                isPassword: false,
                controller: nameController,
              ),

              const Gap(25),

              /// Email
              CustomTextField(
                hint: 'Email Address',
                isPassword: false,
                controller: emailController,
              ),

              const Gap(25),

              /// Password
              CustomTextField(
                hint: 'Password',
                isPassword: true,
                controller: passwordController,
              ),

              const Gap(70),

              /// Sign Up Button
              isLoading
                  ? const CupertinoActivityIndicator(
                      color: AppColors.colorWhite,
                      radius: 20,
                    )
                  : AuthCustomButton(
                      onTap: _signUp,
                      text: 'Sign Up',
                      width: double.infinity,
                      buttonColor: const Color.fromARGB(255, 143, 14, 4),
                      textColor: AppColors.colorWhite,
                    ),

              const Gap(20),

              AuthSwitchText(
                prefixText: 'Already have an account ? ',
                actionText: 'Login',
                onPressed: () {
                  context.naivateWithReplacepment(const LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
