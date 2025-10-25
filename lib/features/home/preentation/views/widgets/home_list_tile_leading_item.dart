import 'package:flutter/material.dart';

class HomeListTileLeadingItem extends StatelessWidget {
  const HomeListTileLeadingItem({super.key, required this.leftIcon});

  final Widget leftIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: leftIcon,
        ),
      ),
    );
  }
}
