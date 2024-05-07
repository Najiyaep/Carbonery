import 'package:carbonery/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthService _authService = AuthService();
  bool isLogin = false;
  var role;

  checkLogin() async {
    isLogin = await _authService.isLoggedin();

    if (isLogin == true) {
      print(role);
      if (role == 'user') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/navigation', (route) => false);
      } else if (role == 'expert') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/experthome', (route) => false);
      } else if (role == 'admin') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/adminhome', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', (route) => false);
    }
  }

  getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    role = await _pref.getString('role');
  }

  @override
  void initState() {
    getData();
    Future.delayed(Duration(seconds: 5), () {
      checkLogin();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/splash.png',
              height: 200, // Adjust the height as needed
              width: 200, // Adjust the width as needed
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Track Carbon Emission',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
