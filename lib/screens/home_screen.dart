import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_kyrmann/models/api_response.dart';
import 'package:test_kyrmann/models/marchandise.dart';
import 'package:test_kyrmann/screens/marchandise.dart';
import 'package:test_kyrmann/services/api.dart';
import 'package:test_kyrmann/widgets/marchandise_item.dart';

var token = "";

class HomeScreen extends StatefulWidget {
  static const routeName = '/dashbord';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  API get service => GetIt.I<API>();
  APIResponses<List<Marchandise>> _apiResponses;

  String appBarTitle;
  // ========== SYNC TEST start=====================
  // ========== SYNC TEST end=====================

  int count = 0;
  var _marchandise = [];
  bool _isLoading = false;
  bool _isOnline = true;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _getMarchandises();
    super.initState();
  }

  _getMarchandises() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponses = await service.getAllMarchandise();
    _marchandise = _apiResponses.data;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Mon-Store';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title,
              style: TextStyle(
                fontFamily: 'Anton',
                fontSize: 24,
                color: Colors.black,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        // drawer: DrawerUiApp(),
        body: ListView.builder(
          itemCount: _apiResponses == null ? 0 : _apiResponses.data.length,
          itemBuilder: (context, i) {
            return MarchandiseItem();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return MarchandiseScreen();
            }));
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
