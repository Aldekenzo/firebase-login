import 'package:authtest/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.validator,
    this.textInputType = TextInputType.text,
    this.formatter,

  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function(String) onChange;
  final int? maxLines;
  final bool alignLabelWithHint;
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final List<TextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white,
              width: 2
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.white,
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: alignLabelWithHint,
        hintStyle: TextStyle(
            color: AppColors.blackText.withOpacity(0.3),
            fontWeight: FontWeight.w400,
            fontSize: 14),
        labelStyle: TextStyle(
            color: AppColors.blackText.withOpacity(0.6),
            fontWeight: FontWeight.w500,
            fontSize: 14),
      ),
      cursorColor: AppColors.blackText.withOpacity(0.6),
      maxLines: maxLines,
      onChanged:(value) => onChange(value),
      controller: controller,
      style: TextStyle(
          color: AppColors.blackText.withOpacity(0.8),
          fontWeight: FontWeight.w500,
          fontSize: 16),
      validator: validator,
      keyboardType: textInputType,
        inputFormatters: formatter
    );
  }
}