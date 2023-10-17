import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'package:time_calculator/resources/theme/themes.dart';
import 'package:time_calculator/screens/splash/time_calculator.dart';
import 'package:time_calculator/utils/bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Time Calculator',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: TimeCalculator(),
      );
    });
  }
}
