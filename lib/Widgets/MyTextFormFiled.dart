import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? errorMessage;
  final String? Function(String? value)? validator;
  final bool filled;
  final double borderRadius;
  final bool isObscure;
  final TextInputType? keyboardType;
  const MyTextFormField({
    super.key,
    this.keyboardType,
    required this.controller,
    this.hint,
    this.validator,
    this.errorMessage,
    this.isObscure = false,
    this.filled = true,
    this.borderRadius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: filled,
        hintText: hint,
        errorText: errorMessage,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(.27),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
      validator: validator,
    );
  }
}
