import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widgets.dart';
import 'signin_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF005894),
          Color(0xFF005894),
          Color(0xFF276FA0).withOpacity(0.9),
          Color(0xFF276FA0).withOpacity(0.9)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                Text("Welcome to NBC Information",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFFFFFEFE),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Explore your university with NBC Information.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFFFFEFE),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text("Find out what's happening and how to get involved.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFFFEFE),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                    )),
                SizedBox(height: 160),
                logoImage("assets/images/nustWhiteLogo.png"),
                SizedBox(height: 130),
                whiteButton(context, "SIGN UP", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                }),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Already a member?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFFFEFE),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                    child: Text("Sign In",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFFFEFE),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500)))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Image logoImage(String ImageName) {
    return Image.asset(
      ImageName,
      fit: BoxFit.fitWidth,
      width: 144,
      height: 144,
    );
  }
}
