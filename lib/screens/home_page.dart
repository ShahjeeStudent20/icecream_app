import 'package:final_project/screens/cartpage.dart';
import 'package:final_project/screens/detail_page.dart';
import 'package:final_project/widgets/AppBars,Drawers/Appbar.dart';
import 'package:final_project/widgets/AppBars,Drawers/DrawerWidget.dart';
import 'package:final_project/widgets/Categories/CategoriesWidget.dart';
import 'package:final_project/widgets/PopularItems/PopularWidget.dart';
import 'package:flutter/cupertino.dart';
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
        body: ListView(
          children: [
            const AppbarWidget(),
            // Search bar
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Container(
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.search,
                            color: CupertinoColors.systemPink,
                          ), // Now the search field come
                          const SizedBox(width: 10),
                          Expanded(
                            // height: 50,
                            // width: 250,
                            child: TextFormField(
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                hintText: "What would you like to have?",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Top categories of products.
            // Horizontal scrolling list.
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Material(
                elevation: 4.0,
                child: Container(
                  // padding: EdgeInsets.only(top: 25),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      CupertinoColors.systemPink,
                      Colors.pinkAccent
                    ]),
                  ),
                  child: Column(
                    children: [
                      //yaha search field ani ha
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 16,
                          ),
                          child: const Text(
                            'Categories',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                letterSpacing: 1.2,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                //color: Color(0xFF4C53A5),
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const Divider(color: Colors.white30),
                      const CategoriesWidget(),
                      const SizedBox(height: 10.0)
                    ],
                  ),
                ),
              ),
            ),
            // Popular product list title.
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: const Text(
                'Popular',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    letterSpacing: 1.2,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    //color: Color(0xFF4C53A5),
                    color: CupertinoColors.systemPink),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Popular product's list.
            const PopularWidget(),
            //SeaFood(),
          ],
        ),
        // Cart button.
        floatingActionButton: SizedBox(
          height: 60,
          width: 70,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: CupertinoColors.systemPink,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartPage(
                    cartItems: DetailPage.cartitems,
                  ),
                ));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
