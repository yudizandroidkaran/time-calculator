import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/theme/colors.dart';
import '../utils/widget_utils.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onClick;
  final bool? isEnabled;
  final String? disabledMessage;
  final double? height;
  final bool? showMargin;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? showIconOnly;
  final bool? isLoading;

  const CustomButton(
      {super.key,
      required this.onClick,
      required this.buttonText,
      this.isEnabled,
      this.disabledMessage,
      this.suffixIcon,
      this.showIconOnly,
      this.showMargin,
      this.height,
      this.prefixIcon,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return _renderTabletButton(context);
  }

  Widget _renderTabletButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnabled ?? true) {
          onClick();
        } else {
          if (disabledMessage != null) {}
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(vertical: 0.5.h),
        decoration: BoxDecoration(
            border: Border.all(width: 0.1.w, color: AppColor.textBlack),
            color: isEnabled ?? true
                ? Theme.of(context).primaryColor
                : AppColor.gray,
            borderRadius: BorderRadius.all(Radius.circular(0.7.w))),
        child: ButtonBar(alignment: MainAxisAlignment.center, children: [
          showIconOnly ?? false
              ? isLoading ?? false
                  ? SizedBox(
                      height: 3.w,
                      width: 3.w,
                      child: Transform.scale(
                        scale: 0.7,
                        child: CircularProgressIndicator(
                          strokeWidth: 0.4.w,
                          color: AppColor.white,
                        ),
                      ),
                    )
                  : suffixIcon!
              : Row(
                  children: [
                    prefixIcon != null ? prefixIcon! : Container(),
                    prefixIcon != null ? addWidth(2.w) : addWidth(0),
                    Text(
                      buttonText,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 3.sp,
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
        ]),
      ),
    );
  }
}
