class PackageEntity {
  final String content;
  final String size;
  final String weight;
  final String totalPrice;
  final String pkgId;
  final String deliveryStatus;
  final String paymentDetails;

  final String? senderName;
  final String? receiverName;
  final String? phoneNumber;
  final String? address;
  final String? location;

  PackageEntity({
    required this.pkgId,
    required this.content,
    required this.size,
    required this.weight,
    required this.totalPrice,
    required this.deliveryStatus,
    required this.paymentDetails,
    this.senderName,
    this.receiverName,
    this.phoneNumber,
    this.address,
    this.location,
  });
}
