import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          width: 355,
          height: 103,
          decoration: BoxDecoration(
            color: Color(0xff2490A9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              'Get 20% OFF Express\n Delivery Today!',
              style: AppTextStyles.bold16.copyWith(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          right: 16,
          top: -20,
          child: SvgPicture.asset(Assets.assetsImagesCharacter, height: 120),
        ),
      ],
    );
  }
}
