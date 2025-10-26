import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_details_view.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PackagesListView extends StatelessWidget {
  const PackagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,

      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
          child: PackageCard(
            onTap: () {
              Navigator.pushNamed(context, PackageDetailsView.routeName);
            },
            text1: '#HWDSF776567DS',
            text2: 'On the way . 24 June',
            leftIcon: SvgPicture.asset(Assets.assetsImagesPackageIcon),
          ),
        );
      },
    );
  }
}
