import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/core/widgets/custome_text_form_field.dart';
import 'package:delivery_courier_app/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const ProfileHeader(),
          SizedBox(height: 30),
          CustomeTextFormField(
            hintText: 'Name',
            suffixIcon: Icon(Icons.edit, color: AppColors.primaryColor),
            textInputType: TextInputType.text,
          ),
          CustomeTextFormField(
            hintText: 'Email',
            suffixIcon: Icon(Icons.edit, color: AppColors.primaryColor),
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 20),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text("Change Password", style: AppTextStyles.semiBold20),
          ),
          SizedBox(height: 30),

          CustomeTextFormField(
            hintText: 'Current password',
            textInputType: TextInputType.text,
          ),
          CustomeTextFormField(
            hintText: 'New password',
            textInputType: TextInputType.text,
          ),
          CustomeTextFormField(
            hintText: 'Confirm password',
            textInputType: TextInputType.text,
          ),
          Spacer(flex: 4),
          CustomeButton(onPressed: () {}, text: "Save", width: double.infinity),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
