
import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:feedbackmobileapp/pages/home.dart';
import 'package:feedbackmobileapp/pages/success.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = "Feedback Application";
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      darkTheme: ThemeData(
         // brightness: Brightness.dark, primarySwatch: Colors.blueGrey, fontFamily: GoogleFonts.montserrat()
         primaryColor: LightColor.darkRed,
              brightness: Brightness.light,
              fontFamily: 'Montserrat'
          ),
              
      home: Scaffold(
        appBar: AppBar(
       leading: Icon(Icons.home),
        title: Text(appTitle, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: LightColor.darkRed,
      ),
      body: HomePage(),
      ),
    );
  }
}



