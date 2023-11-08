// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nbc_app/screens/dashboard_screen.dart';
import 'package:nbc_app/services/firebase_auth_methods.dart';
import '../reusable_widgets/reusable_widgets.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  void loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: _emailTextController.text,
        password: _passwordTextController.text,
        context: context,
        onSuccess: () {
          // Navigate to the DashboardScreen on successful login
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF005894),
              Color(0xFF005894),
              Color(0xFF276FA0).withOpacity(0.9),
              Color(0xFF276FA0).withOpacity(0.9)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 470,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      logoWidget("assets/images/nustBlueLogo.png", 83, 83),
                      SizedBox(height: 15),
                      Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF005894),
                          fontFamily: "Cupertino",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 45),
                      resuableTextField("Email", Icons.email_outlined, false,
                          _emailTextController),
                      SizedBox(height: 10),
                      resuableTextField("Password", Icons.password_outlined,
                          true, _passwordTextController),
                      SizedBox(height: 70),
                      blueButton(context, "SIGN IN", () {
                        loginUser();
                      }),
                      Container(
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 60,
                              ),
                              Text("Don't have an account?"),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  " Sign Up",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF005894),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
