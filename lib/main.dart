import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:employee_app/employee_app.dart';

void main() {
  runApp(const ProviderScope(child: EmployeeApp()));
}
