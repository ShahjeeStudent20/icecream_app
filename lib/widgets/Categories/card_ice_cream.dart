import 'package:final_project/model/category_items.dart';
import 'package:final_project/screens/cart_page.dart';
import 'package:final_project/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardIceCream extends StatelessWidget {
  const CardIceCream(
      {super.key,
      required this.home,
      required this.screenWidth,
      required this.myStyle1,
      required this.myStyle2,
      this.elevation = 1.0});

  final Home home;
  final double screenWidth;
  final TextStyle myStyle1;
  final TextStyle myStyle2;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Elevation is available globally [You can set elevation wherever you
      // will use the widget].
      elevation: elevation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Hero(
                transitionOnUserGestures: true,
                tag: 'iceImage',
                child: Image.asset(
                  home.image,
                  height: screenWidth * 0.35,
                  width: screenWidth * 0.40,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  home.title,
                  style: myStyle1,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      home.price,
                      style: myStyle2,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CartPage(
                              cartItems: DetailPage.cartItems,
                            ),
                          ),
                        );
                      },
                      child: const SizedBox(width: 10),
                    ),
                    RatingBar.builder(
                      initialRating: 5,
                      itemSize: 12,
                      minRating: 5,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber.shade600,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
