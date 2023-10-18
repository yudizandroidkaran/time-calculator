import 'package:get/get.dart';

import '../screens/time_calculator/time_calculator_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    //Controllers
    Get.lazyPut(() => TimeCalculatorController(), fenix: true);
  }
}
