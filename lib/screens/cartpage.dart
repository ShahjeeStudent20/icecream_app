import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/orderconfirm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Categories/categoryitems.dart';

class CartPage extends StatefulWidget {
  final List<Home> cartItems;
  const CartPage({
    super.key,
    required this.cartItems,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List<int> _quantities = List<int>.empty(growable: true);

  bool isLoading = false;
  final bool _isBottomSheetVisible = false;

  bool _orderConfirmed = false;
  void _submitOrder() {
    setState(() {
      _orderConfirmed = true;
    });
  }

  String getConfirmButtonText() {
    if (_orderConfirmed) {
      return "Order is on the way";
    } else {
      return "Confirm Order";
    }
  }

  void _calculateTotal() {
    for (int i = 0; i < widget.cartItems.length; i++) {}
  }

  //remove items function declare
  void _removeItems(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
      _calculateTotal();
    });
  }

//Initializing qty list with values
  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //Navbar
        bottomNavigationBar: Container(
          height: 80,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.orange, Colors.yellow])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 220,
                child: OutlinedButton(
                  onPressed: _orderConfirmed
                      ? null // Disable button if order is already confirmed
                      : () {
                          _submitOrder();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderConfirmationPage(),
                            ),
                          );
                        },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          _orderConfirmed ? Colors.green : Colors.deepOrange)),
                  child: Text(
                    getConfirmButtonText(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepOrange.shade200,
                  Colors.amber,
                ], // Add your desired gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Cart Items"),
        ),
        body: ListView.builder(
          itemCount: widget.cartItems.length,
          itemBuilder: (context, index) {
            Home item = widget.cartItems[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  child: const Icon(CupertinoIcons.xmark_rectangle),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: const EdgeInsets.all(10),
                          title: const Text('Remove Item(s)'),
                          content: const Text('Are you sure you want to remove '
                              'this item from the cart?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _removeItems(index);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      height: 100,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(item.image),
                            radius: 40,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            item.title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text('${item.price}'),
                  ],
                ),
                const Divider(
                  thickness: 3,
                  color: Colors.grey,
                ),
              ],
            );
          },
        ),
        bottomSheet: _isBottomSheetVisible
            ? Container(
                height: 100,
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.only(top: 20),
                color: Colors.amber.withOpacity(0.4),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}
