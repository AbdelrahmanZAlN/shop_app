class UserDataModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;
  UserDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });
  factory UserDataModel.fromJson(json){
    return UserDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      phone: json['phone'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],

    );
  }
}