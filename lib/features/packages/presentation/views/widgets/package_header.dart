import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PackageHeader extends StatelessWidget {
  const PackageHeader({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(Assets.assetsImagesLeftArrow),
        ),
        const SizedBox(width: 16),
        Text(text, style: AppTextStyles.medium16),
      ],
    );
  }
}
