import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_details_view_body.dart';
import 'package:flutter/material.dart';

class PackageDetailsView extends StatelessWidget {
  const PackageDetailsView({super.key, this.package});

  static const String routeName = 'package_details_view';

  final PackageEntity? package;

  @override
  Widget build(BuildContext context) {
    PackageEntity? currentPackage = package;

    if (currentPackage == null) {
      final args = ModalRoute.of(context)?.settings.arguments;

      if (args != null && args is PackageEntity) {
        currentPackage = args;
      }
    }

    if (currentPackage == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          buildErrorBar(context, 'Package not found');
        }
      });

      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: SafeArea(child: PackageDetailsViewBody(package: currentPackage)),
    );
  }
}
