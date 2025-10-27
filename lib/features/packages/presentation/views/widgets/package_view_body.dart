import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_header.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/packages_list_view.dart';
import 'package:flutter/material.dart';

class PackageViewBody extends StatelessWidget {
  const PackageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: [
          PackageHeader(
            text: 'Packages',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12),
          const Expanded(child: PackagesListView()),
        ],
      ),
    );
  }
}
