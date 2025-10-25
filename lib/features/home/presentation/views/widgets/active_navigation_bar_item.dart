import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:flutter/material.dart';

class ActiveNavigationBarItem extends StatelessWidget {
  const ActiveNavigationBarItem({
    super.key,
    required this.svgPic,
    required this.name,
  });

  final Widget svgPic;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.only(right: 16),
        decoration: ShapeDecoration(
          color: const Color(0xffEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: Color(0xff2490A9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: svgPic),
            ),
            const SizedBox(width: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 100),
              style: AppTextStyles.semiBold11.copyWith(
                color: AppColors.primaryColor,
              ),
              child: Flexible(
                child: Text(name, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
