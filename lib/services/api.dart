// import 'dart:convert';

// class ActivitesServices with ChangeNotifier {
//   List<Activite> _activites = [];

//   List<Activite> get item {
//     return [..._activites];
//   }

//   static const apiUrl = "https://agritab-fullstack.herokuapp.com/api";

//   Future<APIResponses<List<Activite>>> getAllActivites(int phaseId) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString('token');

//     print(
//         'Begin in getAllProjet------------------------------- Token : $token');

//     final headers = {
//       'Authorization': 'Bearer ' + token,
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };

//     return await http
//         .get(apiUrl + '/phases/$phaseId/activites', headers: headers)
//         .then((response) {
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         final phases = <Activite>[];

//         for (var item in jsonData['data']) {
//           phases.add(Activite.fromJson(
//               item)); // Cette fonction Activite.fromJson est implémentté dans note_for_listing.dart
//         }

//         print(
//             'End in get phases--------------------------------------------------');
//         return APIResponses<List<Activite>>(data: phases);
//       }
//       return APIResponses<List<Activite>>(
//           error: true,
//           errorMessage: 'Erreur, veillez contacté votre support technique ');
//     }).catchError((e) {
//       print(e.error);
//     });
//   }

//   Future<APIResponses<Activite>> getActivite(int activiteID) async {
//     // Il faut passer l'id de l'activite en question dans la fonction getNote
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString('token');

//     print(
//         'Begin in getAllProjet------------------------------- Token : $token');

//     final headers = {
//       'Authorization': 'Bearer ' + token,
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };

//     return http
//         .get(apiUrl + '/activites/$activiteID', headers: headers)
//         .then((response) {
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         return APIResponses<Activite>(
//             data: Activite.fromJson(jsonData['data']));
//       }
//       return APIResponses<Activite>(
//           error: true, errorMessage: 'Une erreur est survenue');
//     }).catchError((_) => APIResponses<Activite>(
//             error: true, errorMessage: 'Une erreur est survenue'));
//   }

// // // Ici, nous avons besoin d'un booléen pour nous dire si la creation de notre note a été avec success
//   Future<APIResponses<bool>> createActivite(ActiviteManipulation item) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString('token');

//     print(
//         'Begin in getAllProjet------------------------------- Token : $token');

//     final headers = {
//       'Authorization': 'Bearer ' + token,
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };

//     print(json.encode(item.toJson()));

//     return http
//         .post(apiUrl + '/activites',
//             headers: headers, body: json.encode(item.toJson()))
//         .then((response) {
//       if (response.statusCode == 200) {
//         return APIResponses<bool>(data: true);
//       }
//       return APIResponses<bool>(
//           error: true, errorMessage: 'Une erreur est survenue');
//     }).catchError((_) => APIResponses<bool>(
//             error: true, errorMessage: 'Une erreur est survenue'));
//   }

//   // Il est à noter que les memes éléments de la creation servent à la modification
//   // Ici, il faut dire qu'en plus de la classe note, nous avons besoin de faire passer l'ID de la note en question en parametres
//   Future<APIResponses<bool>> updateActivite(
//       int activiteID, ActiviteManipulation activite) async {
//     final SharedPreferences sharedPreferences =
//         await SharedPreferences.getInstance();
//     var token = sharedPreferences.getString('token');

//     print(
//         'Begin in getAllProjet------------------------------- Token : $token');

//     final headers = {
//       'Authorization': 'Bearer ' + token,
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     return http
//         .put(apiUrl + '/activites/$activiteID',
//             headers: headers, body: json.encode(activite.toJson()))
//         .then((notes) {
//       if (notes.statusCode == 200) {
//         return APIResponses<bool>(data: true);
//       }
//       return APIResponses<bool>(
//           error: true, errorMessage: 'Une erreur est survenue');
//     }).catchError((_) => APIResponses<bool>(
//             error: true, errorMessage: 'Une erreur est survenue'));
//   }

//   Future<APIResponses<bool>> deleteNote(String noteID) {
//     return http
//         .delete(
//             'https://8f9cbdf8-7657-4678-ba75-0e68ff33665b.mock.pstmn.io/activite/' +
//                 '/notes/' +
//                 noteID)
//         .then((notes) {
//       if (notes.statusCode == 204) {
//         return APIResponses<bool>(data: true);
//       }
//       return APIResponses<bool>(
//           error: true, errorMessage: 'Une erreur est survenue');
//     }).catchError((_) => APIResponses<bool>(
//             error: true, errorMessage: 'Une erreur est survenue'));
//   }
// }
