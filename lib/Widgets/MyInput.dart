import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyInput extends StatefulWidget {
  final String? hint;
  final Color? hintColor;
  final String? onErrorMessage;
  final bool start;
  final String? label;
  final bool isPassword;
  final Color? fillColor;
  final bool hasBoarder;
  final bool readOnly;
  final Widget? prefix;
  bool isObscure;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final String? suffix;
  final Function()? onTap;
  final Function(String value)? onSubmit;
  final Function(dynamic value)? onChange;
  MyInput({
    super.key,
    this.prefix,
    this.onTap,
    this.readOnly = false,
    this.onSubmit,
    this.hintColor,
    this.hasBoarder = true,
    this.fillColor,
    this.label,
    this.isPassword = false,
    this.isObscure = false,
    this.onErrorMessage,
    this.controller,
    this.start = false,
    this.hint,
    this.keyboard,
    this.onChange,
    this.suffix,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: widget.onTap,
      onSubmitted: widget.onSubmit,
      controller: widget.controller,
      obscureText: widget.isObscure,
      obscuringCharacter: '*',
      decoration: _decoration,
      autofocus: widget.start,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboard,
      onChanged: widget.onChange,
    );
  }

  InputDecoration get _decoration => InputDecoration(
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,
        floatingLabelBehavior:
            widget.hint != null ? FloatingLabelBehavior.always : null,
        errorText: widget.onErrorMessage,
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix == '' && !widget.isPassword
            ? const SizedBox.shrink()
            : widget.isPassword
                ? IconButton(
                    onPressed: () => setState(() {
                      widget.isObscure = !widget.isObscure;
                    }),
                    icon: widget.isObscure
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  )
                : SvgPicture.asset(
                    'assets/images/${widget.suffix}.svg',
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                  ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: widget.hasBoarder
              ? BorderSide(
                  width: 1.w,
                  color: Theme.of(context).colorScheme.onSurface,
                )
              : BorderSide.none,
        ),
        isDense: true,
        label: Text(
          widget.label ?? '',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(fontSize: 18.sp),
      );
}
