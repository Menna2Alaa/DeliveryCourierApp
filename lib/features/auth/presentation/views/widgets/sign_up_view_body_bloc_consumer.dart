import 'package:delivery_courier_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      builder: (BuildContext context, state) {
        return SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: state is SignupLoading ? true : false,
            child: const SignUpViewBody(),
          ),
        );
      },
      listener: (BuildContext context, SignupState state) {
        if (state is SignupSuccess) {}
        if (state is SignupFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
    );
  }
}
