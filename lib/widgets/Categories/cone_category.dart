import 'package:final_project/screens/detail_page.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/widgets/Categories/card_ice_cream.dart';
import 'package:flutter/material.dart';

import '../../model/category_items.dart';

class ConesPage extends StatelessWidget {
  const ConesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myStyle1 = TextStyle(
      color: Colors.green.shade400,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
    var myStyle2 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.teal.shade700,
    );
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 35),
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
            "Cones",
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal.shade200,
                  Colors.green
                ], // Add your desired gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          clipBehavior: Clip.none,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600 ? 3 : 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: screenWidth > 600 ? 0.7 : 0.8,
          ),
          itemCount: homes.length > 5 ? 5 : homes.length,
          itemBuilder: (context, index) {
            Home home = homes[index];
            return InkWell(
              onTap: () {
                //yaha se routing krwa kr mein detailpage me jarha hu simple
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                    home: home,
                  ),
                ));
              },
              child: CardIceCream(
                home: home,
                screenWidth: screenWidth,
                myStyle1: myStyle1,
                myStyle2: myStyle2,
              ),
            );
          },
        ),
      ),
    );
  }
}
