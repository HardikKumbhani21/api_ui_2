import 'package:api_ui_2/view/home_screen.dart';
import 'package:api_ui_2/view/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();

  final password = TextEditingController();

  final formkey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            image: AssetImage(
                'assets/images/marc-kargel-us8_5kRARKg-unsplash.jpg'),
            fit: BoxFit.cover),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: Text(
                " Welcome!",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Container(
              height: height * 0.08,
              width: width * 0.4,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(width * 0.1),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.03),
                  child: Text(
                    " Login",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Form(
              key: formkey ,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the Email.';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "EMAIL",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05,
                        ),
                        prefixIcon: Icon(Icons.person,
                            color: Colors.white, size: width * 0.07),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.1, vertical: height * 0.0250),
                        fillColor: Colors.transparent,
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the Password.';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "PASSWORD",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05,
                        ),
                        prefixIcon: Icon(Icons.lock,
                            color: Colors.white, size: width * 0.07),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: width * 0.1, vertical: height * 0.0250),
                        fillColor: Colors.transparent,
                        filled: true,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    MaterialButton(
                      height: height * 0.07,
                      minWidth: width * 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      child: Text("LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Don't have an accont? ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "SIGNUP",
                            style: TextStyle(color: Colors.blue, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
