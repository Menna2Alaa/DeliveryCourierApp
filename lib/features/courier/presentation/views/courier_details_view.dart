import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/courier/presentation/views/widgets/courier_details_view_body.dart';
import 'package:flutter/material.dart';

class CourierDetailsView extends StatelessWidget {
  const CourierDetailsView({super.key, this.courier});

  static const String routeName = 'courier_details_view';
  final CourierEntity? courier;

  @override
  Widget build(BuildContext context) {
    final CourierEntity? courierData =
        courier ?? ModalRoute.of(context)?.settings.arguments as CourierEntity?;

    if (courierData == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          buildErrorBar(context, 'Courier not found');
        }
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SafeArea(child: CourierDetailsViewBody(courierEntity: courierData)),
    );
  }
}
