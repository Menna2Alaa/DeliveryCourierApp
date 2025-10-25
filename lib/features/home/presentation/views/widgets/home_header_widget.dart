import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeHeadersWidget extends StatelessWidget {
  const HomeHeadersWidget({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text1, textAlign: TextAlign.left, style: AppTextStyles.medium16),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular13.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
