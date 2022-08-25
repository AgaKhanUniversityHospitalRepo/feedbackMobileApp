import 'dart:convert';

 PostResponse postFromJson(String str) => PostResponse.fromJson(json.decode(str));


class PostResponse {
    PostResponse({
        required this.message,
        required this.body,
    });

    String message;
    String body;

    factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        message: json["message"],
        body: json["body"],
    );

 
}
