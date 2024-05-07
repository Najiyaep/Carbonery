
import 'package:carbonery/models/research_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResearchService{


  Future<String?> registerUser(ResearchModel user) async {
    try {
      UserCredential userResponse = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: user.email.toString(), password: user.password.toString());

      final research=ResearchModel(
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

        'uid':research.id,
        'role':research.role,
        'email':research.email
      });


      FirebaseFirestore.instance
          .collection('research')
          .doc(userResponse.user!.uid)
          .set(research.toJson());

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