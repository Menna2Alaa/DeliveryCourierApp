import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_detail_info_Field.dart';
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
            PackageDetailInfoField(
              label: 'Courier Name',
              value: courierEntity.name,
            ),
            PackageDetailInfoField(
              label: 'Courier Phone',
              value: courierEntity.phone,
            ),
            PackageDetailInfoField(
              label: 'Content',
              value: courierEntity.content,
            ),
            PackageDetailInfoField(label: 'size', value: courierEntity.size),
            PackageDetailInfoField(
              label: 'Pickup Location',
              value: courierEntity.pickupLocation,
            ),

            PackageDetailInfoField(
              label: 'Dropoff Location',
              value: courierEntity.dropoffLocation,
            ),
            PackageDetailInfoField(
              label: 'estimated Time',
              value: courierEntity.estimatedTime,
            ),
            PackageDetailInfoField(label: 'Price', value: courierEntity.price),
          ],
        ),
      ),
    );
  }
}
