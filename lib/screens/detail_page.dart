import 'package:final_project/screens/cart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:final_project/model/category_items.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  final Home home;

  const DetailPage({super.key, required this.home});

  static List<Home> cartItems = [];

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    var myStyle1 = const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    var mystyle2 = const TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black);
    var mystyle3 = const TextStyle(fontSize: 16, color: Colors.black45);
    var mystyle4 = const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
    var descstyle1 = const TextStyle(
        fontSize: 20, color: Colors.black, fontFamily: "Trajan Pro");
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              widget.home.image,
              height: 370,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 1.0,
              minChildSize: 0.5,
              builder: (context, ScrollController) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      // color: Color(0xFF00A368),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: SingleChildScrollView(
                    controller: ScrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, bottom: 30, right: 15, left: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.home.title.toString(),
                                  textAlign: TextAlign.left,
                                  style: myStyle1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: const Row(children: [
                                    Icon(
                                      Icons.favorite_rounded,
                                      size: 33,
                                      color: Colors.amber,
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 30),
                          child: Row(
                            children: [
                              RatingBar.builder(
                                  initialRating: 5,
                                  itemSize: 20,
                                  minRating: 5,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                        CupertinoIcons.star_fill,
                                        color: Colors.red,
                                      ),
                                  onRatingUpdate: (rating) {}),
                              Text(
                                "4.9 (40)",
                                style: mystyle3,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 20),
                          child: Text(
                            widget.home.price.toString(),
                            style: mystyle4,
                          ),
                        ),
                        Divider(
                          thickness: 4,
                          color: Colors.blueGrey.shade100,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, bottom: 20, top: 20),
                              child: Text(
                                "Description",
                                style: mystyle2,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, bottom: 20, top: 20),
                          child: Text(
                            widget.home.desc.toString(),
                            style: descstyle1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.sizeOf(context).height / 10,
        decoration: BoxDecoration(
          color: Colors.amberAccent.shade400,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 100,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.remove),
                    ),
                    onTap: () {
                      setState(() {
                        if (_quantity > 1) {
                          _quantity--;
                        }
                      });
                    },
                  ),
                  Text(
                    "$_quantity",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.add),
                    ),
                    onTap: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  DetailPage.cartItems.add(widget.home);
                });
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartPage(
                    cartItems: DetailPage.cartItems,
                  ),
                ));
              },
              child: const Row(children: [
                Icon(
                  Icons.add_shopping_cart_sharp,
                  size: 26,
                ),
                Text("Add To cart",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
