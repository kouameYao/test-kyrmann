import 'package:flutter/material.dart';

class MarchandiseItem extends StatelessWidget {
  final String name;
  final double quantite;

  const MarchandiseItem({
    Key key,
    this.name,
    this.quantite,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      // onTap: () {
      //   Navigator.of(context).push(
      //     PageRouteBuilder(
      //       transitionDuration: Duration(milliseconds: 1500),
      //       pageBuilder: (BuildContext context, Animation<double> animation,
      //           Animation<double> secondaryAnimation) {
      //         return FoodDetailScreen(
      //           "Titre nourriture",
      //           1250,
      //           "superbe nourriture. Elle tire son origine dans les marmite afro",
      //           "chef Adou",
      //           "image",
      //         );
      //       },
      //       transitionsBuilder: (BuildContext context,
      //           Animation<double> animation,
      //           Animation<double> secondaryAnimation,
      //           Widget child) {
      //         return Align(
      //           child: FadeTransition(
      //             opacity: animation,
      //             child: child,
      //           ),
      //         );
      //       },
      //     ),
      //   );
      // },
      child: Card(
        elevation: 1.0,
        child: Container(
          // margin: EdgeInsets.only(left: 20, bottom: 5, right: 5),
          width: double.infinity,
          height: size.height * 0.15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(3),
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  // color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //       "https://www.ionlycameforthecake.com/wp-content/uploads/2019/12/Feeling-guilty-after-eating-featured-image-min.png"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nom de la marchandise",
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Quantité",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
