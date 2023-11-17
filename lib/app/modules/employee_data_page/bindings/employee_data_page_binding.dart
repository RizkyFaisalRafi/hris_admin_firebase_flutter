import 'package:get/get.dart';

import '../controllers/employee_data_page_controller.dart';

class EmployeeDataPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeDataPageController>(
      () => EmployeeDataPageController(),
    );
  }
}
