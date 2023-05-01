// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slide_menu_drawer/constants.dart';
import 'package:slide_menu_drawer/homepage.dart';

void main() {
  final Color backColor = Color(0xFF343442);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: headerColor, systemNavigationBarColor: backColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'LexendExa'),
      home: HomePage(),
    );
  }
}
