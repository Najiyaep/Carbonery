import 'package:carbonery/models/admin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminService{


  Future<String?> registerUser(Admin user) async {
    try {
      UserCredential userResponse = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: user.email.toString(), password: user.password.toString());

      final admin=Admin(
          role: user.role,
          email:user.email,
          id: userResponse.user!.uid,
          password:user.password,
          name: user.name,);

      FirebaseFirestore.instance
          .collection('login')
          .doc(userResponse.user!.uid)
          .set({

        'uid':admin.id,
        'role':admin.role,
        'email':admin.email
      });


      FirebaseFirestore.instance
          .collection('admin')
          .doc(userResponse.user!.uid)
          .set(admin.toJson());

      return "";
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.message}');
      return e.message; // Return Firebase Auth error message
    } catch (e) {
      print('Error: $e');
      return 'Registration failed: $e'; // Return generic error message
    }
  }



}