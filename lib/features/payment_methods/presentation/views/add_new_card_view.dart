import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/payment_methods/data/repos/payment_methods_repo_impl.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/cubits/payment_methods_cubit/add_new_payment_methods_cubit.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/views/widgets/add_new_card_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewCardView extends StatelessWidget {
  const AddNewCardView({super.key});
  static const routeName = 'add-new-card_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewPaymentMethodsCubit(PaymentMethodsRepoImpl()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Card'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(
              Assets.assetsImagesLeftArrow,
              height: 32,
              width: 32,
            ),
          ),
        ),
        body: const SafeArea(
          child: Center(child: AddNewCardViewBodyBlocConsumer()),
        ),
      ),
    );
  }
}
