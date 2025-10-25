import 'package:delivery_courier_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomeBottomNavigationBar extends StatefulWidget {
  const CustomeBottomNavigationBar({super.key});

  @override
  State<CustomeBottomNavigationBar> createState() =>
      _CustomeBottomNavigationBarState();
}

class _CustomeBottomNavigationBarState
    extends State<CustomeBottomNavigationBar> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: index == activeIndex ? 3 : 2,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: NavigationBarItem(
                  isActive: activeIndex == index,
                  bottomNavigationBarEntity: entity,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
