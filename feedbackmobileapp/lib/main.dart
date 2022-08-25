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
    return MaterialApp(
      title: 'Feedback App',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Color.fromRGBO(218, 41, 28, 1),
      //         primaryColor: Color.fromRGBO(218, 41, 28, 1),
      //         brightness: Brightness.light,
      //         fontFamily: 'Lato',
      //         backgroundColor: Colors.white
      //         ),
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      darkTheme: ThemeData(
         // brightness: Brightness.dark, primarySwatch: Colors.blueGrey, fontFamily: GoogleFonts.montserrat()
         primaryColor: LightColor.darkRed,
              brightness: Brightness.light,
              fontFamily: 'Montserrat'
          ),
              
      home: const MyHomePage(title: 'Feedback Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        leading: Icon(Icons.home),
        title: Text(widget.title, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: LightColor.darkRed,
      ),
      body: HomePage(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
          
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
