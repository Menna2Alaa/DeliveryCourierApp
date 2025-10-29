import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_view_body.dart';
import 'package:flutter/material.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key});
  static const String routeName = 'package_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomeBottomNavigationBar(),
      body: const SafeArea(child: PackageViewBody()),
    );
  }
}
