import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
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
    ));
  }
}
