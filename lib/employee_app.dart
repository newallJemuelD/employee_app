import 'package:flutter/material.dart';

import 'package:employee_app/pages/splash_page.dart';

class EmployeeApp extends StatelessWidget {
  const EmployeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}
