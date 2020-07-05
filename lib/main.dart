import 'package:awesome/homepage.dart';
import 'package:flutter/material.dart';
import 'appconstant.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Post App",
      theme: ThemeData(
        primarySwatch: appColor,
        fontFamily: "Pacifico",
      ),
      home: HomePage(),
    );
  }
}