import 'package:carbonery/models/expert_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpertService{


  Future<String?> registerUser(ExpertModel user) async {
    try {
      UserCredential userResponse = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: user.email.toString(), password: user.password.toString());

      final expert=ExpertModel(
        status: user.status,
          role: user.role,
          email:user.email,
          id: userResponse.user!.uid,
          password:user.password,
          name: user.name,
          qualification: user.qualification);

      FirebaseFirestore.instance
          .collection('login')
          .doc(userResponse.user!.uid)
          .set({

        'uid':expert.id,
        'role':expert.role,
        'email':expert.email
      });


      FirebaseFirestore.instance
          .collection('expert')
          .doc(userResponse.user!.uid)
          .set(expert.toJson());

      return "";
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Exception: ${e.message}');
      return e.message; // Return Firebase Auth error message
    } catch (e) {
      print('Error: $e');
      return 'Registration failed: $e'; // Return generic error message
    }
  }
  Future<List<ExpertModel>> getAllUsers() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('expert').get();

      List<ExpertModel> users = querySnapshot.docs
          .map((doc) => ExpertModel.fromJson(doc))
          .toList();
      return users;
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
  Future<void> deleteUser(String userId) async {
    try {
      await FirebaseFirestore.instance.collection('expert').doc(userId).delete();
      await FirebaseFirestore.instance.collection('login').doc(userId).delete();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }


}