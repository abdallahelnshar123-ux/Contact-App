import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DataTextField extends StatelessWidget {
  String hintText;

  DataTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.goldColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.regular16LightBlue,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        enabledBorder: borderDecoration(),
        focusedBorder: borderDecoration(),
      ),
    );
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(width: 1, color: AppColors.goldColor),
    );
  }
}
