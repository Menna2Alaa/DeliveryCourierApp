import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:flutter/material.dart';

class SignInWithDivider extends StatelessWidget {
  const SignInWithDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            endIndent: 6,
            color: AppColors.secondaryColor,
          ),
        ),
        Text(
          'Sign In with',
          style: AppTextStyles.regular13.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            indent: 6,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
