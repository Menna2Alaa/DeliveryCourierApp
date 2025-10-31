import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/core/widgets/list_tile_leading.dart';
import 'package:delivery_courier_app/core/widgets/list_tile_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.text1,
    required this.text2,
    required this.leftIcon,
    this.onTap,
  });
  final String text1, text2;
  final Widget leftIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 354,
          height: 65,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 9,
                offset: const Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
            border: BoxBorder.all(color: Color(0xffEDEDED), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: ListTile(
            leading: ListTileLeading(leftIcon: leftIcon),
            title: ListTileTitle(text1: text1, text2: text2),
            trailing: SvgPicture.asset(Assets.assetsImagesRightArrow),
          ),
        ),
      ],
    );
  }
}
