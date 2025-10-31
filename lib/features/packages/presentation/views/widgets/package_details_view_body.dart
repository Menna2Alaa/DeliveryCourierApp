import 'package:delivery_courier_app/core/widgets/details_info_field.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_header.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/rating_section.dart';
import 'package:flutter/material.dart';

class PackageDetailsViewBody extends StatelessWidget {
  const PackageDetailsViewBody({super.key, required this.package});

  final PackageEntity package;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PackageHeader(
              text: 'Package details',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 25),
            DetailInfoField(label: 'Tracking ID', value: package.pkgId),
            DetailInfoField(label: 'Content', value: package.content),
            DetailInfoField(label: 'Size', value: package.size),
            DetailInfoField(label: 'Weight', value: package.weight),
            DetailInfoField(label: 'Total Price', value: package.totalPrice),
            if (package.senderName != null)
              DetailInfoField(label: 'Sender Name', value: package.senderName!),
            if (package.receiverName != null)
              DetailInfoField(
                label: 'Receiver Name',
                value: package.receiverName!,
              ),
            if (package.phoneNumber != null)
              DetailInfoField(
                label: 'Phone Number',
                value: package.phoneNumber!,
              ),
            if (package.address != null)
              DetailInfoField(label: 'Address', value: package.address!),
            if (package.location != null)
              DetailInfoField(label: 'Location', value: package.location!),
            DetailInfoField(
              label: 'Delivery Status',
              value: package.deliveryStatus,
            ),
            DetailInfoField(
              label: 'Payment Details',
              value: package.paymentDetails,
            ),
            const SizedBox(height: 24),
            const RatingSection(),
          ],
        ),
      ),
    );
  }
}
