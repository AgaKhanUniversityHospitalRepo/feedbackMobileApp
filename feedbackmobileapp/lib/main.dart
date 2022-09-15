// import 'package:feedbackmobileapp/color/light_color.dart';
// import 'package:feedbackmobileapp/pages/home.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Feedback App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.deepOrange),
//       darkTheme: ThemeData(
//          // brightness: Brightness.dark, primarySwatch: Colors.blueGrey, fontFamily: GoogleFonts.montserrat()
//          primaryColor: LightColor.darkRed,
//               brightness: Brightness.light,
//               fontFamily: 'Montserrat'
//           ),
              
//       home: const MyHomePage(
//         title: 'Feedback Application'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);


//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  

//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       appBar: AppBar(
//        leading: Icon(Icons.home),
//         title: Text(widget.title, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
//         backgroundColor: LightColor.darkRed,
//       ),
//       body: HomePage(),
//     );
//   }
// }


import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:feedbackmobileapp/pages/home.dart';
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



