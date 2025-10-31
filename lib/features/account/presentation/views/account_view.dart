import 'package:delivery_courier_app/features/account/presentation/views/widgets/account_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/delete_account_cubit/delete_account_cubit.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(
        context.read<AuthRepo>(), // assuming AuthRepo is provided higher up
      ),
      child: const Scaffold(body: SafeArea(child: AccountViewBody())),
    );
  }
}
