import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
          bodyText1: TextStyle(fontSize: 20),
          bodyText2: TextStyle(fontSize: 20), // normal text without styles
          // bodyText1: ,
          headline1: TextStyle(fontSize: 25),
          headline2: TextStyle(fontSize: 20),
          headline3: TextStyle(fontSize: 20),
          headline4: TextStyle(fontSize: 20),
          headline5: TextStyle(fontSize: 20),
          headline6: TextStyle(fontSize: 20),
        )),
      ),
      home: HomeScreen(),
    );
  }
}
