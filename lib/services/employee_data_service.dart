import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:employee_app/models/employee_data.dart';
import 'package:employee_app/services/employee_exception.dart';

final employeeDataServiceProvider = Provider<EmployeeDataService>((ref) {
  return EmployeeDataService();
});

class EmployeeDataService {
  // final Dio? _dio;

  // EmployeeDataService(this._dio);

  Future<List<EmployeeData>> getEmployeeData([int page = 1]) async {
    final response = await http.get(Uri.parse(
        'https://620dfdda20ac3a4eedcf5a52.mockapi.io/api/employee?page=$page&limit=20'));

    // final results =
    //     List<Map<String, dynamic>>.from(response?.data['results']);
    // List<EmployeeData> employees = results
    //     .map((employeeData) => EmployeeData.fromMap(employeeData))
    //     .toList(growable: false);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List<EmployeeData> employees = [];

      data.forEach((e) {
        employees.add(EmployeeData.fromJson(e));
      });
      return employees;
    } else {
      throw Exception('failed to load');

      print('----------------------------failed to load');
    }
  }
}
