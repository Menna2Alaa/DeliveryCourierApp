import 'package:flutter/material.dart';

class InActiveBottomNavigationBarItem extends StatelessWidget {
  const InActiveBottomNavigationBarItem({super.key, required this.svgPic});
  final Widget svgPic;
  @override
  Widget build(BuildContext context) {
    return svgPic;
  }
}
