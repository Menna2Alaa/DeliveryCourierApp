import 'package:delivery_courier_app/features/courier/presentation/views/widgets/courier_view_body.dart';
import 'package:flutter/material.dart';

class CourierView extends StatelessWidget {
  const CourierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: CourierViewBody()));
  }
}
