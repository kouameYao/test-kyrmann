// To parse this JSON data, do

class User {
  User({
    this.utilisateuremail,
    this.utilisateurpassword,
  });

  String utilisateuremail;
  String utilisateurpassword;

  factory User.fromJson(Map<String, dynamic> json) => User(
        utilisateuremail: json["utilisateuremail"],
        utilisateurpassword: json["utilisateurpassword"],
      );

  Map<String, dynamic> toJson() => {
        "utilisateuremail": utilisateuremail,
        "utilisateurpassword": utilisateurpassword,
      };
}
