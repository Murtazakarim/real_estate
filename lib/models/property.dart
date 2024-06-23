class Property {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double latitude;
  final double longitude;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.latitude,
    required this.longitude,
  });
  Property.nearby(this.description, this.imageUrl, {required this.id, required this.latitude, required this.longitude})
      : title = 'Nearby Point',
        price = 0.0;

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }
}