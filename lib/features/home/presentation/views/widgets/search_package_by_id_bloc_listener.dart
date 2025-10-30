import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/core/widgets/custome_search_text_field.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_package_by_id/get_package_by_id_cubit.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPackageByIdBlocListener extends StatelessWidget {
  const SearchPackageByIdBlocListener({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetPackageByIdCubit, GetPackageByIDState>(
      listener: (context, state) {
        if (state is GetPackageByIdLoading) {
          CircularProgressIndicator();
        } else if (state is GetPackageByIdSuccess) {
          Navigator.pushNamed(
            context,
            PackageDetailsView.routeName,
            arguments: state.package,
          );
        } else if (state is GetPackageByIdFailure) {
          buildErrorBar(context, 'No Packages Found');
        }
      },

      child: CustomeSearchTextField(
        hintText: 'Enter your trackig number',
        controller: _searchController,
        onSubmitted: (value) {
          FocusScope.of(context).unfocus();

          if (value.trim().isEmpty) return;

          context.read<GetPackageByIdCubit>().getPackageByTrackingId(value);
        },
      ),
    );
  }
}
