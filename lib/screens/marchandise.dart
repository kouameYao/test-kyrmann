import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_kyrmann/models/insert_marchandise.dart';
import 'package:test_kyrmann/services/api.dart';

class MarchandiseScreen extends StatefulWidget {
  final String noteID;
  MarchandiseScreen({this.noteID});

  @override
  _MarchandiseScreenState createState() => _MarchandiseScreenState();
}

class _MarchandiseScreenState extends State<MarchandiseScreen> {
  bool get isEditing => widget.noteID != null;

  API get service => GetIt.I<API>();

  String errorMessage;
  // Note note;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _quantityontroller = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: new Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
        ),
        title: Text(isEditing ? 'Modifier Marchandise' : 'Créer Marchandise',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: isEditing && _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                      controller: _titleController,
                      decoration: InputDecoration(hintText: 'Libelle')),
                  SizedBox(height: 8),
                  TextField(
                      controller: _quantityontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'quantité')),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.grey,
                      onPressed: () async {
                        if (isEditing) {
                          // Ecrire ici la fonction de modification d'une marchandise
                        } else {
                          // Create note
                          setState(() {
                            _isLoading = true;
                          });

                          final marchandise = MarchandiseManipulation(
                            marchandiseName: _titleController.text,
                            marchandiseQuantity: _quantityontroller.text,
                          );

                          final result = await service.createMarchandise(
                              marchandise); // Appel du service de creation de note

                          setState(() {
                            _isLoading = false;
                          });

                          final title = "Done";
                          final text = result.error
                              ? (result.errorMessage ?? 'An error occurred')
                              : "Your note was created";

                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(title),
                              content: Text(text),
                              actions: [
                                FlatButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ).then((data) {
                            if (result.data) {
                              Navigator.of(context).pop();
                            }
                          });
                        }
                      },
                      child: Text(
                        "Enregistrer",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
