import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class UserModel{
  String?uid;
  String?email;String?password;
  String?name;
  String?role;
  int?status;
  DateTime?createdAt;
  UserModel(
      {
        this.uid,this.email,this.password,this.name,this.role,this.status,this.createdAt,
      }
      );



  factory UserModel.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      name: data['name'],
      email: data['email'],

      password: data['password'],
      role: data['role'],
      status: data['status'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  // Convert UserModel object to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,

      'password': password,
      'role': role,
      'status': status,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }





}
