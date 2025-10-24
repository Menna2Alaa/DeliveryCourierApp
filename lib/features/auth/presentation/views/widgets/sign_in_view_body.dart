import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/core/widgets/custome_text_form_field.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/have_or_not_have_an_account_widget.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/sign_in_methods.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/sign_in_with_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Stack(
          children: [
            Image.asset(Assets.assetsImagesTopScreenBackground),
            Padding(
              padding: const EdgeInsets.only(top: 136, left: 26, right: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(Assets.assetsImagesAppLogo),
                  const SizedBox(height: 48),
                  const Text('Sign In', style: AppTextStyles.semiBold20),
                  const SizedBox(height: 4),
                  Text(
                    'Welcome Back, You\'ve been missed.',
                    style: AppTextStyles.medium16.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text("Email"),
                  CustomeTextFormField(
                    onSaved: (value) {
                      email = value!;
                    },
                    hintText: "Enter your email",
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 18),
                  const Text("Password"),
                  PasswordField(
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: AppTextStyles.semiBold13.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  CustomeButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        context.read<SignInCubit>().signInWithEmailAndPassword(
                          email,
                          password,
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: 'Sign In',
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SignInWithDivider(),
                  ),
                  const SizedBox(height: 12),

                  const SignInMethods(),
                  const SizedBox(height: 20),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: HaveOrNotHaveAnAccountWidget(
                      text1: 'Don\'t have an account? ',
                      text2: 'Sign Up',
                      onTap: () {
                        Navigator.pushNamed(context, SignUpView.routeName);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
