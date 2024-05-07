import 'package:cloud_firestore/cloud_firestore.dart';

class ExpertModel {
  String? id;
  final String email;
  final String password;
  final String name;
  final String qualification;
  final String role;
  final int status;

  ExpertModel({
    this.id, required this.status,
    required this.email,
    required this.password,
    required this.name,
    required this.qualification,
    required this.role
  });

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'email': email,
      'password': password,
      'name': name,
      'qualification': qualification,
      'role':role,
      'status':status
    };
  }

  factory ExpertModel.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return ExpertModel(
      status: json['status'],
      role: json['role'],
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      qualification: json['qualification'],
    );
  }
}
