import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_packages_cubit/get_packages_cubit.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_details_view.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PackagesListView extends StatelessWidget {
  const PackagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPackagesCubit, GetPackageState>(
      builder: (context, state) {
        if (state is GetPackagesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetPackagesSuccess) {
          if (state.packages.isEmpty) {
            return const Center(child: Text('No packages found'));
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.packages.length,
            itemBuilder: (context, index) {
              final package = state.packages[index];

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: PackageCard(
                  onTap: () {
                    navigateToDetails(context, package);
                  },
                  text1: package.pkgId,
                  text2: '${package.deliveryStatus} • ${package.weight}',
                  leftIcon: SvgPicture.asset(Assets.assetsImagesPackageIcon),
                ),
              );
            },
          );
        } else if (state is GetPackagesFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('Error: ${state.message}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<GetPackagesCubit>().getAllPackages();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  void navigateToDetails(BuildContext context, PackageEntity package) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PackageDetailsView(package: package),
      ),
    );
  }
}
