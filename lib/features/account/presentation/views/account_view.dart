import 'package:delivery_courier_app/features/account/presentation/widgets/account_view_body.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: Center(child: AccountViewBody())),
    );
  }
}
