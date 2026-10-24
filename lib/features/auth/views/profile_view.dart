import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungery/core/constants/app_colors.dart';
import 'package:hungery/core/utils/extentions.dart';
import 'package:hungery/features/auth/widgets/profile_button.dart';
import 'package:hungery/features/auth/widgets/profile_text_field.dart';
import 'package:hungery/shared/common_background.dart';
import 'package:hungery/shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => context.popBackScreen(),
            icon: Icon(Icons.arrow_back, size: 30, color: AppColors.secondary),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, size: 30, color: AppColors.secondary),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Gap(10),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.secondary, width: 4),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile_pic.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Gap(30),
              ProfileTextField(label: 'Name', value: 'Knuckles'),
              SizedBox(height: 22),
          
              ProfileTextField(label: 'Email', value: 'Knuckles@gmail.com'),
              SizedBox(height: 22),
          
              ProfileTextField(
                label: 'Password',
                value: '12345678',
                isPassword: true,
                suffixIcon: Icons.lock_outline,
              ),
              Divider(
                color: Colors.white54,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                height: 40,
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
          
                  tileColor: AppColors.secondary.withOpacity(0.2),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  leading: Image.asset(
                    'assets/images/profile_visa.png',
                    width: 90,
                    height: 60,
                  ),
                  title: CustomText(
                    text: 'Debit Card',
                    size: 16,
                    weight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  subtitle: CustomText(
                    text: '**** **** **** 1234',
                    color: Colors.grey.shade600,
                  ),
                  trailing: CustomText(
                    text: 'Default',
                    color: AppColors.primary,
                    weight: FontWeight.bold,
                    size: 14,
                  ),
                ),
              ),
                Gap(200)
            ],
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
                color: Colors.grey.shade600,
                blurRadius: 15,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconTextButton(
                text: 'Edit Profile',
                onPressed: () {},
                icon: 'edit',
              ),
      
              IconTextButton(
                text: 'Logout',
                iconColor: AppColors.primary,
                onPressed: () {},
                icon: 'sign-out',
                backgroundColor: AppColors.colorWhite,
                textColor: AppColors.primary,
                
              ),
            
            ],
          ),
          
        ),
      ),
    );
  }
}
