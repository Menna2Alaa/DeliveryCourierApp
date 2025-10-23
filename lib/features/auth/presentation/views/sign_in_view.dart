import 'package:delivery_courier_app/core/services/get_it_service.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = 'signInView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(body: const SignInviewBodyBlocconsumer()),
    );
  }
}
