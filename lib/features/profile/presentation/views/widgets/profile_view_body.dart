import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/core/widgets/custome_text_form_field.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:delivery_courier_app/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const ProfileHeader(),
          SizedBox(height: 30),
          CustomeTextFormField(
            controller: nameController,
            hintText: 'Name',
            suffixIcon: Icon(Icons.edit, color: AppColors.primaryColor),
            textInputType: TextInputType.text,
          ),
          CustomeTextFormField(
            controller: emailController,
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
            controller: currentPasswordController,
            hintText: 'Current password',
            textInputType: TextInputType.text,
          ),
          CustomeTextFormField(
            controller: newPasswordController,
            hintText: 'New password',
            textInputType: TextInputType.text,
          ),
          CustomeTextFormField(
            controller: confirmPasswordController,
            hintText: 'Confirm password',
            textInputType: TextInputType.text,
          ),
          Spacer(flex: 4),
          CustomeButton(
            onPressed: () {
              if (newPasswordController.text.isNotEmpty &&
                  newPasswordController.text !=
                      confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Passwords do not match')),
                );
                return;
              }

              context.read<UpdateUserDataCubit>().updateUserData(
                uId: FirebaseAuth.instance.currentUser!.uid,
                name: nameController.text.trim(),
                email: emailController.text.trim(),
                currentPassword: currentPasswordController.text.trim(),
                newPassword: newPasswordController.text.trim(),
              );
            },
            text: "Save",
            width: double.infinity,
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
