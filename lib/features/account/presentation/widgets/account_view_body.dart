import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/features/account/presentation/widgets/account_card.dart';
import 'package:delivery_courier_app/features/account/presentation/widgets/account_header.dart';
import 'package:delivery_courier_app/features/account/presentation/widgets/delete_account_widget.dart';
import 'package:flutter/material.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AccountHeader(),
        const SizedBox(height: 20),
        const AccountCard(
          text: 'Profile',
          icon: Icon(Icons.person, size: 30, color: AppColors.primaryColor),
        ),
        const AccountCard(
          text: 'Payment Methods',
          icon: Icon(Icons.payment, size: 30, color: AppColors.primaryColor),
        ),
        const AccountCard(
          text: 'Technical Support',
          icon: Icon(Icons.support, size: 30, color: AppColors.primaryColor),
        ),
        const AccountCard(
          text: 'Terms & Conditions',
          icon: Icon(
            Icons.privacy_tip,
            size: 30,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        const DeleteAccountWidget(),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          child: CustomeButton(
            onPressed: () {},
            text: 'Logout',
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
