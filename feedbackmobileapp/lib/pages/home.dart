import 'dart:io';

import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:feedbackmobileapp/pages/success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:feedbackmobileapp/color/light_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:feedbackmobileapp/repositories/feedbackRes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  //const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();

}


String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else {
      return null;
    }
  }

 String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
          return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
}  
class _HomePageState extends State<HomePage> {
  int? _ratingValue1;
  int? _ratingValue2;
  int? _ratingValue3;
  int? _ratingValue4;
  int? _ratingValue5;

  late List<String> listLocations;
  late String selectedLocation;

  bool _showTextDield = false;
  String _otherLocation = '';

  void initState() {
    listLocations = [
      'Adult Casualty',
      'Consulting Clinics',
      'Lab',
      'Paeds Casualty',
      'Pharmacy',
      'Radiology',
      'Wards',
      'Other',
    ];
    selectedLocation = 'Adult Casualty';
  }

  var cphone;
  var cCode;

  final _formKey = GlobalKey<_HomePageState>();

  //TextEditingController cCodeController = TextEditingController();
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
  const appTitle = "Feedback Application";
     double size = MediaQuery.of(context).size.width;
    return Scaffold(
      //   appBar: AppBar(
      //  leading: Icon(Icons.home),
      //   title: Text(appTitle, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      //   backgroundColor: LightColor.darkRed,
      // ),
      body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
        key: _formKey,
        child: Container(
          color: Color.fromARGB(255, 250, 235, 234),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  padding: EdgeInsets.all(8.0),
                  child: Text('Please rate your experience',
                      style: GoogleFonts.montserrat(
                          color: LightColor.black, fontSize: 20))),
              Container(
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                color: Colors.white,
                width: size,
                height: 350,
                child: Column(
                  children: [
                    IntlPhoneField(
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(
                      //     RegExp(r"[0-9]"),
                      //   )
                      // ],
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your number';
                      //   }
                      //   return null;
                      // },
                      validator: (value) => validateMobile(value),
                      decoration: InputDecoration(
                        label: Row(children: const [
                          Text('Phone Number',
                              style: TextStyle(
                                  color: LightColor.black,
                                  fontWeight: FontWeight.w600)),
                          Text(' *', style: TextStyle(color: LightColor.darkRed)),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                          ),
                        ]),
                        hintText: '0712345678',
                      ),
                      initialCountryCode: 'KE',
                      onChanged: (cphone) {
                        cCode = cphone.countryCode;
                        print(cphone.completeNumber);
                      },
                      controller: phoneController,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        label: Row(children: const [
                          Text('Name',
                              style: TextStyle(
                                  color: LightColor.black,
                                  fontWeight: FontWeight.w600)),
                        ]),
                        //labelText: 'Name',
                        hintText: 'Please enter your name',
                      ),
                    ),
                    TextFormField(
                      validator: (value) => validateEmail(value),
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Row(children: const [
                          Text('Email',
                              style: TextStyle(
                                  color: LightColor.black,
                                  fontWeight: FontWeight.w600)),
                        ]),
                        //labelText: 'Email',
                        hintText: 'abc@abc.com',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      //hint: Text('Select area of service'),
                      decoration: const InputDecoration(
                          contentPadding: const EdgeInsets.fromLTRB(0, 5.5, 0, 0),
                          labelStyle: TextStyle(color: LightColor.black, fontWeight: FontWeight.w600),
                          labelText: 'Select area of service'),
                      value: listLocations.first,
                      items: listLocations.map((String serviceAreas) {
                        return DropdownMenuItem(
                            child: Text('${serviceAreas}', style:(TextStyle(color: LightColor.black, fontSize: 16, fontWeight: FontWeight.w600)) ,), value: serviceAreas);
                      }).toList(),
                      onChanged: (String? newval) {
                        setState(() {
                          selectedLocation = newval.toString();
                          _otherLocation = newval.toString();
                          if (newval == 'Other') {
                            _showTextDield = true;
                          } else {
                            _showTextDield = false;
                            serviceAreaDataController.clear();
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: _showTextDield,
                      child: TextFormField(
                        controller: serviceAreaDataController,
                        decoration: InputDecoration(
                            labelText: "Enter $_otherLocation area of service"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                color: Colors.white,
                width: size,
                height: 200,
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'How would you rate the experience?',
                        style: TextStyle(color: LightColor.black, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: LightColor.darkRed, ), 
                          )
                        ],
                      ), 
                      ),
                    SizedBox(height: 10),
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
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
                            _ratingValue1 = value.round();
                          });
                          SizedBox(height: 25);
                          // Display the rate in number
                        }),
                    Text(
                      //_ratingValue.toString(),
                      _ratingValue1 != null
                          ? _ratingValue1.toString()
                          : 'Rate it',
                      style:
                          const TextStyle(color: Colors.blueGrey, fontSize: 16),
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
                width: size,
                height: 200,
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'How would you rate staff courtesy?',
                        style: TextStyle(color: LightColor.black, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: LightColor.darkRed, ), 
                          )
                        ],
                      ), 
                      ),
                    SizedBox(height: 10),
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
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
                            _ratingValue2 = value.round();
                          });
                          SizedBox(height: 25);
                          // Display the rate in number
                        }),
                    Text(
                      //_ratingValue.toString(),
                      _ratingValue2 != null
                          ? _ratingValue2.toString()
                          : 'Rate it',
                      style:
                          const TextStyle(color: Colors.blueGrey, fontSize: 16),
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
                width: size,
                height: 200,
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'How would you rate our facilities?',
                        style: TextStyle(color: LightColor.black, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: LightColor.darkRed, ), 
                          )
                        ],
                      ), 
                      ),
                    SizedBox(height: 10),
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
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
                            _ratingValue3 = value.round();
                          });
                          SizedBox(height: 25);
                          // Display the rate in number
                        }),
                    Text(
                      //_ratingValue.toString(),
                      _ratingValue3 != null
                          ? _ratingValue3.toString()
                          : 'Rate it',
                      style:
                          const TextStyle(color: Colors.blueGrey, fontSize: 16),
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
                width: size,
                height: 220,
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'How would you rate our timeliness of service?',
                        style: TextStyle(color: LightColor.black, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: LightColor.darkRed, ), 
                          )
                        ],
                      ), 
                      ),
                    SizedBox(height: 10),
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
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
                            _ratingValue4 = value.round();
                          });
                          SizedBox(height: 25);
                          // Display the rate in number
                        }),
                    Text(
                      //_ratingValue.toString(),
                      _ratingValue4 != null
                          ? _ratingValue4.toString()
                          : 'Rate it',
                      style:
                          const TextStyle(color: Colors.blueGrey, fontSize: 16),
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
                width: size,
                height: 200,
                child: Column(
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'How would you recommend us to others?',
                        style: TextStyle(color: LightColor.black, fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: ' *',
                            style: TextStyle(color: LightColor.darkRed, ), 
                          )
                        ],
                      ), 
                      ),
                    SizedBox(height: 10),
                    RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
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
                            _ratingValue5 = value.round();
                          });
                          SizedBox(height: 25);
                          // Display the rate in number
                        }),
                    Text(
                      //_ratingValue.toString(),
                      _ratingValue5 != null
                          ? _ratingValue5.toString()
                          : 'Rate it',
                      style:
                          const TextStyle(color: Colors.blueGrey, fontSize: 16),
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
                //width: 370,
                width: size,
                height: 100,
                child: Column(children: [
                  TextFormField(
                    controller: overallController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: LightColor.black, fontWeight: FontWeight.w600),
                      labelText: 'Overall Remark',
                    ),
                  ),
                ]),
              ),
             const  SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: LightColor.darkRed, // background
                      onPrimary: Colors.white, // foreground
                      fixedSize: const Size(320, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () async {
                    String serviceAreaData = serviceAreaDataController.text;
                    String serviceArea = selectedLocation;
                    String staffCourtesyRm = staffCourtesyRmController.text;
                    String staffCourtesy = _ratingValue2.toString();
                    String email = emailController.text;
                    String experienceRm = experienceRmController.text;
                    String experience = _ratingValue1.toString();
                    String facilitiesRm = facilitiesRmController.text;
                    String facilities = _ratingValue3.toString();
                    String overall = overallController.text;
                    String phone = phoneController.text;
                    String recommendRm = recommentRmController.text;
                    String recommend = _ratingValue5.toString();
                    String timelinessRm = timelinessRmController.text;
                    String timeliness = _ratingValue4.toString();
                    String uName = nameController.text;
                    String source = "1";
    
                    print(
                        'feed ${uName} ${email} ${cCode} ${phone} ${serviceArea} ${serviceAreaData} ${experience} ${experienceRm} ${staffCourtesy} ${staffCourtesyRm} ${facilities} ${facilitiesRm} ${timelinessRm} ${timeliness} ${recommend} ${recommendRm} ${overall} ${source}');
    
                    String? status;
                    await postFeedback(
                            serviceArea,
                            serviceAreaData,
                            cCode,
                            staffCourtesyRm,
                            staffCourtesy,
                            email,
                            experienceRm,
                            experience,
                            facilitiesRm,
                            facilities,
                            overall,
                            phone,
                            recommendRm,
                            recommend,
                            timelinessRm,
                            timeliness,
                            uName,
                            source)
                        .then((value) {
                      status = value?.status;
                    });
    
                    if (status == "Success") {
                      serviceAreaDataController.clear();
    
    
                      // Alert(
                      //   context: context,
                      //   type: AlertType.success,
                      //   title: "Thanks for the feedback!",
                      //   //desc: "Flutter is more awesome with RFlutter Alert.",
                      //   buttons: [],
                      // ).show();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThanksPage()),
                      );
                    } else {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Problem here!",
                        //desc: "Flutter is more awesome with RFlutter Alert.",
                        buttons: [],
                      ).show();
                    }
                  },
                  child: Text(
                    'SUBMIT',
                    style: GoogleFonts.lato(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
