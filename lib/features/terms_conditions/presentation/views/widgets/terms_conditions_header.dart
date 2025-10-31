import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TermsAndConditionsHeader extends StatelessWidget {
  const TermsAndConditionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(Assets.assetsImagesLeftArrow),
          ),
          const SizedBox(width: 100),
          const Text('Terms & Conditions', style: AppTextStyles.semiBold20),
        ],
      ),
    );
  }
}
