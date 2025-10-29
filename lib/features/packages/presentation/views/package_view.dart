import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/packages/data/repos/package_repo_impl.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_packages_cubit/get_packages_cubit.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key});
  static const String routeName = 'package_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetPackagesCubit(
        PackageRepoImpl(firestore: FirebaseFirestore.instance),
      )..getAllPackages(),
      child: Scaffold(
        // bottomNavigationBar: CustomeBottomNavigationBar(),
        body: const SafeArea(child: PackageViewBody()),
      ),
    );
  }
}
