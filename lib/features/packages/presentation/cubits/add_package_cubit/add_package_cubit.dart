import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/packages/data/models/package_model.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/domain/repos/package_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  final PackageRepo packageRepo;

  PackageCubit(this.packageRepo) : super(PackageInitial());

  Future<void> addPackage() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('packages').get();

    if (snapshot.docs.isEmpty) {
      final samplePackages = [
        PackageModel(
          pkgId: '#HmNBG565HJHJ',
          content: 'Electronics',
          size: 'Large',
          weight: '3.2 kg',
          totalPrice: '\$75',
          deliveryStatus: 'Shipped',
          paymentDetails: 'Paid via card',
        ),
        PackageModel(
          pkgId: '#AHTY763KJHG',
          content: 'Clothing',
          size: 'Medium',
          weight: '1.2 kg',
          totalPrice: '\$45',
          deliveryStatus: 'Delivered',
          paymentDetails: 'Cash on delivery',
        ),
        PackageModel(
          pkgId: '#OPL8754HJGH',
          content: 'Documents',
          size: 'Small',
          weight: '0.5 kg',
          totalPrice: '\$15',
          deliveryStatus: 'In Transit',
          paymentDetails: 'Paid via PayPal',
        ),
      ];

      for (final package in samplePackages) {
        await packageRepo.addPackage(package);
      }
    }
  }
}
