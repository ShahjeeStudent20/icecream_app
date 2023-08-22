import 'dart:convert';
import 'package:flutter/material.dart';
import 'aboutmodel.dart';
import 'package:http/http.dart' as http;

//Api calling page where image and text is calling from api and get into screen
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<About> fetchAboutPageData() async {
    final response = await http.get(Uri.parse(Uri.encodeFull(
        "https://hayat.hayatpc190.workers.dev/0:/shahjee.json")));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return About.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<About>(
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
              Text(aboutPage.logoText!),
            ],
          );
        } else {
          return const Text('No data available');
        }
      },
    );
  }
}
