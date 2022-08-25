import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:feedbackmobileapp/models/serviceareas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _ratingValue1;
  double? _ratingValue2;
  double? _ratingValue3;
  double? _ratingValue4;
  double? _ratingValue5;

  late List<ServiceAreas> listLocations;
  late String selectedLocation;

  bool _showTextDield = false;
  String _otherLocation = '';

  void initState() {
    listLocations = [
      ServiceAreas(name: 'Adult Casualty'),
      ServiceAreas(name: 'Consulting Clinics'),
      ServiceAreas(name: 'Lab'),
      ServiceAreas(name: 'Paeds Casualty'),
      ServiceAreas(name: 'Pharmacy'),
      ServiceAreas(name: 'Radiology'),
      ServiceAreas(name: 'Wards'),
      ServiceAreas(name: 'Other'),
    ];
    selectedLocation = 'Adult Casualty';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Color.fromARGB(255, 250, 235, 234),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: EdgeInsets.all(8.0),
              // color: Colors.white,
              // width: 370,
              // height: 50,
              child: Text('Please Rate your experience',
                  style: GoogleFonts.montserrat(
                      color: LightColor.black, fontSize: 20))),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            padding: EdgeInsets.all(8.0),
            color: Colors.white,
            width: 370,
            height: 350,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.lato(),
                    labelText: 'Phone Number',
                    //hintText: 'Please enter your phone number',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Please enter your name',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Please enter your email address',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<ServiceAreas>(
                  isExpanded: true,
                  //hint: Text('Select area of service'),
                  decoration: const InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                      labelStyle: TextStyle(),
                      //icon:  Icon(Icons.transgender),
                      labelText: 'Select area of service'),
                  value: listLocations.first,
                  items: listLocations.map((ServiceAreas serviceAreas) {
                    return DropdownMenuItem(
                        child: Text('${serviceAreas.name}'), value: serviceAreas);
                  }).toList(),
                  onChanged: (ServiceAreas? newval) {
                    setState(() {
                      selectedLocation = newval.toString();
                      _showTextDield = true;
                      _otherLocation = newval.toString();
                    });
                  },
                  
                ),

                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: _showTextDield,
                  child: TextFormField(
                    decoration:
                        InputDecoration(labelText: "Enter ${_otherLocation}"),
                        
                    //controller: transfusionDataController,
                  ),
                  
                ),
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
                Text(
                  'How would you rate the experience?',
                  style: TextStyle(color: Colors.blueGrey[700], fontSize: 16),
                ),
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
                        _ratingValue1 = value;
                      });
                      SizedBox(height: 25);
                      // Display the rate in number
                    }),
                Text(
                  //_ratingValue.toString(),
                  _ratingValue1 != null ? _ratingValue1.toString() : 'Rate it',
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
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
                Text(
                  'How would you rate staff courtesy?',
                  style: TextStyle(color: Colors.blueGrey[700], fontSize: 16),
                ),
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
                        _ratingValue2 = value;
                      });
                      SizedBox(height: 25);
                      // Display the rate in number
                    }),
                Text(
                  //_ratingValue.toString(),
                  _ratingValue2 != null ? _ratingValue2.toString() : 'Rate it',
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
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
                Text(
                  'How would you rate our failities?',
                  style: TextStyle(color: Colors.blueGrey[700], fontSize: 16),
                ),
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
                        _ratingValue3 = value;
                      });
                      SizedBox(height: 25);
                      // Display the rate in number
                    }),
                Text(
                  //_ratingValue.toString(),
                  _ratingValue3 != null ? _ratingValue3.toString() : 'Rate it',
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
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
                Text(
                  'How would you rate our timeliness of service?',
                  style: TextStyle(color: Colors.blueGrey[700], fontSize: 16),
                ),
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
                        _ratingValue4 = value;
                      });
                      SizedBox(height: 25);
                      // Display the rate in number
                    }),
                Text(
                  //_ratingValue.toString(),
                  _ratingValue4 != null ? _ratingValue4.toString() : 'Rate it',
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
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
                Text(
                  'How would you recommend us to others?',
                  style: TextStyle(color: Colors.blueGrey[700], fontSize: 16),
                ),
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
                        _ratingValue5 = value;
                      });
                      SizedBox(height: 25);
                      // Display the rate in number
                    }),
                Text(
                  //_ratingValue.toString(),
                  _ratingValue5 != null ? _ratingValue5.toString() : 'Rate it',
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
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
              height: 200,
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.lato(color: LightColor.black),
                    labelText: 'Overall Remark',
                    //hintText: 'Please enter your phone number',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: LightColor.darkRed, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: Text('Submit'),
                )
              ]))
        ],
      ),
    ));
  }
}
