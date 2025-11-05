import 'package:delivery_courier_app/features/payment_methods/presentation/views/widgets/payment_methods_view_body.dart';
import 'package:flutter/material.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});
  static const routeName = 'payment-methods_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: PaymentMethodsViewBody())),
    );
  }
}
