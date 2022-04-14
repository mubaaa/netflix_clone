import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_project/core/colors.dart';
import 'package:netflix_project/main_page/Screen_main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        scaffoldBackgroundColor: backgroundColor,
        primarySwatch: Colors.blue,
        backgroundColor: backgroundColor,
        textTheme:const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
           bodyText2: TextStyle(color: Colors.white)
        )
      ),
    home:  ScreenMainPage(),
    );
  }
}
