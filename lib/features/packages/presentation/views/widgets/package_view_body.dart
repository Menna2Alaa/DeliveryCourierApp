import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_header.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/packages_list_view.dart';
import 'package:flutter/material.dart';

class PackageViewBody extends StatelessWidget {
  const PackageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PackageHeader(),
        SizedBox(height: 12),
        Expanded(child: PackagesListView()),
      ],
    );
  }
}
