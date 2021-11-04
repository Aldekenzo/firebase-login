import 'package:authtest/core/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.press,
    bool this.isActive = false,
  }) : super(key: key);

  final String text;
  final Function press;
  final isActive;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(160, 56),
            primary: !isActive ? Colors.white : AppColors.kGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))),
        onPressed: press as void Function()?,
        child: Text(
          text,
          style: TextStyle(
              letterSpacing: 0.5,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: !isActive
                  ? AppColors.blackText.withOpacity(0.3)
                  : Colors.white),
        ));
  }
}
