import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:time_calculator/components/widgets/button/custom_button.dart';
import 'package:time_calculator/components/widgets/input_field/titled_text_field.dart';
import 'package:time_calculator/components/widgets/utils/widget_utils.dart';
import 'package:time_calculator/gen/colors.gen.dart';
import 'package:time_calculator/resources/lang/strings.dart';
import 'package:time_calculator/screens/splash/time_calculator_controller.dart';

import '../../gen/assets.gen.dart';

class TimeCalculator extends StatelessWidget {
  TimeCalculator({super.key});

  final _timeCalculatorController = Get.find<TimeCalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 1.5.w, horizontal: 1.5.w),
            decoration: BoxDecoration(
                color: ColorName.white,
                border: Border.all(width: 0.2.w, color: ColorName.textBlack),
                borderRadius: BorderRadius.all(Radius.circular(0.9.w))),
            child: Row(
              children: [
                Assets.icons.icTime.svg(height: 14.w).expand,
                Container(
                    width: 0.2.w,
                    margin: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(4.w)))),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppStrings.timeCalculator,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: ColorName.red)),
                      addHeight(2.h),
                      Text(
                          AppStrings.justProvide,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 3.sp)),
                      addHeight(7.h),
                      Column(
                        children: [
                          TitledTextField(
                            title: AppStrings.completedTime,
                            hintText: AppStrings.hhMM,
                            autoFocus: true,
                            textInputType: TextInputType.number,
                            textInputFormatter: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 4,
                            textEditingController: _timeCalculatorController
                                .completedTimeController,
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                          ),
                          addHeight(4.h),
                          TitledTextField(
                            title: AppStrings.completedTimeAt,
                            hintText: AppStrings.hhMM,
                            textEditingController: _timeCalculatorController
                                .completedTimeAtController,
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            enabled: false,
                            onClick: () async {
                              var time = await showTimePicker(
                                  helpText: AppStrings.completedTimeAt,
                                  cancelText: AppStrings.cancel,
                                  confirmText: AppStrings.select,
                                  context: context,
                                  initialTime: TimeOfDay.now());
                              _timeCalculatorController.pickedTime.value =
                                  "${time!.hour.toString()}${time.minute.toString()}";
                              _timeCalculatorController
                                      .completedTimeAtController.text =
                                  _timeCalculatorController.pickedTime.value;
                            },
                          ),
                          addHeight(7.h),
                          CustomButton(
                              onClick: () {
                                _timeCalculatorController.addColon();
                                _timeCalculatorController.calculateTime();
                              },
                              buttonText: AppStrings.calculate),
                          Visibility(
                            visible: _timeCalculatorController
                                .timeCompletesAt.isNotEmpty,
                            child: Column(
                              children: [
                                addHeight(4.h),
                                Text(
                                    _timeCalculatorController
                                        .timeCompletesAt.value,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: ColorName.red,
                                            fontSize: 4.sp))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ).expand,
              ],
            )),
      ),
    );
  }
}
