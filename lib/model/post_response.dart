import 'dart:convert';
//
// PostResponse postResponseFromJson(String str) =>
//     PostResponse.fromJson(json.decode(str));

List<PostResponse> postResponseFromJson(String str) =>
    List<PostResponse>.from(
        json.decode(str).map((x) => PostResponse.fromJson(x)));

// String postResponseToJson(PostResponse data) => json.encode(data.toJson());

class PostResponse {

  PostResponse({
    this.title,
    this.body,
    this.id,
  });

  String? title;
  String? body;
  int? id;

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
    title: json["title"],
    body: json["body"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": title,
    "age": body,
    "count": id,
  };
}