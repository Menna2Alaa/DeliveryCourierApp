import 'package:delivery_courier_app/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:delivery_courier_app/features/home/preentation/views/widgets/active_navigation_bar_item.dart';
import 'package:delivery_courier_app/features/home/preentation/views/widgets/in_active_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.bottomNavigationBarEntity,
  });
  final bool isActive;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 100),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.3),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: isActive
          ? ActiveNavigationBarItem(
              // key: const ValueKey('active'),
              svgPic: bottomNavigationBarEntity.activeImage,
              name: bottomNavigationBarEntity.name,
            )
          : InActiveBottomNavigationBarItem(
              // key: const ValueKey('inactive'),
              svgPic: bottomNavigationBarEntity.inActiveImage,
            ),
    );
  }
}
