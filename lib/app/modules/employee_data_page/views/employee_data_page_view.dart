import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_data_page_controller.dart';

class EmployeeDataPageView extends GetView<EmployeeDataPageController> {
  const EmployeeDataPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeDataPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeeDataPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
