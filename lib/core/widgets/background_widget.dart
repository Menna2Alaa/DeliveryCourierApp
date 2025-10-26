import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:flutter/material.dart';

class BackGroundWidget extends StatelessWidget {
  const BackGroundWidget({super.key, required this.heigth});
  final double heigth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: heigth,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage(Assets.assetsImagesTopScreenBackground),
      ),
    );
  }
}
