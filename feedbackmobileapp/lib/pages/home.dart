import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
     children: [
      Container(
        margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
          padding: EdgeInsets.all(8.0),
          color: Colors.white,
          width: 370,
          height: 180,
          child: Column(
            children: [
              TextFormField(
                
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Please enter your phone number',
                ),
              )
            ],
          ),
      ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(8.0),
          color: Colors.white,
          width: 370,
          height: 180,
          child: Column(
            children: [
              Text('Please rate the Lab service.'),
              SizedBox(height: 10),
     
              RatingBar(
                      initialRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.orange),
                          half: const Icon(
                            Icons.star_half,
                            color: Colors.orange,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: Colors.orange,
                          )),
                      onRatingUpdate: (value) {
                        setState(() {
                          _ratingValue = value;
                        });
                         SizedBox(height: 25);
                  // Display the rate in number
                  
     }),
                     Text(
                      _ratingValue != null ? _ratingValue.toString() : 'Rate it!',
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
            ],
          ),
        ),
     
     ],
    ));
  }
}
