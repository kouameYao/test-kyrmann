// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../shared/globals.dart';

// class HomeFoodCard extends StatelessWidget {
//   final Function onPress;
//   final String title;
//   final String description;
//   final String par;
//   final String image;
//   final double price;

//   const HomeFoodCard({
//     Key key,
//     this.onPress,
//     this.title,
//     this.description,
//     this.par,
//     this.image,
//     this.price,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return InkWell(
//       onTap: () {
//         Navigator.of(context).push(
//           PageRouteBuilder(
//             transitionDuration: Duration(milliseconds: 1500),
//             pageBuilder: (BuildContext context, Animation<double> animation,
//                 Animation<double> secondaryAnimation) {
//               return FoodDetailScreen(
//                 "Titre nourriture",
//                 1250,
//                 "superbe nourriture. Elle tire son origine dans les marmite afro",
//                 "chef Adou",
//                 "image",
//               );
//             },
//             transitionsBuilder: (BuildContext context,
//                 Animation<double> animation,
//                 Animation<double> secondaryAnimation,
//                 Widget child) {
//               return Align(
//                 child: FadeTransition(
//                   opacity: animation,
//                   child: child,
//                 ),
//               );
//             },
//           ),
//         );
//       },
//       child: Card(
//         elevation: 1.0,
//         child: Stack(children: [
//           Container(
//             // margin: EdgeInsets.only(left: 20, bottom: 5, right: 5),
//             width: double.infinity,
//             height: size.height * 0.35,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Hero(
//                   tag: 'image',
//                   child: Container(
//                     margin: EdgeInsets.all(3),
//                     width: size.width - 15,
//                     decoration: BoxDecoration(
//                       // color: Colors.grey.shade100,
//                       color: Colors.black12,
//                       borderRadius: BorderRadius.circular(5),
//                       image: DecorationImage(
//                         image: NetworkImage(
//                             "https://www.ionlycameforthecake.com/wp-content/uploads/2019/12/Feeling-guilty-after-eating-featured-image-min.png"),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             right: 5,
//             bottom: 4,
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               width: size.width - 17.5,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.6),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Ice & Cream",
//                     style: GoogleFonts.ubuntu(
//                       color: Global.kwhiteColor,
//                       fontSize: 20,
//                     ),
//                   ),
//                   Text(
//                     "1200 XOF",
//                     style: GoogleFonts.ubuntu(
//                       color: Global.kwhiteColor,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
