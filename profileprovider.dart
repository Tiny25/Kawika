import 'package:flutter/material.dart';

class EmployeeProvider with ChangeNotifier {
  List<Employee> employeeList = [];

  Future<Employee> getProile() async {
    Employee employeeDetailsData = Employee();
    try {
      final response = await _provider.get("");
      final extractedData = response as dynamic;

      if (extractedData != null) {
        employeeDetailsData = Employee(
          id: extractedData['id'],
          employeeName: extractedData['employeeName'],
          employeId: extractedData['employeId'],
          managerName: extractedData['managerName'],
          address: extractedData['address'],
          mobileNumber: extractedData['mobileNumber'],
          email: extractedData['email'],
        );
      } else {}
      // ignore: empty_catches
    } catch (error) {}
    return employeeDetailsData;
  }
}
