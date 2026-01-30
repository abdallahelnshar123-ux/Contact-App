import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

typedef OnChanged = void Function(String);

class DataTextField extends StatelessWidget {
  OnChanged onChanged;
  final String hintText;
  String? Function(String?) validator;

  TextEditingController controller = TextEditingController();

  DataTextField({super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    required this.validator});


  ///

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: AppStyles.medium16Gold.copyWith(

        decoration: TextDecoration.none,
      ),
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppColors.goldColor,
      decoration: InputDecoration(


        hintText: hintText,
        hintStyle: AppStyles.regular16LightBlue,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        enabledBorder: borderDecoration(),
        focusedBorder: borderDecoration(),

        errorBorder: borderDecoration().copyWith(
            borderSide: BorderSide(
                color: AppColors.redColor
            )
        ),
        focusedErrorBorder: borderDecoration().copyWith(
            borderSide: BorderSide(
                color: AppColors.redColor
            )
        ),
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
