import 'dart:convert';

 PostResponse postFromJson(String str) => PostResponse.fromJson(json.decode(str));


class PostResponse {
    PostResponse({
      required this.status,
        required this.message,
        required this.body,
    });

  String status;
    String message;
    String body;

    factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        status: json["status"],
        message: json["message"],
        body: json["body"],
    );

 
}
