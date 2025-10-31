import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/features/auth/data/services/get_user.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'welcome back!',
                style: AppTextStyles.regular12.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 5),
              Text(
                getUser().name,
                style: AppTextStyles.medium16.copyWith(color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, size: 32),
            color: Colors.white,
          ),
          const SizedBox(width: 14),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(Icons.person, color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
