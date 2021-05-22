// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:tests/models/http/note.dart';
// import 'package:tests/models/http/note_insert.dart';
// import 'package:tests/services/notes_service.dart';

// class NoteModify extends StatefulWidget {
//   final String noteID;
//   NoteModify({this.noteID});

//   @override
//   _NoteModifyState createState() => _NoteModifyState();
// }

// class _NoteModifyState extends State<NoteModify> {
//   bool get isEditing => widget.noteID != null;

//   NotesService get noteService => GetIt.I<NotesService>();

//   String errorMessage;
//   Note note;

//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _contentController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void initState() {

//     super.initState();

//     // On recupère l'élément qui arrive sur la fenetre grace à son Id
//     if(isEditing) {
//       setState(() {
//         _isLoading = true;
//       });

//       noteService.getNote(widget.noteID).then((response) {

//       setState(() {
//           _isLoading = false;
//       });

//       if(response.error){
//         errorMessage = response.errorMessage ?? 'An error occurred';
//         // On gère les erreur
//       }
//       // On insère le nouvel élément dans notre instance note de Note
//       note = response.notes;
//       // On donne les différents contenu aux controller
//       _titleController.text = note.noteTitle;
//       _contentController.text = note.noteContent;
//     });

//     }

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(isEditing ? 'Update note' : 'Create note'),
//       ),

//       body: isEditing && _isLoading ? Center(child: CircularProgressIndicator()) : Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: InputDecoration(hintText: 'Note title')),
//             SizedBox(height: 8),
//             TextField(
//               controller: _contentController,
//               decoration: InputDecoration(hintText: 'Note content')),
//             SizedBox(height: 12),
//             SizedBox(
//               width: double.infinity,
//               child: RaisedButton(
//                 onPressed: () async {
//                   if(isEditing) {
//                     // Update note
//                     setState(() {
//                       _isLoading = true;
//                     });

//                     final note = NoteManipulation(
//                       noteContent: _titleController.text,
//                       noteTitle: _contentController.text,
//                     );

//                     final result  = await noteService.updateNote(widget.noteID, note); // Appel du service de creation de note

//                     setState(() {
//                       _isLoading = false;
//                     });

//                     final title = "Done";
//                     final text = result.error ? (result.errorMessage ?? 'An error occurred') : "Your note was updated";

//                     showDialog(
//                       context: context,
//                       builder : (_) => AlertDialog(
//                         title: Text(title),
//                         content: Text(text),
//                         actions: [
//                           FlatButton(
//                             child: Text("OK"),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                     ],),)
//                     .then((data) {
//                       if(result.notes) {
//                         Navigator.of(context).pop();
//                       }
//                     });
//                   } else {
//                     // Create note
//                     setState(() {
//                       _isLoading = true;
//                     });

//                     final note = NoteManipulation(
//                       noteContent: _titleController.text,
//                       noteTitle: _contentController.text,
//                     );

//                     final result  = await noteService.createNote(note); // Appel du service de creation de note

//                     setState(() {
//                       _isLoading = false;
//                     });

//                     final title = "Done";
//                     final text = result.error ? (result.errorMessage ?? 'An error occurred') : "Your note was created";

//                     showDialog(
//                       context: context,
//                       builder : (_) => AlertDialog(
//                         title: Text(title),
//                         content: Text(text),
//                         actions: [
//                           FlatButton(
//                             child: Text("OK"),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                     ],),)
//                     .then((data) {
//                       if(result.notes) {
//                         Navigator.of(context).pop();
//                       }
//                     });
//                   }
//                 },
//                 color: Theme.of(context).primaryColor,
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
