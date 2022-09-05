import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:feedbackmobileapp/models/serviceareas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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

  var cphone;

  TextEditingController cCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController serviceAreaController = TextEditingController();
  TextEditingController serviceAreaDataController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController experienceRmController = TextEditingController();
  TextEditingController staffCourtesyController = TextEditingController();
  TextEditingController staffCourtesyRmController = TextEditingController();
  TextEditingController facilitiesController = TextEditingController();
  TextEditingController facilitiesRmController = TextEditingController();
  TextEditingController timelinessController = TextEditingController();
  TextEditingController timelinessRmController = TextEditingController();
  TextEditingController recommendController = TextEditingController();
  TextEditingController recommentRmController = TextEditingController();
  TextEditingController overallController = TextEditingController();

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
              child: Text('Please Rate your experience',
                  style: GoogleFonts.montserrat(
                      color: LightColor.black, fontSize: 20))),
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            width: 370,
            height: 350,
            child: Column(
              children: [
                IntlPhoneField(
                   decoration: InputDecoration(
        labelText: 'Phone Number',
    ),
    initialCountryCode: 'KE',
    onChanged: (cphone) {
        print(cphone.countryCode + 'here' + cphone.number);
    },controller: phoneController,
                ),

                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Please enter your name',
                  ),
                ),
                TextFormField(
                  controller: emailController,
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
                    }
                    );
                  },
                  
                ),

                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: _showTextDield,
                  child: TextFormField(
                    controller: serviceAreaDataController,
                    decoration:
                        InputDecoration(labelText: "Enter ${_otherLocation}"),
                        
                    //controller: transfusionDataController,
                  ),
                  
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            width: 370,
            height: 200,
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
                  controller: experienceRmController,
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            width: 370,
            height: 200,
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
                  controller: staffCourtesyRmController,
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            width: 370,
            height: 200,
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
                  controller: facilitiesRmController,
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            width: 370,
            height: 200,
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
                  controller: timelinessRmController,
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            width: 370,
            height: 200,
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
                  controller: recommentRmController,
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'Please enter your remarks',
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            width: 370,
            height: 100,
              child: Column(children: [
                TextFormField(
                  controller: overallController,
                  decoration: InputDecoration(
                    labelStyle: GoogleFonts.lato(),
                    labelText: 'Overall Remark',
                  ),
                ),
                
              ]),
              ),
              SizedBox(height: 20,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: LightColor.darkRed, // background
                    onPrimary: Colors.white, // foreground
                    fixedSize: const Size(320, 50),
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
                  ),
                  onPressed: () {
                    String uName = nameController.text;
                    String email = emailController.text;
                    String cCode = cCodeController.text;
                    String phone = phoneController.text;
                    String serviceArea = selectedLocation;
                    String serviceAreaData = serviceAreaDataController.text;
                    String experience = _ratingValue1.toString();
                    String experienceRm = experienceRmController.text;
                    String staffCourtesy = _ratingValue2.toString();
                    String staffCourtesyRm = staffCourtesyRmController.text;
                    String facilities = _ratingValue3.toString();
                    String facilitiesRm = facilitiesRmController.text;
                    String timeliness = _ratingValue4.toString();
                    String timelinessRm = timelinessRmController.text;
                    String recommend = _ratingValue5.toString();
                    String recommendRm = recommentRmController.text;
                    String overall = overallController.text;

                    print('feed ${uName} ${email} ${cCode} ${phone} ${serviceArea} ${serviceAreaData} ${experience} ${experienceRm} ${staffCourtesy} ${staffCourtesyRm} ${facilities} ${facilitiesRm} ${timelinessRm} ${timeliness} ${recommend} ${recommendRm} ${overall}');
                  },
                  child: Text('SUBMIT', style: GoogleFonts.lato(fontWeight: FontWeight.bold),)
                ),

                SizedBox(height: 20,),
        ],
      ),
    ));
  }
}
