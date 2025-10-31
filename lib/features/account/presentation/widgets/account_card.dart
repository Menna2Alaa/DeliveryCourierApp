import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key, required this.text, required this.icon});

  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, bottom: 15),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: AppTextStyles.medium16.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
