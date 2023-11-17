import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/employee_data_detail_page_controller.dart';

class EmployeeDataDetailPageView
    extends GetView<EmployeeDataDetailPageController> {
  const EmployeeDataDetailPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeeDataDetailPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeeDataDetailPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
