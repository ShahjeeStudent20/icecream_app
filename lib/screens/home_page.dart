import 'package:final_project/screens/cartpage.dart';
import 'package:final_project/screens/detail_page.dart';
import 'package:final_project/widgets/AppBars,Drawers/Appbar.dart';
import 'package:final_project/widgets/AppBars,Drawers/DrawerWidget.dart';
import 'package:final_project/widgets/Categories/CategoriesWidget.dart';
import 'package:final_project/widgets/PopularItems/PopularWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        body: Center(
          child: ListView(
            children: [
              const AppbarWidget(),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height / 16,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.pink,
                          ), // Now the search field come
                          const SizedBox(width: 10),
                          Expanded(
                            // height: 50,
                            // width: 250,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "What would you like to have?",
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  // padding: EdgeInsets.only(top: 25),
                  decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.amber, Colors.orange]),
                  ),
                  child: Column(
                    children: [
                      //yaha search field ani ha
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: const Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      ),
                      const CategoriesWidget(),
                    ],
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 10,
                ),
                child: const Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const PopularWidget(),
              //SeaFood(),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 60,
          width: 70,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink.shade400,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CartPage(
                      cartItems: DetailPage.cartitems,
                    ),
                  ));
                },
                icon: const Icon(Icons.shopping_cart)),
          ),
        ),
      ),
    );
  }
}
