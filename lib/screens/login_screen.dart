import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_kyrmann/helpers/inputs_validation.dart';
import 'package:test_kyrmann/models/user.dart';
import 'package:test_kyrmann/services/api.dart';

import '../constant.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  API get service => GetIt.I<API>();
  // // Future<APIResponses<User>> _apiResponses;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  var userEmail = "";
  var userPassword = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _login() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_formKey.currentState);
      print(">>>>>>>>>>>>>>>>>>>> Go to Home Screen");

      try {
        setState(() {
          isLoading = true;
        });
        final user = User(
          utilisateuremail: emailController.text,
          utilisateurpassword: passwordController.text,
        );

        print(user);

        final result = await service
            .logUserIn(user); // Appel du service de creation de note

        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      } catch (error) {
        print("Error : $error");

        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor,
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                // Cette clé permet d'écoute les évenement qui ont lieu uniquement que ce formulaire
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Mon~Store",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      key: ValueKey(
                          'email'), // Cette clé permet à flutter de reconnaitre de manière unique cette entré
                      validator: validEmail,
                      controller: emailController,
                      onSaved: (value) {
                        // Permet de sauvegarde les entrées de l'user suivant que ses entrées sont bonnes ou pas
                        userEmail = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "Adresse mail"),
                    ),
                    TextFormField(
                      key: ValueKey('password'),
                      controller: passwordController,
                      onSaved: (value) {
                        userPassword = value;
                      },
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Mot de passe"),
                    ),
                    SizedBox(height: 15),
                    if (isLoading)
                      CircularProgressIndicator(backgroundColor: Colors.green)
                    else
                      RaisedButton(
                        // onPressed: _login,
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        },
                        child: Text('Connexion'),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
