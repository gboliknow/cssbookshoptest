import 'package:banking_app/Register.dart';
import 'package:banking_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  void pushtodetailtoScreen(BuildContext context) {
    String stack = emailEditingController.text;
    if (formKey.currentState.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              name: stack,
            ),
          ));
    } else {
      //show snackbar
      final snackBar = SnackBar(content: Text('Wrong Information'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.2),
              Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.cyan[700],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/images/undraw_social_interaction_cy9i.svg",
                height: size.height * 0.25,
              ),
              SizedBox(height: size.height * 0.03),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: TextFormField(
                        validator: (val) {
                          return val.isEmpty || val.length < 13
                              ? "Please Enter Full Name"
                              : null;
                        },
                        controller: emailEditingController,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 16),
                          icon: Icon(
                            Icons.email,
                            color: Colors.cyan[700],
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: TextFormField(
                        obscureText: _passwordVisible,
                        validator: (val) {
                          return val.length > 6
                              ? null
                              : "Enter Password 6+ characters";
                        },
                        controller: passwordEditingController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 16),
                          icon: Icon(
                            Icons.lock,
                            color: Colors.cyan[700],
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.cyan[700],
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  pushtodetailtoScreen(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.cyan[700],
                  ),
                  width: size.width,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account? ",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Register now",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
