import 'package:delivery_courier_app/features/home/preentation/views/widgets/home_list_tile_leading_item.dart';
import 'package:delivery_courier_app/features/home/preentation/views/widgets/home_list_tile_title_item.dart';
import 'package:flutter/material.dart';

class HomeHeadersDetails extends StatelessWidget {
  const HomeHeadersDetails({
    super.key,
    required this.text1,
    required this.text2,
    required this.leftIcon,
    required this.rightIcon,
  });
  final String text1, text2;
  final Widget leftIcon, rightIcon;

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
            border: BoxBorder.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        ListTile(
          leading: HomeListTileLeadingItem(leftIcon: leftIcon),
          title: HomeListTileTitleItem(text1: text1, text2: text2),
          trailing: rightIcon,
        ),
      ],
    );
  }
}
