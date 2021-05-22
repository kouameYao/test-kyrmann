// To parse this JSON data, do

class User {
  User({
    this.marchandiseName,
    this.marchandiseQuantity,
  });

  String marchandiseName;
  String marchandiseQuantity;

  factory User.fromJson(Map<String, dynamic> json) => User(
        marchandiseName: json["marchandisename"],
        marchandiseQuantity: json["marchandisequantity"],
      );

  Map<String, dynamic> toJson() => {
        "marchandisename": marchandiseName,
        "marchandisequantity": marchandiseQuantity,
      };
}
