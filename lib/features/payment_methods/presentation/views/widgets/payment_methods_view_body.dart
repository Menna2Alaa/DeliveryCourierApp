import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/features/payment_methods/data/models/payment_methods_model.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/cubits/payment_methods_cubit/get_all_payment_methods_cubit.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/views/add_new_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodsViewBody extends StatelessWidget {
  const PaymentMethodsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child:
                BlocBuilder<
                  GetAllPaymentMethodsCubit,
                  GetAllPaymentMethodsState
                >(
                  builder: (context, state) {
                    if (state is GetAllPaymentMethodsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetAllPaymentMethodsSuccess) {
                      final paymentMethods = state.paymentMethods;
                      if (paymentMethods.isEmpty) {
                        return const Center(
                          child: Text('No payment methods found'),
                        );
                      }
                      return ListView.builder(
                        itemCount: paymentMethods.length,
                        itemBuilder: (context, index) {
                          final paymentMethod = paymentMethods[index];
                          return PaymentMethodCard(method: paymentMethod);
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
          ),
          CustomeButton(
            onPressed: () {
              Navigator.pushNamed(context, AddNewCardView.routeName);
            },
            text: "Add New Card",
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodsModel method;
  const PaymentMethodCard({super.key, required this.method});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: _getCardIcon(method.brand),
        title: Text('**** ${method.last4}'),
        subtitle: Text(method.brand),
      ),
    );
  }

  Widget _getCardIcon(String brand) {
    if (brand.toLowerCase().contains('visa')) {
      return SvgPicture.asset(Assets.assetsImagesVisa, height: 30);
    } else if (brand.toLowerCase().contains('mastercard')) {
      return SvgPicture.asset(Assets.assetsImagesMastercard, height: 30);
    } else {
      return const Icon(Icons.credit_card, size: 30);
    }
  }
}
