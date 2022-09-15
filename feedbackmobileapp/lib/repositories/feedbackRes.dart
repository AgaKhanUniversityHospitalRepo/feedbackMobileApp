import 'dart:convert';
import 'dart:io';
import 'package:feedbackmobileapp/models/feedbackReq.dart';
import 'package:feedbackmobileapp/repositories/postRes.dart';
import 'package:http/http.dart' as http;


Future<PostResponse?> postFeedback(
  String areaOfService,
     String areaOfServiceOther,
     String cCode,
     String courtRm,
     String courtRt,
     String email,
     String expRm,
     String expRt,
     String facilitiesRm,
     String facilitiesRt,
     String ovRm,
     String phone,
     String recommendRm,
     String recommendRt,
     String timelinessRm,
     String timelinessRt,
     String uName,
     String source,
     ) async{
  final response = await http.post(Uri.parse("https://nbi-intranet.ea.aku.edu/feedbackapi/api/v1/feedback"),
   headers: {
        "content-type" : "application/json",
      },
  body: jsonEncode( {
     'areaOfService' : areaOfService,
     'areaOfServiceOther' : areaOfServiceOther,
     'cCode': cCode,
     'courtRm': courtRm,
     'courtRt': courtRt,
     'email': email,
     'expRm': expRm,
     'expRt': expRt,
     'facilitiesRm': facilitiesRm,
     'facilitiesRt': facilitiesRt,
     'ovRm': ovRm,
     'phone': phone,
     'recommendRm': recommendRm,
     'recommendRt': recommendRt,
     'timelinessRm': timelinessRm,
     'timelinessRt': timelinessRt,
     'uName': uName,
     'source':source,
  }));

  print("Bbbbody" + jsonEncode( {
     'areaOfService' : areaOfService,
     'areaOfServiceOther' : areaOfServiceOther,
     'cCode': cCode,
     'courtRm': courtRm,
     'courtRt': courtRt,
     'email': email,
     'expRm': expRm,
     'expRt': expRt,
     'facilitiesRm': facilitiesRm,
     'facilitiesRt': facilitiesRt,
     'ovRm': ovRm,
     'phone': phone,
     'recommendRm': recommendRm,
     'recommendRt': recommendRt,
     'timelinessRm': timelinessRm,
     'timelinessRt': timelinessRt,
     'uName': uName,
     'source':source,
  }));

  if(response.statusCode == 200){
    final String responseString = response.body;
    print(response.body);
    return postFromJson(responseString);
  }else{
    print(response.body);
    return null;
  }
}


 
class PostFeedback {
  final String url = "https://nbi-intranet.ea.aku.edu/feedbackapi/api/v1/feedback";

Future<FeedbackReq> postData(FeedbackReq feedbackReq) async {
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
            'areaOfService' : feedbackReq.areaOfService,
     'areaOfServiceOther' : feedbackReq.areaOfServiceOther,
     'cCode': feedbackReq.cCode,
     'courtRm': feedbackReq.courtRm,
     'courtRt': feedbackReq.courtRt,
     'email': feedbackReq.email,
     'expRm': feedbackReq.expRm,
     'expRt': feedbackReq.expRt,
     'facilitiesRm': feedbackReq.facilitiesRm,
     'facilitiesRt': feedbackReq.facilitiesRt,
     'ovRm': feedbackReq.ovRm,
     'phone': feedbackReq.phone,
     'recommendRm': feedbackReq.recommendRm,
     'recommendRt': feedbackReq.recommendRt,
     'timelinessRm': feedbackReq.timelinessRm,
     'timelinessRt': feedbackReq.timelinessRt,
     'uName': feedbackReq.uName,
     'source': feedbackReq.source,
        }),

  );

  if (response.statusCode == 200) {
    print('Success');
    return FeedbackReq.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
}
