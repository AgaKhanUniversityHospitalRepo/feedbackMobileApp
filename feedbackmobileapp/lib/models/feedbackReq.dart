class FeedbackReq{
     String areaOfService;
     String areaOfServiceOther;
     String cCode;
     String courtRm;
     String courtRt;
     String email;
     String expRm;
     String expRt;
     String facilitiesRm;
     String facilitiesRt;
     String ovRm;
     String phone;
     String recommendRm;
     String recommendRt;
     String timelinessRm;
     String timelinessRt;
     String uName;

      FeedbackReq ({
       required this.areaOfService,
        required this.areaOfServiceOther,
        required this.cCode,
        required this.courtRm,
        required this.courtRt,
        required this.email,
        required this.expRm,
        required this.expRt,
        required this.facilitiesRm,
        required this.facilitiesRt,
        required this.ovRm,
        required this.phone,
        required this.recommendRm,
        required this.recommendRt,
        required this.timelinessRm,
        required this.timelinessRt,
        required this.uName,
     });

       factory FeedbackReq.fromJson(Map<String, dynamic> json) {
    return FeedbackReq(
      areaOfService: json['areaOfService'],
      areaOfServiceOther: json['areaOfServiceOther'],
      cCode: json['cCode'],
      courtRm: json['courtRm'],
      courtRt: json['courtRt'],
      email: json['email'],
      expRm: json['expRm'],
      expRt: json['expRt'],
      facilitiesRm: json['facilitiesRm'],
      facilitiesRt: json['facilitiesRt'],
      ovRm: json['ovRm'],
      phone: json['phone'],
      recommendRm: json['recommendRm'],
      recommendRt: json['recommendRt'],
      timelinessRm: json['timelinessRm'],
      timelinessRt: json['timelinessRt'],
      uName: json['uName'],
    );
  }
}

