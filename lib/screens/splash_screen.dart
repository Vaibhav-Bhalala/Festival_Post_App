import 'dart:async';

import 'package:festval_post/utils/globals.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return Scaffold(

      body: Column(
        children: [
          Center(
            child: Padding(padding: EdgeInsets.all(16),
              child: CircleAvatar(
                radius: 300,
                child: Image(
                  image: NetworkImage(
                      "https://media4.giphy.com/media/K17lTJrkbQfDDmuKMz/giphy.gif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
