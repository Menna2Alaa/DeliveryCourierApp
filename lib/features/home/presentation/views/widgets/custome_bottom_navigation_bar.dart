import 'package:delivery_courier_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomeBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((entry) {
          final index = entry.key;
          final entity = entry.value;
          final isActive = index == currentIndex;

          return Expanded(
            flex: isActive ? 3 : 2,
            child: GestureDetector(
              onTap: () => onTap(index),
              child: NavigationBarItem(
                isActive: isActive,
                bottomNavigationBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
