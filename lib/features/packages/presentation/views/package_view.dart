import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/custome_bottom_navigation_bar.dart';
import 'package:delivery_courier_app/features/packages/data/repos/package_repo_impl.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/add_package_cubit/add_package_cubit.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key});
  static const String routeName = 'package_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomeBottomNavigationBar(),

      body: const SafeArea(child: PackageViewBody()),
    );

    // BlocProvider(
    //   create: (BuildContext context) =>
    //       PackageCubit(PackageRepoImpl(firestore: FirebaseFirestore.instance))
    //         ..addPackage()
    //         ..getAllPackages(),
    //   child: Scaffold(
    //     bottomNavigationBar: CustomeBottomNavigationBar(),

    //     body: const SafeArea(child: PackageViewBody()),
    //   ),
    // );
  }
}
