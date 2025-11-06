import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/payment_methods/data/repos/payment_methods_repo_impl.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/cubits/payment_methods_cubit/get_all_payment_methods_cubit.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/views/widgets/payment_methods_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});
  static const routeName = 'payment-methods_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAllPaymentMethodsCubit(PaymentMethodsRepoImpl())
            ..getAllPaymentMethods(FirebaseAuth.instance.currentUser!.uid),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Payment Methods'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              Assets.assetsImagesLeftArrow,
              height: 32,
              width: 32,
            ),
          ),
        ),
        body: const SafeArea(child: Center(child: PaymentMethodsViewBody())),
      ),
    );
  }
}
