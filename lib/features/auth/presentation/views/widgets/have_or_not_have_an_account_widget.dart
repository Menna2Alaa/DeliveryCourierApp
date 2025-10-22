import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveOrNotHaveAnAccountWidget extends StatelessWidget {
  const HaveOrNotHaveAnAccountWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1, text2;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1,
        style: AppTextStyles.regular13.copyWith(
          color: AppColors.secondaryColor,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: text2,
            style: AppTextStyles.semiBold13.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}//'Don\'t have an account? '
//'Create an account'
