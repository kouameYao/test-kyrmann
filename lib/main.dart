import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_kyrmann/services/api.dart';
import 'screens/login_screen.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => API());
  // "I" is the shortcut of "intance"
}

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY-STORE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
