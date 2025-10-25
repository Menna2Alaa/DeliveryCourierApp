import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:flutter/material.dart';

class HomeBackGroundWidget extends StatelessWidget {
  const HomeBackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 368,
      child: Image(
        fit: BoxFit.cover,
        image: AssetImage(Assets.assetsImagesTopScreenBackground),
      ),
    );
  }
}
