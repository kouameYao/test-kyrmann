import 'package:flutter/material.dart';

class MarchandiseItem extends StatelessWidget {
  final String name;
  final String quantite;

  const MarchandiseItem({
    this.name,
    this.quantite,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // Go to detailScreen
      },
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
                      name,
                    ),
                    SizedBox(height: 5),
                    Text(
                      quantite.toString(),
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
