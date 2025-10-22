import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/core/widgets/custome_text_form_field.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/have_or_not_have_an_account_widget.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/terms_conditions_check_box.dart';
import 'package:delivery_courier_app/features/home/preentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, userName, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Stack(
        children: [
          Image.asset('assets/images/Rectangle 34625584.png'),

          Padding(
            padding: const EdgeInsets.only(top: 136, left: 26, right: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/images/onboarding_logo.svg'),
                const SizedBox(height: 48),
                const Text('Sign Up', style: AppTextStyles.semiBold20),
                const SizedBox(height: 4),
                Text(
                  'You\'re welcome.',
                  style: AppTextStyles.medium16.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const SizedBox(height: 24),
                const Text("Full Name"),
                CustomeTextFormField(
                  onSaved: (value) {
                    userName = value!;
                  },
                  hintText: "Enter your user name",
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 18),
                const Text("Email"),
                CustomeTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: "Enter your email",
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 18),
                const Text("Password"),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),

                const SizedBox(height: 12),
                TermsConditionsCheckBox(onChanged: (value) {}),
                const SizedBox(height: 24),
                CustomeButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                    //Navigator.pushNamed(context, HomeView.routeName);
                  },
                  text: 'Sign Up',
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: AlignmentGeometry.center,
                  child: HaveOrNotHaveAnAccountWidget(
                    text1: 'Already have an account? ',
                    text2: 'Sign In',
                    onTap: () {
                      Navigator.pushNamed(context, SignInView.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
