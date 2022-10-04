import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:feedbackmobileapp/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThanksPage extends StatelessWidget {
  @override
 
  Widget build(BuildContext context) {
    const appTitle = "Feedback Application";
     Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
      //    appBar: AppBar(
      //  leading: Icon(Icons.home),
      //   title: Text(appTitle, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      //   backgroundColor: LightColor.darkRed,
      // ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 150),
            // Center(
            //   child: Image.asset(
            //     //'assets/images/thankyou.jpg',
            //     'assets/images/lake.jpg',
            //     width: size.width * .30,
            //     fit: BoxFit.fill,
            //   ),
              
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text("Thank you for your feedback!",
                    style: TextStyle(
                        color: LightColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
            ),
              
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: LightColor.darkRed, // background
                    onPrimary: Colors.white, // foreground
                    fixedSize: const Size(320, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }, 
                child: Text(
                  'HOME',
                  style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                ),
            )
            
          ],
        ),
      ),
    );
  }
}
