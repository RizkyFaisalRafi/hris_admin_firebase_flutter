import 'package:flutter/material.dart';
import 'package:hris_admin_firebase_flutter/models/employee_data.dart';

class EmployeeTile extends StatelessWidget {
  final EmployeeData employeeData;

  const EmployeeTile({super.key, required this.employeeData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const FlutterLogo(
          size: 60.0,
        ),
        title: Text(employeeData.name ?? 'Null'),
        subtitle: Text(employeeData.nip ?? 'Null'),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined,
            color: Colors.green),
      ),
    );
  }
}
