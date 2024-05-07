import 'package:carbonery/constants/constant.dart';
import 'package:carbonery/researcher/research_home.dart';
import 'package:carbonery/researcher/research_register.dart';
import 'package:carbonery/screens/admin/admin_home.dart';
import 'package:carbonery/screens/admin/admin_login.dart';
import 'package:carbonery/screens/common/activity_page.dart';
import 'package:carbonery/screens/common/article_page.dart';
import 'package:carbonery/screens/common/bottom_navigation_page.dart';
import 'package:carbonery/screens/common/graph_page.dart';
import 'package:carbonery/screens/common/home_page.dart';
import 'package:carbonery/screens/common/my_page.dart';
//import 'package:carbonery/screens/common/splash_page.dart';
import 'package:carbonery/screens/common/register_page.dart';
import 'package:carbonery/screens/common/splash.dart';
import 'package:carbonery/screens/expert/expert_home.dart';
import 'package:carbonery/screens/expert/expert_login.dart';
import 'package:carbonery/screens/expert/expert_register.dart';
import 'package:flutter/material.dart';
import 'package:carbonery/screens/common/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',

      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
       '/navigation': (context) => BottomNavigationPage(),
        '/researchreg': (context) => ResearchRegister(),
        '/researchome': (context) => Researchome(),
        '/experthome': (context) => ExpertHome(),
        '/expertreg': (context) => ExpertRegister(),
        '/adminhome':(context)=>AdminHome()

     },
      debugShowCheckedModeBanner: false,
      title: 'Carbonery',
      theme: ThemeData(
        appBarTheme: AppBarTheme(

          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: Colors.green[50],
            ),
            displaySmall: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.green[50],
            ),
            labelSmall: TextStyle(
                color: Colors.green, fontSize: 12, letterSpacing: 2)),
        scaffoldBackgroundColor: Colors.grey.shade50
      ),

    );
  }
}
