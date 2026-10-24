class UserModel {
  final String name;
  final String email;
  final String? image;
  final String? token;
  final String? visa;
  final String? address;

  UserModel({
    required this.name,
    required this.email,
    this.image,
    this.token,
    this.visa,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      image: json['image'] as String?,
      token: json['token'] as String?,
      visa: json['Visa'] as String?,
      address: json['address'] as String?,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
