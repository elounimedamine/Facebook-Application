class EndUser {
  EndUser({
    required this.uid,
    this.email,
    this.fullname,
    this.username,
    this.avatarUrl,
    this.phone,
  });

  String uid;
  String? email;
  String? fullname;
  String? username;
  String? avatarUrl;
  String? phone;

  factory EndUser.fromJson(Map<String, dynamic> json) => EndUser(
        uid: json["uid"],
        email: json["email"],
        fullname: json["fullname"],
        username: json["username"],
        avatarUrl: json["avatar_url"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "fullname": fullname,
        "username": username,
        "avatar_url": avatarUrl,
        "phone": phone,
      };
}
