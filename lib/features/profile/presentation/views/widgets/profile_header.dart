import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            children: [
              SvgPicture.asset(Assets.assetsImagesLeftArrow),
              const SizedBox(width: 140),
              const Text('Profile', style: AppTextStyles.semiBold20),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: const Text(
            "Personal Details",
            style: AppTextStyles.semiBold20,
          ),
        ),
      ],
    );
  }
}
