// To parse this JSON data, do

class Marchandise {
  Marchandise({
    this.marchandiseId,
    this.marchandiseName,
    this.marchandiseQuantity,
  });

  int marchandiseId;
  String marchandiseName;
  String marchandiseQuantity;

  factory Marchandise.fromJson(Map<String, dynamic> json) => Marchandise(
        marchandiseId: json["marchandiseid"],
        marchandiseName: json["marchandisename"],
        marchandiseQuantity: json["marchandisequantity"],
      );

  Map<String, dynamic> toJson() => {
        "marchandisename": marchandiseName,
        "marchandisequantity": marchandiseQuantity,
      };
}
