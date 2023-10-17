import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

bool isMobile() {
  return SizerUtil.deviceType == DeviceType.mobile;
}

bool isIos() {
  return Platform.isIOS;
}

Widget screenLayout(
    {required Widget mobileWidget, required Widget tabletWidget}) {
  if (isMobile()) {
    return mobileWidget;
  } else {
    return tabletWidget;
  }
}