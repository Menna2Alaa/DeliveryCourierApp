import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';

class CheckEmailViewBody extends StatelessWidget {
  const CheckEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.email_outlined,
            size: 100,
            color: AppColors.primaryColor,
          ),
          const SizedBox(height: 20),
          const Text(
            "We've sent you a password reset link.",
            textAlign: TextAlign.center,
            style: AppTextStyles.regular22,
          ),
          const SizedBox(height: 10),
          Text(
            "Please check your inbox and follow the instructions to reset your password.",
            textAlign: TextAlign.center,
            style: AppTextStyles.regular12.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 40),
          CustomeButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, SignInView.routeName);
            },
            text: "Back to Login",
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
