import 'package:get/get.dart';

import '../controllers/employee_data_detail_page_controller.dart';

class EmployeeDataDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeDataDetailPageController>(
      () => EmployeeDataDetailPageController(),
    );
  }
}
