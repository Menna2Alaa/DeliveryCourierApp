import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/courier/data/models/courier_model.dart';
import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/courier/domain/repos/courier_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_courier_state.dart';

class AddCourierCubit extends Cubit<AddCourierState> {
  final CourierRepo courierRepo;
  AddCourierCubit(this.courierRepo) : super(AddCourierInitial());

  Future<void> addCourier() async {
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('couriers').get();

    if (snapshot.docs.isEmpty) {
      final sampleCouriers = [
        CourierModel(
          name: 'John Doe',
          phone: '+1 (123) 456-7890',
          content: 'Electronics',
          size: 'Medium',
          weight: '2.5 kg',
          price: '\$50',
          dropoffLocation: '123 Main St, Apt 4B',
          pickupLocation: '456 Elm St',
          estimatedTime: '2 hours',
          isFeatured: false,
        ),

        CourierModel(
          name: 'Mary Smith',
          phone: '+1 (987) 654-3210',
          content: 'Clothing',
          size: 'Large',
          weight: '3.5 kg',
          price: '\$75',
          dropoffLocation: '789 Oak St, Apt 6C',
          pickupLocation: '321 Pine St',
          estimatedTime: '3 hours',
          isFeatured: true,
        ),

        CourierModel(
          name: 'Luke Skywalker',
          phone: '+1 (555) 123-4567',
          content: 'Toys',
          size: 'Small',
          weight: '1.2 kg',
          price: '\$25',
          dropoffLocation: '987 Maple St, Apt 2A',
          pickupLocation: '654 Birch St',
          estimatedTime: '1 hour',
          isFeatured: false,
        ),

        CourierModel(
          name: 'peter pan',
          phone: '+1 (876) 543-2109',
          content: 'Electronics',
          size: 'Large',
          weight: '3.5 kg',
          price: '\$75',
          dropoffLocation: '654 Birch St, Apt 2A',
          pickupLocation: '987 Maple St',
          estimatedTime: 'ON 12 MAY',
          isFeatured: true,
        ),

        CourierModel(
          name: 'bob marley',
          phone: '+1 (876) 543-2109',
          content: 'furniture',
          size: 'large',
          weight: '4.5 kg',
          price: '\$75',
          dropoffLocation: '450 Main St, Apt 4B',
          pickupLocation: '534 Elm St',
          estimatedTime: '2 weeks',
          isFeatured: true,
        ),

        CourierModel(
          name: 'John Doe',
          phone: '+1 (123) 456-7890',
          content: 'Electronics',
          size: 'Medium',
          weight: '2.5 kg',
          price: '\$50',
          dropoffLocation: '123 Main St, Apt 4B',
          pickupLocation: '456 Elm St',
          estimatedTime: '2 hours',
          isFeatured: false,
        ),

        CourierModel(
          name: 'caroline',
          phone: '+1 (654) 321-9876',
          content: 'books',
          size: 'small',
          weight: '1.5 kg',
          price: '\$25',
          dropoffLocation: '905 Main St, Apt 4B',
          pickupLocation: '412 Elm St',
          estimatedTime: '5 days',
          isFeatured: true,
        ),

        CourierModel(
          name: 'xavier',
          phone: '+1 (987) 654-3210',
          content: 'clothing',
          size: 'Medium',
          weight: '2.5 kg',
          price: '\$50',
          dropoffLocation: '123 Main St, Apt 4B',
          pickupLocation: '456 Elm St',
          estimatedTime: '3 weeks',
          isFeatured: false,
        ),

        CourierModel(
          name: 'jane',
          phone: '+1 (876) 543-2109',
          content: 'books',
          size: 'Medium',
          weight: '1.5 kg',
          price: '\$75',
          dropoffLocation: '098 Main St, Apt 4B',
          pickupLocation: '321 Elm St',
          estimatedTime: '1 week',
          isFeatured: true,
        ),
      ];

      for (final courier in sampleCouriers) {
        await courierRepo.addCourier(courier);
      }
    }
  }
}
