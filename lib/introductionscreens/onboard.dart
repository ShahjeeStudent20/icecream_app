import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:final_project/loginpages/loginpage.dart';

class FirstOnboard extends StatefulWidget {
  const FirstOnboard({Key? key}) : super(key: key);

  @override
  State<FirstOnboard> createState() => _FirstOnboardState();
}

class _FirstOnboardState extends State<FirstOnboard> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final TextStyle textStyle = const TextStyle(
    fontSize: 27,
  );
  final TextStyle textStyle2 = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 18,
  );

  void navigateNext() {
    if (currentPage < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 100),
        curve: Curves.bounceOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFC100),
              Color(0xFFFAF100),
            ],
          ),
        ),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            buildPage(
              "images/Lottie1.json",
              "Welcome to Shahjee Frozen Delights. Get ready for a treat that will melt your heart.",
            ),
            buildPage(
              "images/Lottie2.json",
              "Our fast and reliable delivery brings the ice cream parlor to your doorstep.",
            ),
            buildPage(
              "images/Lottie4.json",
              "It's time to dive into a world of frozen bliss. Join us now and let the ice cream magic begin!",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String lottieAsset, String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Lottie.asset(lottieAsset),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 33,
              right: 33,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.yellow.shade500,
                borderRadius: BorderRadius.circular(30),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black38.withOpacity(0.04),
                //     spreadRadius: 10,
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Text(
                      text,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                  ),
                  //const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (currentPage != 0)
                        ElevatedButton(
                          onPressed: () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.bounceInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: const Size(100, 40),
                          ),
                          child: Text(
                            'Previous',
                            style: textStyle2,
                          ),
                        ),
                      ElevatedButton(
                        onPressed: navigateNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(100, 40),
                        ),
                        child: Text(
                          currentPage < 2 ? "Next" : "Get Started",
                          style: textStyle2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
