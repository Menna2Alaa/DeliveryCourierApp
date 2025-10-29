import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/packages/data/models/package_model.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/domain/repos/package_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  final PackageRepo packageRepo;

  PackageCubit(this.packageRepo) : super(AddPackageInitial());

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
          senderName: 'Alice Johnson',
          receiverName: 'Bob Smith',
          phoneNumber: '+1 202 555 0123',
          address: '123 Main St, Apt 4B',
          location: 'New York, NY',
        ),
        PackageModel(
          pkgId: '#AHTY763KJHG',
          content: 'Clothing',
          size: 'Medium',
          weight: '1.2 kg',
          totalPrice: '\$45',
          deliveryStatus: 'Delivered',
          paymentDetails: 'Cash on delivery',
          senderName: 'Carol White',
          receiverName: 'David Brown',
          phoneNumber: '+1 310 555 0198',
          address: '456 Oak Avenue',
          location: 'Los Angeles, CA',
        ),
        PackageModel(
          pkgId: '#OPL8754HJGH',
          content: 'Documents',
          size: 'Small',
          weight: '0.5 kg',
          totalPrice: '\$15',
          deliveryStatus: 'In Transit',
          paymentDetails: 'Paid via PayPal',
          senderName: 'Emma Davis',
          receiverName: 'Frank Miller',
          phoneNumber: '+1 415 555 0142',
          address: '789 Pine Road',
          location: 'San Francisco, CA',
        ),
        PackageModel(
          pkgId: '#BGH2341FRTU',
          content: 'Documents',
          size: 'Medium',
          weight: '1.5 kg',
          totalPrice: '\$15',
          deliveryStatus: 'shipped',
          paymentDetails: 'Paid via PayPal',
          senderName: 'Emma Davis',
          receiverName: 'Frank Miller',
          phoneNumber: '+1 415 555 0142',
          address: '789 Pine Road',
          location: 'San Francisco, CA',
        ),
        PackageModel(
          pkgId: '#JDR0967AWED',
          content: 'clothes',
          size: 'Large',
          weight: '1 kg',
          totalPrice: '\$30',
          deliveryStatus: 'shipped',
          paymentDetails: 'Paid via PayPal',
          senderName: 'Emma Davis',
          receiverName: 'Frank Miller',
          phoneNumber: '+1 415 555 0142',
          address: '789 Pine Road',
          location: 'San Francisco, CA',
        ),
        PackageModel(
          pkgId: '#OPL8754HJGH',
          content: 'Documents',
          size: 'Small',
          weight: '0.5 kg',
          totalPrice: '\$15',
          deliveryStatus: 'In Transit',
          paymentDetails: 'Paid via PayPal',
          senderName: 'Emma Davis',
          receiverName: 'Frank Miller',
          phoneNumber: '+1 415 555 0142',
          address: '789 Pine Road',
          location: 'San Francisco, CA',
        ),
        PackageModel(
          pkgId: '#OPL8754HJGH',
          content: 'Documents',
          size: 'Small',
          weight: '0.5 kg',
          totalPrice: '\$15',
          deliveryStatus: 'In Transit',
          paymentDetails: 'Paid via PayPal',
          senderName: 'Emma Davis',
          receiverName: 'Frank Miller',
          phoneNumber: '+1 415 555 0142',
          address: '789 Pine Road',
          location: 'San Francisco, CA',
        ),
        PackageModel(
          pkgId: '#KLP9858OIKY',
          content: 'Documents',
          size: 'Medium',
          weight: '0.9 kg',
          totalPrice: '\$20',
          deliveryStatus: 'Deliverd',
          paymentDetails: 'Paid via PayPal',
          senderName: 'Emma Davis',
          receiverName: 'Frank Miller',
          phoneNumber: '+1 415 555 0142',
          address: '789 Pine Road',
          location: 'San Francisco, CA',
        ),
      ];

      for (final package in samplePackages) {
        await packageRepo.addPackage(package);
      }
    }
  }
}
