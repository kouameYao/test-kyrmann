import 'dart:convert';
import 'package:test_kyrmann/models/api_response.dart';
import 'package:test_kyrmann/models/insert_marchandise.dart';
import 'package:test_kyrmann/models/marchandise.dart';
import 'package:http/http.dart' as http;
import 'package:test_kyrmann/models/user.dart';

class API {
  static const apiUrl = "http://192.168.1.102:9401/market";
  static const headers = {
    // 'apikey' : '165fd21a-63fc-4873-9079-b1ce4b283629',
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  logUserIn(User user) async {
    var jsonResponse;
    var response = await http.post(apiUrl + '/utilisateur/login',
        body: json.encode(user.toJson()));
    //Here we will check the response of api
    if (response.statusCode == 200) {
      print("Response body : ${response.body} ");
      jsonResponse = json.decode(response.body);

      // }
    }

    return jsonResponse;
    // return APIResponses<User>(
    //     error: true, errorMessage: 'Quelque chose de mauvais s\est passé ');
  }

  Future<APIResponses<List<Marchandise>>> getAllMarchandise() async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    return await http
        .get(apiUrl + '/marchandise/getall', headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final marchandises = <Marchandise>[];

        for (var item in jsonData['data']) {
          marchandises.add(Marchandise.fromJson(
              item)); // Cette fonction Activite.fromJson est implémentté dans note_for_listing.dart
        }

        print(
            'End in get phases--------------------------------------------------');
        return APIResponses<List<Marchandise>>(data: marchandises);
      }
      return APIResponses<List<Marchandise>>(
          error: true,
          errorMessage: 'Erreur, veillez contacté votre support technique ');
    }).catchError((e) {
      print(e.error);
    });
  }

  Future<APIResponses<bool>> createMarchandise(
      MarchandiseManipulation item) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    print(json.encode(item.toJson()));

    return http
        .post(apiUrl + '/marchandise/add?marchandise=&file=',
            body: json.encode(item.toJson()))
        .then((response) {
      if (response.statusCode == 200) {
        return APIResponses<bool>(data: true);
      }
      return APIResponses<bool>(
          error: true, errorMessage: 'Une erreur est survenue');
    }).catchError((_) => APIResponses<bool>(
            error: true, errorMessage: 'Une erreur est survenue'));
  }
}
