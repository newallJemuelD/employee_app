// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:employee_app/models/employee_data.dart';

class EmployeePagination {
  final List<EmployeeData>? employees;
  final int? page;
  final String? errorMessage;
  EmployeePagination({
    this.employees,
    this.page,
    this.errorMessage,
  });

  EmployeePagination.initial()
      : employees = [],
        page = 1,
        errorMessage = '';

  bool get refreshError => errorMessage != '' && employees!.length <= 20;

  EmployeePagination copyWith({
    List<EmployeeData>? employees,
    int? page,
    String? errorMessage,
  }) {
    return EmployeePagination(
      employees: employees ?? this.employees,
      page: page ?? this.page,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'employees': employees?.map((x) => x.toMap()).toList(),
      'page': page,
      'errorMessage': errorMessage,
    };
  }

  factory EmployeePagination.fromMap(Map<String, dynamic> map) {
    return EmployeePagination(
      employees: map['employees'] != null
          ? List<EmployeeData>.from(
              (map['employees'] as List<int>).map<EmployeeData?>(
                (x) => EmployeeData.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      page: map['page'] != null ? map['page'] as int : null,
      errorMessage:
          map['errorMessage'] != null ? map['errorMessage'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeePagination.fromJson(String source) =>
      EmployeePagination.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'EmployeePagination(employees: $employees, page: $page, errorMessage: $errorMessage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EmployeePagination &&
        listEquals(other.employees, employees) &&
        other.page == page &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode =>
      employees.hashCode ^ page.hashCode ^ errorMessage.hashCode;
}
