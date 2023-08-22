import 'package:final_project/screens/detail_page.dart';
import 'package:final_project/widgets/Categories/categoryitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  @override
  Widget build(BuildContext context) {
    // final List<IceCreamPopular> populars = [
    //   IceCreamPopular(
    //       title: "Matka Kulfi",
    //       image: "images/matka kulfi.jpg",
    //       price: "Rs 200"),
    //   IceCreamPopular(
    //       title: "Oreo Sandwich",
    //       image: "images/oreosandwich.jpg",
    //       price: "Rs 350"),
    //   IceCreamPopular(
    //       title: "Watermelon Ice Candy",
    //       image: "images/watermelon ice.jpg",
    //       price: "Rs 120"),
    //   IceCreamPopular(
    //       title: "Strawberry Cheesecake",
    //       image: "images/cheesecake1.jpg",
    //       price: "Rs 150"),
    //   IceCreamPopular(
    //       title: "Butterscotch Cone",
    //       image: "images/butterscotch cone4.jpg",
    //       price: "Rs 200"),
    // ];

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 2.5,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: homes.length > 17 ? 5 : homes.length,
            itemBuilder: (context, index) {
              Home home = homes[index + 17];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          home: home,
                        ),
                      ));
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 3,
                          blurRadius: 20,
                          offset: Offset(0, 7))
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          home.image,
                          fit: BoxFit.fitHeight,
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                home.title,
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 5),
                              RatingBar.builder(
                                  initialRating: 5,
                                  itemSize: 20,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  glowColor: Colors.amber,
                                  itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.red,
                                      ),
                                  onRatingUpdate: (rating) {}),
                              const SizedBox(height: 15),
                              Text(
                                home.price,
                                style: const TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
