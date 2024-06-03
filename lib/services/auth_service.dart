// TODO Implement this library.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carbonery/models/user_model.dart';

class AuthService {
  // register
  //login
  // logout
  //alrady logined



  Future<DocumentSnapshot> loginUser(String? email, String password) async {


    print("hello");
    UserCredential userData = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email.toString(), password: password.toString());


    print(userData);
    final loginSnap = await FirebaseFirestore.instance
        .collection('login')
        .doc(userData.user!.uid)
        .get();
    var token = await userData.user!.getIdToken();

    if(loginSnap['role']=="expert"){

      final expertSnap = await FirebaseFirestore.instance
          .collection('expert')
          .doc(userData.user!.uid)
          .get();

      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', expertSnap['name']);
      _pref.setString('email', expertSnap['email']);

      _pref.setString('id', expertSnap['id']);

      _pref.setString('role', expertSnap['role']);

    }else if(loginSnap['role']=="research"){

      final researchSnap = await FirebaseFirestore.instance
          .collection('research')
          .doc(userData.user!.uid)
          .get();

      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', researchSnap['name']);
      _pref.setString('email', researchSnap['email']);

      _pref.setString('role', researchSnap['role']);

    }

    else if(loginSnap['role']=='user'){


      final userSnap = await FirebaseFirestore.instance
          .collection('user')
          .doc(userData!.user!.uid)
          .get();
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', userSnap['name']!);
      _pref.setString('email', userSnap['email']!);
     _pref.setString('uid', userData.user!.uid);


      _pref.setString('role', userSnap['role']!);


    }
    else if(loginSnap['role']=='admin'){


      // final teacherSnap = await FirebaseFirestore.instance
      //     .collection('user')
      //     .doc(userData!.user!.uid)
      //     .get();
      SharedPreferences _pref = await SharedPreferences.getInstance();
      _pref.setString('token', token!);
      _pref.setString('name', "admin");
      _pref.setString('email', email.toString());
      _pref.setString('phone', "9895663498");


      _pref.setString('role', "admin");


    }




    return loginSnap;
  }

  Future<void>logout()async{

    SharedPreferences _pref=await SharedPreferences.getInstance();
    _pref.clear();

    await FirebaseAuth.instance.signOut();


  }



  Future<bool> isLoggedin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? _token = await pref.getString('token');

    // checking if there a token
    if (_token == null) {
      return false;
    } else {
      return true;
    }
  }
}
