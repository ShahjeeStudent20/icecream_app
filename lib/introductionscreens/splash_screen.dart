import 'package:final_project/introductionscreens/onboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const FirstOnboard()));
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(0.7),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/logo2.png',
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Text(
            "Unleash Your Inner Child with Every Scoop",
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.10),
          const Flexible(
            flex: 1,
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
