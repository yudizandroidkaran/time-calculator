import 'package:get/get.dart';
import 'package:time_calculator/screens/splash/time_calculator_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    //Controllers
    Get.lazyPut(() => TimeCalculatorController(), fenix: true);
  }
}
