import 'package:delivery_courier_app/core/widgets/details_info_field.dart';
import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_header.dart';
import 'package:flutter/material.dart';

class CourierDetailsViewBody extends StatelessWidget {
  const CourierDetailsViewBody({super.key, required this.courierEntity});
  final CourierEntity courierEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PackageHeader(
              text: 'Courier details',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 25),
            DetailInfoField(label: 'Courier Name', value: courierEntity.name),
            DetailInfoField(label: 'Courier Phone', value: courierEntity.phone),
            DetailInfoField(label: 'Content', value: courierEntity.content),
            DetailInfoField(label: 'size', value: courierEntity.size),
            DetailInfoField(
              label: 'Pickup Location',
              value: courierEntity.pickupLocation,
            ),

            DetailInfoField(
              label: 'Dropoff Location',
              value: courierEntity.dropoffLocation,
            ),
            DetailInfoField(
              label: 'estimated Time',
              value: courierEntity.estimatedTime,
            ),
            DetailInfoField(label: 'Price', value: courierEntity.price),
          ],
        ),
      ),
    );
  }
}
