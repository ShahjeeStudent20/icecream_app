import 'package:final_project/loginpages/loginpage.dart';
import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/myaccountdetail.dart';
import 'package:flutter/material.dart';

import '../Apiget/aboutuspage.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Colors.blueGrey.withOpacity(0.8)),
              accountName: const Text("Syed Ahmed Shah",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              accountEmail: const Text("syedahmedstudy18@gmail.com",
                  style: TextStyle(fontSize: 17)),
              margin: const EdgeInsets.only(bottom: 2),
              currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("images/profile1.jpg")),
            )),
        //Home
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          },
          leading: Icon(
            Icons.home,
            size: 35,
            color: Colors.amber.shade300,
          ),
          title: const Text(
            "Home",
            style: TextStyle(fontSize: 20),
          ),
        ),
        //About Us
        const SizedBox(
          height: 30,
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ));
          },
          leading: Icon(
            Icons.info_outline,
            size: 35,
            color: Colors.amber.shade300,
          ),
          title: const Text(
            "About Us",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //Acc details
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyAccount(),
                ));
          },
          leading: Icon(
            Icons.person,
            size: 35,
            color: Colors.amber.shade300,
          ),
          title: const Text(
            "My Account",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //Logout
        ListTile(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false,
            );
          },
          leading: Icon(
            Icons.logout,
            size: 35,
            color: Colors.amber.shade300,
          ),
          title: const Text(
            "Log Out",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
