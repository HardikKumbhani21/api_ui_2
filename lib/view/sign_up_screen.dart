import 'package:api_ui_2/api_services/signup_user_api_services.dart';
import 'package:api_ui_2/model/signup_model.dart';
import 'package:api_ui_2/view/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fname = TextEditingController();
  final lname = TextEditingController();

  final password = TextEditingController();
  final username = TextEditingController();
  final formkey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  int _index = 0;
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
                'assets/images/photo-1454496522488-7a8e488e8606.jpeg'),
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
              width: width * 0.440,
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
                    " Registration",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Form(
              key: formkey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Column(
                  children: [
                    TextFormField(
                      controller: fname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the FirstName.';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "FIRSTNAME",
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
                      controller: lname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the LastName.';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "LASTNAME",
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
                      controller: username,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the Username.';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "USERNAME",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05,
                        ),
                        prefixIcon: Icon(Icons.date_range,
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
                      height: height * 0.02,
                    ),
                    MaterialButton(
                      height: height * 0.07,
                      minWidth: width * 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.03),
                      ),
                      color: Colors.blue,
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          SignUpModel model = SignUpModel();
                          model.firstName = fname.text;
                          model.lastName = lname.text;
                          model.username = username.text;
                          model.password = password.text;
                          model.avatar =
                              'data:image/jpeg;base64,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';
                          bool? status = await SignupUserApiServices.signUpUser(
                              model.toJson());
                          if (status == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("already user exsits!."),
                              ),
                            );
                          }
                        }
                      },
                      child: Text("SIGN UP",
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
                          " Already have an accont? ",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "LOGIN",
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
