import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarEntity {
  final Widget activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
    this.name, {
    required this.activeImage,
    required this.inActiveImage,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    'Home',
    activeImage: SvgPicture.asset(Assets.assetsImagesHome),
    inActiveImage: SvgPicture.asset(Assets.assetsImagesHome),
  ),
  BottomNavigationBarEntity(
    'Package',
    activeImage: SvgPicture.asset(Assets.assetsImagesPackageIcon),
    inActiveImage: SvgPicture.asset(Assets.assetsImagesPackageIcon),
  ),
  BottomNavigationBarEntity(
    'Couriers',
    activeImage: Image.asset(Assets.assetsImagesCourierPng),
    inActiveImage: Image.asset(Assets.assetsImagesCourierPng),
  ),
  BottomNavigationBarEntity(
    'Delivery',
    activeImage: Image.asset(Assets.assetsImagesDeliveryPng),
    inActiveImage: Image.asset(Assets.assetsImagesDeliveryPng),
  ),
  BottomNavigationBarEntity(
    'Profile',
    activeImage: SvgPicture.asset(Assets.assetsImagesUser),
    inActiveImage: SvgPicture.asset(Assets.assetsImagesUser),
  ),
];
