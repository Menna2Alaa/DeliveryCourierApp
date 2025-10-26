import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:flutter/material.dart';

class ListTileTitle extends StatelessWidget {
  const ListTileTitle({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1, style: AppTextStyles.medium12),
        Text(
          text2,
          style: AppTextStyles.regular11.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
