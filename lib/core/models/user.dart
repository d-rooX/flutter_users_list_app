import 'dart:convert';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatarUrl;
  final String? biography;
  final String? address;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
    this.biography,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        avatarUrl: json['avatar'],
        biography: json['biography'],
        address: json['address'],
      );

  String toJson() => json.encode(
        {
          'id': id,
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'avatar': avatarUrl,
          if (biography != null) 'biography': biography,
          if (address != null) 'address': address,
        },
      );
}
