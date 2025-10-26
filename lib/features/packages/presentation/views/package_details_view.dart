import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_details_view_body.dart';
import 'package:flutter/material.dart';

class PackageDetailsView extends StatelessWidget {
  const PackageDetailsView({super.key});
  static const String routeName = 'package_details_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: PackageDetailsBody()));
  }
}
