import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/features/account/presentation/widgets/account_card.dart';
import 'package:delivery_courier_app/features/account/presentation/widgets/account_header.dart';
import 'package:flutter/material.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AccountHeader(),
        SizedBox(height: 20),
        AccountCard(
          text: 'Profile',
          icon: Icon(Icons.person, size: 30, color: AppColors.primaryColor),
        ),
        AccountCard(
          text: 'Payment Methods',
          icon: Icon(Icons.payment, size: 30, color: AppColors.primaryColor),
        ),
        AccountCard(
          text: 'Technical Support',
          icon: Icon(Icons.support, size: 30, color: AppColors.primaryColor),
        ),
        AccountCard(
          text: 'Terms & Conditions',
          icon: Icon(
            Icons.privacy_tip,
            size: 30,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
