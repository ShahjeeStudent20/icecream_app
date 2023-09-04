import 'package:final_project/screens/home_page.dart';
import 'package:final_project/screens/loginPages/login_page.dart';
import 'package:final_project/screens/my_account_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Apiget/about_us_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: CupertinoColors.systemPink),
                accountName: Text("Syed Ahmed Shah",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                accountEmail: Text("syedahmedstudy18@gmail.com",
                    style: TextStyle(fontSize: 17)),
                margin: EdgeInsets.only(bottom: 2),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("images/profile1.jpg"),
                ),
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
            leading: const Icon(
              Icons.home,
              size: 30,
              color: CupertinoColors.systemPink,
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: CupertinoColors.systemPink),
            ),
          ),
          //About Us
          // Note: I'm commenting all the SizedBox here because they are
          // redundant.
          // ListTile widget comes with padding itself, Hence no need to add
          // extra space. Instead just for aesthetic you can add a Divider as
          // shown below.
          // const SizedBox(
          //   height: 30,
          // ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ));
            },
            leading: const Icon(
              Icons.info_outline,
              size: 30,
              color: CupertinoColors.systemPink,
            ),
            title: const Text(
              "About Us",
              style: TextStyle(
                  fontSize: 18,
                  color: CupertinoColors.systemPink,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          const Divider(),
          //Acc details
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyAccount(),
                  ));
            },
            leading: const Icon(
              Icons.person,
              size: 30,
              color: CupertinoColors.systemPink,
            ),
            title: const Text(
              "My Account",
              style: TextStyle(
                  fontSize: 18,
                  color: CupertinoColors.systemPink,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          const Divider(),
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
            leading: const Icon(Icons.logout,
                size: 30, color: CupertinoColors.systemPink),
            title: const Text(
              "Log Out",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.systemPink),
            ),
          ),
        ],
      ),
    );
  }
}
