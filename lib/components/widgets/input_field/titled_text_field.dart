import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:time_calculator/gen/colors.gen.dart';

import '../../../resources/theme/colors.dart';
import '../utils/widget_utils.dart';

class TitledTextField extends StatefulWidget {
  final TextInputType? textInputType;
  final String hintText;
  final String title;
  final Widget? prefixIcon;
  final String? suffixIcon;
  final bool? obscureText;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;
  final String? validateParam;
  final TextInputAction? inputAction;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final Function? onClick;
  final Function(String)? onChanged;
  final Function()? onCompleted;
  final bool? enabled;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textInputFormatter;
  final bool? showTitle;
  final int? lines;
  final bool? autoFocus;

  const TitledTextField(
      {Key? key,
      this.textInputType,
      required this.title,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      required this.textEditingController,
      this.validator,
      this.validateParam,
      this.inputAction,
      this.maxLength,
      this.onClick,
      this.onChanged,
      this.onCompleted,
      this.enabled,
      this.focusNode,
      this.textInputFormatter,
      this.padding,
      this.showTitle,
      this.lines,
      this.autoFocus})
      : super(key: key);

  @override
  State<TitledTextField> createState() => _TitledTextFieldState();
}

class _TitledTextFieldState extends State<TitledTextField> {
  var _isPassword = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _isPassword = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return _renderTabletTextField(context);
  }

  Widget _renderTabletTextField(BuildContext context) {
    return Container(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.showTitle ?? true,
            child: Column(
              children: [
                Text(widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 2.7.sp, color: ColorName.textGray)),
                addHeight(0.5.h),
              ],
            ),
          ),
          addHeight(0.7.h),
          GestureDetector(
            onTap: () {
              if (widget.onClick != null) {
                widget.onClick!();
              }
            },
            child: TextFormField(
              key: widget.key,
              focusNode: _focusNode,
              onChanged: (text) {
                if (widget.onChanged != null) widget.onChanged!(text);
              },
              textInputAction: widget.inputAction ?? TextInputAction.next,
              keyboardType: widget.textInputType ?? TextInputType.text,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: _isPassword,
              maxLines: widget.lines ?? 1,
              minLines: widget.lines ?? 1,
              autovalidateMode: AutovalidateMode.disabled,
              controller: widget.textEditingController,
              maxLength: widget.maxLength ?? 100,
              obscuringCharacter: "*",
              enabled: widget.enabled ?? true,
              autofocus: widget.autoFocus ?? false,
              inputFormatters: widget.textInputFormatter,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 3.sp, color: AppColor.textBlack),
              decoration: InputDecoration(
                errorMaxLines: 3,
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 3.sp, color: Theme.of(context).hintColor),
                counterText: "",
                errorStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 5.5.sp, color: AppColor.red),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: widget.prefixIcon,
                contentPadding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
                fillColor: AppColor.white,
                filled: true,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.gray, width: 0.1.w),
                  borderRadius: BorderRadius.circular(0.7.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.textBlack, width: 0.1.w),
                  borderRadius: BorderRadius.circular(0.7.w),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor.gray.withOpacity(0.5), width: 0.1.w),
                  borderRadius: BorderRadius.circular(0.7.w),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.gray, width: 0.1.w),
                  borderRadius: BorderRadius.circular(0.7.w),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.gray, width: 0.1.w),
                  borderRadius: BorderRadius.circular(0.7.w),
                ),
              ),
              validator: widget.validator,
            ),
          ),
        ],
      ),
    );
  }
}
