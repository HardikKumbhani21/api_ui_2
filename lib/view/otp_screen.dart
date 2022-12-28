import 'package:api_ui_2/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

import '../api_services/otp_services.dart';
import 'login_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final mobile = TextEditingController();
  String serverOtp = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: ComtextFormField(
                  controler: mobile,
                  label: "Enter Mobile",
                  validation: (value) {},
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  dynamic response = await OTPServices.sendOTP(
                    mobile.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(response['message']),
                    ),
                  );
                },
                child: Text('Send OTP'),
              ),
              Center(
                child: Text(
                  "We have sent on OTP to",
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.002,
              ),
              Text(
                "your mobile",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                "please check your mobile number 071***12",
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                "continue to reset your password",
                style: TextStyle(
                  fontSize: width * 0.038,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              OTPTextField(
                obscureText: true,
                length: 4,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: Colors.orange,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: height * 0.023,
                ),
                width: MediaQuery.of(context).size.width,
                fieldWidth: 75,
                style: TextStyle(fontSize: 25),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  serverOtp = pin;
                },
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                child: MaterialButton(
                  height: height * 0.075,
                  minWidth: double.infinity,
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
                  ),
                  onPressed: () async {
                    dynamic response =
                        await OTPServices.validateOtp(mobile.text, serverOtp);

                    if (response['status'] == 200) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response['message'])));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Enter wrong otp")));
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't Recive ?",
                    style: TextStyle(
                      fontSize: width * 0.038,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    ),
                    child: Text(
                      "Click Here",
                      style: TextStyle(
                        fontSize: width * 0.038,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComtextFormField extends StatelessWidget {
  final controler;
  final String label;
  final String? Function(String?)? validation;

  const ComtextFormField(
      {super.key,
      required this.controler,
      required this.label,
      this.validation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.sp),
          child: Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 12.sp),
          ),
        ),
        SizedBox(
          height: 2.sp,
        ),
        SizedBox(
          height: 35.sp,
          child: TextFormField(
            controller: controler,
            validator: validation,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.sp),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
      ],
    );
  }
}
