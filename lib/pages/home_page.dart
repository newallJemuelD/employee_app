import 'package:employee_app/services/employee_pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import 'employee_details_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employeeData = ref.watch(employeePaginationControllerProvider);
    final pagination = ref.watch(employeePaginationControllerProvider.notifier);

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Employees',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                    const Spacer(),
                    const IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Builder(
                  builder: (context) {
                    if (employeeData.refreshError) {
                      return Text(employeeData.errorMessage!);
                    } else if (employeeData.employees!.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        },
                        itemCount: employeeData.employees!.length,
                        itemBuilder: (context, index) {
                          pagination.handleScrollWithIndex(index);
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeeDetailsPage(
                                  employeeData: employeeData.employees![index],
                                ),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              height: 100,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 146, 214, 223),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        employeeData.employees![index].image!),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        employeeData.employees![index].name!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text('ID  ' +
                                          employeeData.employees![index].id!),
                                      Text(employeeData
                                          .employees![index].country!),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.more_vert)
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: const Color(0xFF062132),
          onTap: null,
          currentIndex: 0,
          items: [
            FloatingNavbarItem(icon: Icons.home, title: 'Home'),
            FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
          ],
        ),
      ),
    );
  }
}
