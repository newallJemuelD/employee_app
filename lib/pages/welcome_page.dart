import 'package:flutter/material.dart';

import 'package:employee_app/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Container(
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage('assets/images/splash.png'),
              ),
            ),
          ),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Container(
                color: const Color(0xFF062132),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enterprise Employee Management System',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Keep your workforce active and manage them at any scale with a simple yet effective employee management system',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Color(0xFF4CBFB0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                            'Go to home page',
                            style: TextStyle(
                              color: Color(0xFF062132),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}
