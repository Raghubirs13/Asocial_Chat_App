import 'dart:async';
import 'package:flutter/material.dart';
import 'package:asocial_app/firstscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';


void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(AsocialApp());
}

class AsocialApp extends StatelessWidget {
  const AsocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => FirstScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFFFF4D83),Color(0xFFD57DF1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
        ),
      child: Image.asset('assets/images/logo.png',
              height: 30.h,
              width: 70.h,
      ),
    );
  }
}








