class CourierEntity {
  final String name;
  final String phone;
  final String content;
  final String size;
  final String weight;
  final String price;
  final String dropoffLocation;
  final String pickupLocation;
  final String estimatedTime;
  final bool isFeatured;

  CourierEntity({
    required this.isFeatured,
    required this.name,
    required this.phone,
    required this.content,
    required this.size,
    required this.weight,
    required this.price,
    required this.dropoffLocation,
    required this.pickupLocation,
    required this.estimatedTime,
  });
}
