import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_detail_info_Field.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_header.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/rating_section.dart';
import 'package:flutter/material.dart';

class PackageDetailsBody extends StatelessWidget {
  const PackageDetailsBody({super.key});

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

            const PackageDetailInfoField(label: 'Content', value: 'Documents'),
            const PackageDetailInfoField(label: 'Size', value: 'Medium'),
            const PackageDetailInfoField(label: 'Weight', value: '2.5 kg'),
            const PackageDetailInfoField(
              label: 'Total Price',
              value: '\$25.00',
            ),
            const PackageDetailInfoField(
              label: 'Sender/Receiver Name',
              value: 'John Doe',
            ),
            const PackageDetailInfoField(
              label: 'Phone Number',
              value: '+1 202 555 0123',
            ),
            const PackageDetailInfoField(
              label: 'Address',
              value: '32 Sunset Blvd, LA',
            ),
            const PackageDetailInfoField(
              label: 'Location',
              value: 'Los Angeles, CA',
            ),
            const PackageDetailInfoField(
              label: 'Delivery Status',
              value: 'In Transit',
            ),
            const PackageDetailInfoField(
              label: 'Payment Details',
              value: 'Paid via card',
            ),
            const SizedBox(height: 24),

            const RatingSection(),
          ],
        ),
      ),
    );
  }
}
