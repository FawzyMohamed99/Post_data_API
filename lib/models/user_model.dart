class UserModel {
  double? price;
  int? id;
  String? title;
  String? category;
  String? description;
  String? image;

  UserModel(
      {required this.price,
        required this.id,
        required this.title,
        required this.category,
        required this.description,
        required this.image});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        price: json['price'],
        id: json['id'],
        title: json['title'],
        category: json['category'],
        description: json['description'],
        image: json['image']);
  }
}
