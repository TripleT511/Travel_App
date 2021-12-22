import 'package:flutter/material.dart';
import 'package:vietnam_travel_app/splash_page1.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const SplashPage(),
    ),
  );
}
