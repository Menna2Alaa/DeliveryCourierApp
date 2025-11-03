import 'package:delivery_courier_app/core/services/get_it_service.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/forgot_password_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = 'forgot_password_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(
              Assets.assetsImagesLeftArrow,
              height: 32,
              width: 32,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const SafeArea(child: ForgotPasswordViewBodyBlocConsumer()),
      ),
    );
  }
}
