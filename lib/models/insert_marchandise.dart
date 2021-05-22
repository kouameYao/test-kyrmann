import 'package:flutter/foundation.dart';

class MarchandiseManipulation {
  String marchandiseName;
  String marchandiseQuantity;

  MarchandiseManipulation({
    @required this.marchandiseName,
    @required this.marchandiseQuantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "noteTitle": marchandiseName,
      "noteContent": marchandiseQuantity,
    };
  }
}
