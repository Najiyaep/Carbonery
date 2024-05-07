import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  String? id;
  final String email;
  final String password;
  final String name;
  final String role;

  Admin({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role
  });

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'email': email,
      'password': password,
      'name': name,
      'role':role
    };
  }

  factory Admin.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return Admin(
      role: json['role'],
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );
  }
}
