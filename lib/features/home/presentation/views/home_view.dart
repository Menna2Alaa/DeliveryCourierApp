import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:delivery_courier_app/features/packages/data/repos/package_repo_impl.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_packages_cubit/get_packages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPackagesCubit(
        PackageRepoImpl(firestore: FirebaseFirestore.instance),
      )..getAllPackages(),
      child: Scaffold(
        //bottomNavigationBar: CustomeBottomNavigationBar(),
        body: const SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
