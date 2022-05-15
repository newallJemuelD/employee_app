import 'package:employee_app/services/employee_data_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:employee_app/models/employee_pagination.dart';
import 'employee_exception.dart';

final employeePaginationControllerProvider =
    StateNotifierProvider<EmployeePaginationController, dynamic>((ref) {
  final employeeDataService = ref.read(employeeDataServiceProvider);
  return EmployeePaginationController(employeeDataService);
});

class EmployeePaginationController extends StateNotifier<EmployeePagination> {
  EmployeePaginationController(
    this._employeeDataService, [
    EmployeePagination? state,
  ]) : super(state ?? EmployeePagination.initial()) {
    getEmployees();
  }

  final EmployeeDataService _employeeDataService;

  Future<void> getEmployees() async {
    try {
      final employees = await _employeeDataService.getEmployeeData(state.page!);

      state = state.copyWith(
          employees: [...state.employees!, ...employees],
          page: state.page! + 1);
    } on EmployeeException catch (e) {
      state = state.copyWith(errorMessage: e.message);
    }
  }

  void handleScrollWithIndex(int index) {
    final itemPosition = index + 1;
    final requestMoreData = itemPosition % 20 == 0 && itemPosition != 0;
    final pageToRequest = itemPosition ~/ 20;

    if (requestMoreData && pageToRequest + 1 >= state.page!) {
      getEmployees();
    }
  }
}
