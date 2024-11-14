import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputSearchWidget extends StatelessWidget {
  const InputSearchWidget({super.key, this.onChanged, this.hintText, this.prefixIcon, this.controller});
  final Function(String)? onChanged;
  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey.shade200,
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
