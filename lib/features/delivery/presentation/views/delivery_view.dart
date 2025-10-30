import 'package:delivery_courier_app/features/delivery/presentation/views/widgets/delivery_view_body.dart';
import 'package:flutter/material.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});
  static const routeName = 'delivery_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: DeliveryViewBody()));
  }
}
