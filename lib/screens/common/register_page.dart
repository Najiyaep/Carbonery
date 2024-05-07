import 'package:carbonery/models/user_model.dart';
import 'package:carbonery/researcher/research_register.dart';
import 'package:carbonery/screens/expert/expert_register.dart';
import 'package:carbonery/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carbonery/screens/common/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userController = TextEditingController();
  bool visibile = true;
  final _regKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return  Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Form(
          key: _regKey,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textScaler: TextScaler.noScaling,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter a valid username";
                          }
                        },
                        controller: _userController,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Username",
                          errorStyle: TextStyle(color: Colors.red),
                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon:
                          Icon(Icons.person, color: Colors.green[50]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is mandatory";
                          }
                        },
                        controller: _emailController,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Email",
                          errorStyle: TextStyle(color: Colors.red),
                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon:
                          Icon(Icons.email, color: Colors.green[50]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is mandatory";
                          }
                        },
                        controller: _passwordController,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Password",
                          errorStyle: TextStyle(color: Colors.red),
                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon:
                          Icon(Icons.lock, color: Colors.green[50]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () async {
                          if (_regKey.currentState!.validate()) {
                            try {
                              UserModel user = UserModel(
                                  name: _userController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  createdAt: DateTime.now(),
                                  role: "user",
                                  status: 1);

                              UserService userService = UserService();
                              final res =
                              await userService.registerUser(user);

                              if (res == "") {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              }
                            } on FirebaseAuthException catch (e) {
                              // Handle FirebaseAuthException here
                              print('Firebase Auth Exception: ${e.message}');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                      "Firebase Auth Error: ${e.message}"),
                                ),
                              );
                            } catch (e) {
                              // Catch any other type of exception
                              print('Error: $e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Error: $e"),
                                ),
                              );
                            }
                          }
                        },
                        child: Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0,
                                    3), // changes the position of the shadow
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                                " Create Account",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class RegisterTab extends StatefulWidget {
  const RegisterTab({super.key});

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: const TabBar(
            isScrollable: true,
            padding: EdgeInsets.all(20),
            labelPadding: EdgeInsets.all(10),
            indicatorColor: Colors.green,
            labelStyle: TextStyle(color: Colors.green),
            tabs: [
              Text("User"),
              Text("Climate Expert"),
              Text("Researcher"),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            RegisterPage(),
            ExpertRegister(),
            ResearchRegister(),
          ],
        ),
      ),
    );
  }
}
