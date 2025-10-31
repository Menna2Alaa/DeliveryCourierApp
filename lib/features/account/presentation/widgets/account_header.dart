import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/auth/data/services/get_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesLeftArrow),
              const SizedBox(width: 140),
              const Text('Account', style: AppTextStyles.semiBold20),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 10),

          Text(getUser().name, style: AppTextStyles.semiBold20),
          const SizedBox(height: 4),
          Text(
            getUser().email,
            style: AppTextStyles.medium16.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
