import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';

class PackageModel extends PackageEntity {
  PackageModel({
    required super.pkgId,
    required super.content,
    required super.size,
    required super.weight,
    required super.totalPrice,
    required super.deliveryStatus,
    required super.paymentDetails,
    super.senderName,
    super.receiverName,
    super.phoneNumber,
    super.address,
    super.location,
  });

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      pkgId: map['trackingId'] ?? map['pkgId'] ?? "",
      content: map['content'] ?? '',
      size: map['size'] ?? '',
      weight: map['weight'] ?? '',
      totalPrice: map['totalPrice'] ?? '',
      deliveryStatus: map['deliveryStatus'] ?? '',
      paymentDetails: map['paymentDetails'] ?? '',
      senderName: map['senderName'],
      receiverName: map['receiverName'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      location: map['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'trackingId': pkgId,
      'content': content,
      'size': size,
      'weight': weight,
      'totalPrice': totalPrice,
      'deliveryStatus': deliveryStatus,
      'paymentDetails': paymentDetails,
      'senderName': senderName,
      'receiverName': receiverName,
      'phoneNumber': phoneNumber,
      'address': address,
      'location': location,
    };
  }
}
