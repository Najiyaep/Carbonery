import 'package:carbonery/services/auth_service.dart';
import 'package:carbonery/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:carbonery/screens/common/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool visibile = true;
  final _loginKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(height: 10),
            Image.asset(
              'assets/img/logo.png',
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
            key: _loginKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Welcome Back !  ",
                        style: TextStyle(color: Colors.green, fontSize: 30),
                        textScaler: TextScaler.noScaling,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      // Text(
                      //   "    Enter the log in details ",
                      //   style: themeData.textTheme.displaySmall,
                      // ),
                      // SizedBox(
                      //   height: 40,
                      // ),
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
                            if (value!.length < 6) {
                              return "Password should be at least 6 characters";
                            }
                            return null;
                          },
                          obscureText: visibile,
                          controller: _passwordController,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: "Password",
                            hintStyle: themeData.textTheme.labelSmall,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.green[50]),
                            suffixIcon: IconButton(
                              color: Colors.green[50],
                              onPressed: () {
                                setState(() {
                                  visibile = !visibile;
                                });
                              },
                              icon: visibile == true
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password ?",
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
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
                        child: InkWell(
                          onTap: () async {
                            // validate
                            // do thelogic

                            if (_loginKey.currentState!.validate()) {
                              AuthService _authService = AuthService();

                              final userData = await _authService.loginUser(
                                  _emailController.text,
                                  _passwordController.text);

                              if (userData != null) {
                                if (userData['role'] == 'user') {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/navigation',
                                    (route) => false,
                                  );
                                } else if (userData['role'] == "expert") {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/experthome',
                                    (route) => false,
                                  );
                                } else if (userData['role'] == "research") {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/researchome',
                                    (route) => false,
                                  );
                                } else if (userData['role'] == "admin") {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/adminhome',
                                    (route) => false,
                                  );
                                }
                              }
                            }
                          },
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
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
                        child: GestureDetector(
                          onTap: () {
                            bool ok = _loginKey.currentState!.validate();
                            if (ok) {
                              print(_emailController.text);
                              print(_passwordController.text);
                            }
                          },
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.account_circle,
                                      color: Colors.white),
                                  SizedBox(width: 8),
                                  Text(
                                    "Log in with Google",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
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
                            "Don't have an account ?",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterTab()));
                              },
                              child: Text(
                                "Sign Up",
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
      ),
    );
  }
}
//
