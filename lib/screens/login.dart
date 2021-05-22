// import 'package:agritab/api/models/user.dart';
// import 'package:agritab/constants.dart';
// import 'package:agritab/utlis/inputs_validation.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../screen/dashboard.dart';
// import '../api/services/api_user_services.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   UserServices get service => GetIt.I<UserServices>();
//   // Future<APIResponses<User>> _apiResponses;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//   var userEmail = "";
//   var userPassword = "";

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   _checkPages() async {
//     SharedPreferences local = await SharedPreferences.getInstance();
//     if (local.getString('token') != null) {
//       if (local.getString('token') != null) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => DashBoard()),
//         );
//       }
//     } else {
//       return null;
//     }
//   }

//   void _validateInputs() async {
//     FocusScope.of(context).unfocus();
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();
//       print(_formKey.currentState);
//       print(">>>>>>>>>>>>>>>>>>>> Go to Home page");

//       try {
//         setState(() {
//           isLoading = true;
//         });
//         final user = CreateUser(
//             email: emailController.text,
//             password: passwordController.text,
//             deviceName: "Mobile");
//         final result = await service
//             .logUserIn(user); // Appel du service de creation de note

//         setState(() {
//           isLoading = false;
//         });

//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return DashBoard();
//         }));
//       } catch (error) {
//         print("Error : $error");
//       }
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     _checkPages();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kGreyColor,
//       body: Center(
//         child: Card(
//           margin: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 // Cette clé permet d'écoute les évenement qui ont lieu uniquement que ce formulaire
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       child: Text(
//                         "Agri-Tab",
//                         style: TextStyle(
//                             fontSize: 30,
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     TextFormField(
//                       key: ValueKey(
//                           'email'), // Cette clé permet à flutter de reconnaitre de manière unique cette entré
//                       validator: validateEmail,
//                       controller: emailController,
//                       onSaved: (value) {
//                         // Permet de sauvegarde les entrées de l'user suivant que ses entrées sont bonnes ou pas
//                         userEmail = value;
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(hintText: "Adresse mail"),
//                     ),
//                     TextFormField(
//                       key: ValueKey('password'),
//                       // validator: validatePassword,
//                       controller: passwordController,
//                       onSaved: (value) {
//                         userPassword = value;
//                       },
//                       obscureText: true,
//                       decoration: InputDecoration(hintText: "Mot de passe"),
//                     ),
//                     SizedBox(height: 15),
//                     if (isLoading)
//                       CircularProgressIndicator(backgroundColor: Colors.green)
//                     else
//                       RaisedButton(
//                         onPressed: _validateInputs,
//                         // onPressed: () {
//                         //   Navigator.pushReplacement(context,
//                         //       MaterialPageRoute(builder: (context) {
//                         //     return DashBoard();
//                         //   }));
//                         // },
//                         child: Text('Connexion'),
//                       ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text("Une agriculture nouvelle"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
