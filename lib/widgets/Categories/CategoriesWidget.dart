// ignore_for_file: file_names

import 'package:final_project/widgets/Categories/specialcategory.dart';
import 'package:final_project/widgets/Categories/sundaecategory.dart';

import 'conecateogry.dart';
import 'package:flutter/material.dart';

import 'icecandycategory.dart';
import 'magnumcategory.dart';

class IceCreamCategory {
  final String name;
  final String image;

  IceCreamCategory({required this.image, required this.name});
}

//Model is given on above then the list and whole code fot this category widget
class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    final List<IceCreamCategory> categories = [
      IceCreamCategory(name: "Cones", image: "images/cone5.jpg"),
      IceCreamCategory(name: "Magnums", image: "images/magnum1.png"),
      IceCreamCategory(name: "Ice Candy", image: "images/icered.png"),
      IceCreamCategory(name: "Sundaes", image: "images/sundae3.png"),
      IceCreamCategory(name: "Specials", image: "images/special4.png"),
    ];

    return Column(
      children: [
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              IceCreamCategory category = categories[index];
              return GestureDetector(
                onTap: () {
                  if (category.name == "Cones") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ConesPage()),
                    );
                  } else if (category.name == "Magnums") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MagnumPage()),
                    );
                  } else if (category.name == "Ice Candy") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IceCandyPage()),
                    );
                  } else if (category.name == "Sundaes") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SundaePage()),
                    );
                  } else if (category.name == "Specials") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SpecialPage()),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    // height: 20,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          category.image,
                          fit: BoxFit.contain,
                          width: 100,
                          height: 60,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        //  SingleChildScrollView(
        //    child: PopularCatogery(
        //      homes: homes,
        //    ),
        //  ),
      ],
    );
  }
}
