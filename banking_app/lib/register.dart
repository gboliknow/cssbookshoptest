
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_svg/svg.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();



  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool _passwordVisible = false;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.cyan[700],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    SvgPicture.asset(
                      "assets/images/undraw_Hello_re_3evm.svg",
                      height: size.height * 0.25,
                    ),
                    SizedBox(height: size.height * 0.03),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 1,
                              bottom: 1,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: TextFormField(
                              controller: usernameEditingController,
                              validator: (val) {
                                return val.isEmpty || val.length < 13
                                    ? "Enter Full Name"
                                    : null;
                              },
                              decoration: InputDecoration(
                                hintText: "Full Name",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 16),
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.cyan[700],
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 1,
                              bottom: 1,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: TextFormField(
                              controller: emailEditingController,
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Enter correct email";
                              },
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 16),
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.cyan[700],
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 1,
                              bottom: 1,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300],
                            ),
                            child: TextFormField(
                              obscureText: !_passwordVisible,
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
                                          ? Icons.visibility_off
                                          : Icons.visibility,
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
                              controller: passwordEditingController,
                              validator: (val) {
                                return val.length < 6
                                    ? "Enter Password 6+ characters"
                                    : null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        singUp();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.cyan[700],
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Sign Up",
                       
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
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(
                            "SignIn now",
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
      
    );
  }
}
