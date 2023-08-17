import 'package:festval_post/screens/detail_screen.dart';
import 'package:festval_post/screens/home_page.dart';
import 'package:festval_post/screens/quote_screen.dart';
import 'package:festval_post/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.pinkAccent),
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => SplashScreen(),
      'home': (context) => const HomePage(),
      'Quote screen': (context) => QuotesScreen(),
      'Detail_screen': (context) => Detail_Page(),
    },
  ));
}
