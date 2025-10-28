import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_detail_info_Field.dart';
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
            PackageDetailInfoField(label: 'Tracking ID', value: package.pkgId),
            PackageDetailInfoField(label: 'Content', value: package.content),
            PackageDetailInfoField(label: 'Size', value: package.size),
            PackageDetailInfoField(label: 'Weight', value: package.weight),
            PackageDetailInfoField(
              label: 'Total Price',
              value: package.totalPrice,
            ),
            if (package.senderName != null)
              PackageDetailInfoField(
                label: 'Sender Name',
                value: package.senderName!,
              ),
            if (package.receiverName != null)
              PackageDetailInfoField(
                label: 'Receiver Name',
                value: package.receiverName!,
              ),
            if (package.phoneNumber != null)
              PackageDetailInfoField(
                label: 'Phone Number',
                value: package.phoneNumber!,
              ),
            if (package.address != null)
              PackageDetailInfoField(label: 'Address', value: package.address!),
            if (package.location != null)
              PackageDetailInfoField(
                label: 'Location',
                value: package.location!,
              ),
            PackageDetailInfoField(
              label: 'Delivery Status',
              value: package.deliveryStatus,
            ),
            PackageDetailInfoField(
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
