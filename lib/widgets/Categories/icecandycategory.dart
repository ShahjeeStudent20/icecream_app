import 'package:final_project/screens/cartpage.dart';
import 'package:final_project/screens/detail_page.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'categoryitems.dart';

class IceCandyPage extends StatelessWidget {
  const IceCandyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var mystyle1 = const TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
    var mystyle2 = TextStyle(
        fontSize: 17, fontWeight: FontWeight.bold, color: Colors.teal.shade700);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ), // Back arrow icon
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,
              );
            },
          ),
          title: const Text(
            "Ice Candy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.pink.shade400,
                  Colors.yellow,
                ], // Add your desired gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 35, right: 10, left: 10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600 ? 3 : 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: screenWidth > 600 ? 0.7 : 0.8,
          ),
          itemCount: homes.length > 7 ? 3 : homes.length,
          itemBuilder: (context, index) {
            Home home = homes[index + 7];
            return InkWell(
              onTap: () {
                //yaha se routing krwa kr mein detailpage me jarha hu simple
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                    home: home,
                  ),
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      spreadRadius: 2,
                      blurRadius: 25,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          home.image,
                          height: screenWidth * 0.35,
                          width: screenWidth * 0.40,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            home.title,
                            style: mystyle1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            home.price,
                            style: mystyle2,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CartPage(
                                  cartItems: DetailPage.cartitems,
                                ),
                              ));
                            },
                            child: const SizedBox(width: 10),
                          ),
                          RatingBar.builder(
                              initialRating: 5,
                              itemSize: 12,
                              minRating: 5,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.red,
                                  ),
                              onRatingUpdate: (rating) {}),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
