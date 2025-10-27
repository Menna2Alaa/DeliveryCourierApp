import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/core/widgets/custome_progress_hud.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/add_package_cubit/add_package_cubit.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_view.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageListViewBlocConsumer extends StatelessWidget {
  const PackageListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PackageCubit, PackageState>(
      builder: (BuildContext context, state) {
        return CustomeProgressHud(
          isLoading: state is PackageLoading ? true : false,
          child: SafeArea(child: const PackageViewBody()),
        );
      },
      listener: (BuildContext context, state) {
        if (state is PackageAddedSuccess) {
          Navigator.pushNamed(context, PackageView.routeName);
        }
        if (state is PackageAddedFailure) {
          buildErrorBar(context, state.message);
        }
      },
    );
  }
}
