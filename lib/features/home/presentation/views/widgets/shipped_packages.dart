import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/core/widgets/app_cards.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShippedPackages extends StatelessWidget {
  const ShippedPackages({super.key, required this.shippedPackages});

  final List<PackageEntity> shippedPackages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: shippedPackages.map((pkg) {
        return AppCards(
          height: 84,
          text1: pkg.pkgId,
          text2: '${pkg.deliveryStatus} . ${pkg.content}',
          leftIcon: SvgPicture.asset(Assets.assetsImagesPackageIcon),
          onTap: () {
            Navigator.pushNamed(
              context,
              PackageDetailsView.routeName,
              arguments: pkg,
            );
          },
        );
      }).toList(),
    );
  }
}
