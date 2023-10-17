import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/connectivity_helper.dart';

class TimeCalculatorController extends GetxController {
  final completedTimeController = TextEditingController();
  final completedTimeAtController = TextEditingController();
  var timeCompletesAt = "".obs;
  var pickedTime = "".obs;

  calculateTime() {
    var completedMinutes = (int.parse(completedTimeController.text.split(":")[0]) * 60) + int.parse(completedTimeController.text.split(":")[1]) ?? 0;

    if (completedMinutes < 0 || completedMinutes > 480) {
      timeCompletesAt.value = "Please go home ASAP, your time has already completed.";
      return;
    }
    var lastEntryMinutes = (int.parse(completedTimeAtController.text.split(":")[0]) * 60) + int.parse(completedTimeAtController.text.split(":")[1]) ?? 0;
    var remainingWorkMinutes = 480 - completedMinutes;
    var completionTime = lastEntryMinutes + remainingWorkMinutes;
    timeCompletesAt.value = "You can go home at ${durationToString(completionTime)}";
  }

  String durationToString(int minutes) {
    var d = Duration(minutes:minutes);
    List<String> parts = d.toString().split(':');
    if(int.parse(parts[0]) > 12){
      parts[0] = (int.parse(parts[0]) - 12).toString();
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')} PM';
    }
    else{
      return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')} AM';
    }
  }

  void addColon(){
    if (completedTimeController.text.isNotEmpty && !completedTimeController.text.contains(":")) {
      completedTimeController.text =
          completedTimeController.text.toString().replaceRange(2, 2, ":");
    }
    if (completedTimeAtController.text.isNotEmpty && !completedTimeAtController.text.contains(":")) {
      completedTimeAtController.text =
          completedTimeAtController.text.toString().replaceRange(2, 2, ":");
    }
  }
}
