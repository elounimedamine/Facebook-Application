import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

List<Post> ListPostFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String ListPostToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.author,
    this.text,
    this.media,
    required this.addedAt,
    required this.privacy,
    //required this.liked,
  });

  String author;
  String? text;
  String? media;
  String addedAt;
  String privacy;
  //List<dynamic> liked;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        author: json["author"],
        text: json["text"],
        media: json["media"],
        addedAt: json["added_at"],
        privacy: json["privacy"],
        //liked: List<String>.from(json["liked"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "text": text,
        "media": media,
        "added_at": addedAt,
        "privacy": privacy,
        //"liked": List<dynamic>.from(liked.map((x) => x)),
      };
}
