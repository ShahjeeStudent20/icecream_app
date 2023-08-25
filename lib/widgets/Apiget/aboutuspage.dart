import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'aboutmodel.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<About> fetchAboutPageData() async {
    const uri = 'https://hayat.hayatpc190.workers.dev/0:/shahjee.json';
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200 || response.statusCode == 201) {
      log('sucess');
      final data = jsonDecode(response.body);
      return About.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchAboutPageData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Colors.amber,
            ); // Loading indicator while fetching data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final aboutPage = snapshot.data!;
            return Column(
              children: [
                Image.network(aboutPage.logo!),
                SizedBox(height: 20),
                Text(aboutPage.logoText!,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ],
            );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
