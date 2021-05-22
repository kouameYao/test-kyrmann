// var token = "";

// class DashBoard extends StatefulWidget {
//   static const routeName = '/dashbord';

//   @override
//   _DashBoardState createState() => _DashBoardState();
// }

// class _DashBoardState extends State<DashBoard> {
//   ProjetsServices get service => GetIt.I<ProjetsServices>();
//   APIResponses<List<APIProjet>> _apiResponses;

//   DatabaseHelper databaseHelper = DatabaseHelper();
//   List<SQFliteProjet> projetList;

//   String appBarTitle;
//   // ========== SYNC TEST start=====================
//   SyncProjet syncProjet;
//   // ========== SYNC TEST end=====================

//   int count = 0;
//   var _projet = [];
//   bool _isLoading = false;
//   bool _isOnline = true;

//   String formatDateTime(DateTime dateTime) {
//     return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//   }

//   @override
//   void initState() {
//     _fetchNotes();
//     super.initState();
//   }

//   _fetchNotes() async {
//     setState(() {
//       _isLoading = true;
//     });

//     _apiResponses = await service.getAllProjets();
//     _projet = _apiResponses.data;

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _save(SQFliteProjet proj) async {
//     var result = await databaseHelper.insertProjet(proj);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final title = 'Agri-Tab';
//     // final projets = Provider.of<ProjetsServices>(context);

//     if (projetList == null) {
//       projetList = [];
//       updateListView();
//     }
//     return MaterialApp(
//       title: title,
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: GestureDetector(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 13.0, left: 10),
//               child: Stack(
//                 children: [
//                   Icon(
//                     Icons.sync_outlined,
//                     color: Colors.grey,
//                     size: 26,
//                   ),
//                   Positioned(
//                     top: 0,
//                     right: 10,
//                     child: Container(
//                       width: 15,
//                       height: 15,
//                       decoration: BoxDecoration(
//                           color: Colors.red, shape: BoxShape.circle),
//                       child: Center(
//                           child: Text(
//                         "10",
//                         style:
//                             TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
//                       )),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             onTap: () {
//               Get.to(
//                 () => SyncScreen(),
//                 fullscreenDialog: true,
//               );
//             },
//           ),
//           title: Text(title,
//               style: TextStyle(
//                 fontFamily: 'Anton',
//                 fontSize: 24,
//                 color: Colors.black,
//               )),
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Text(
//                 //   _isOnline ?  : "H.ligne",
//                 //   style: TextStyle(
//                 //       fontSize: 16,
//                 //       color: _isOnline ? Colors.green : Colors.grey),
//                 // ),
//                 Switch.adaptive(
//                     activeColor: _isOnline ? Colors.green : Colors.grey,
//                     value: _isOnline,
//                     onChanged: (value) {
//                       setState(() {
//                         _isOnline = value;
//                       });
//                     }),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: CircleAvatar(
//                 backgroundColor: kGreyColor,
//                 child: PopupMenuButton(
//                   onSelected: (DropdownOptions selectedValue) {
//                     setState(() async {
//                       if (selectedValue == DropdownOptions.Deconnexion) {
//                         final SharedPreferences sharedPreferences =
//                             await SharedPreferences.getInstance();
//                         sharedPreferences.remove('token');
//                         Navigator.pushReplacement(context,
//                             MaterialPageRoute(builder: (context) {
//                           return LoginScreen();
//                         }));
//                         // Get.to(
//                         //   () => LoginScreen(),
//                         // );
//                       }
//                     });
//                   },
//                   icon: Icon(Icons.more_vert, color: Colors.black),
//                   itemBuilder: (_) => [
//                     PopupMenuItem(
//                       value: DropdownOptions.Deconnexion,
//                       child: Row(
//                         children: [
//                           Icon(Icons.exit_to_app, color: Colors.black),
//                           Text('Déconnexion',
//                               style: TextStyle(fontFamily: 'Lato')),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // drawer: DrawerUiApp(),
//         body: _isOnline ? buildAPIContent() : SQFliteDashboard(),
//       ),
//     );
//   }
