import 'dart:io';

import 'package:contact_app/home_screen/widget/data_text_field.dart';
import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/image_picker.dart';
import 'package:contact_app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../models/user.dart';
import '../../utils/app_styles.dart';
import '../../utils/validation.dart';

class BottomSheetWidget extends StatefulWidget {
  List<User> usersList;
  VoidCallback onUserAdd;

  BottomSheetWidget({
    super.key,
    required this.usersList,
    required this.onUserAdd,
  });

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  GlobalKey<FormState> formKey1 = GlobalKey();

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      showDragHandle: false,
      backgroundColor: AppColors.darkBlueColor,
      onClosing: () {},
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(
            context.width * 0.05,
            context.height * 0.02,
            context.width * 0.05,
            MediaQuery.of(context).viewInsets.bottom + context.height * 0.02,
          ),

          /// main column ====================================================
          child: Column(
            spacing: context.height * 0.018,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// image & preview text ========================================
              Row(
                spacing: context.width * 0.02,
                children: [
                  /// image ===================================================
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async {
                        File? tempImage = await ImagePickerUtils.gallryPicker();
                        if (tempImage != null) image = tempImage;
                        setState(() {});
                      },
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: BoxBorder.all(
                              color: AppColors.goldColor,
                              width: 1,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: BoxBorder.all(
                              color: AppColors.goldColor,
                              width: 1,
                            ),
                          ),

                          child: image == null
                              ? Lottie.asset(
                                  AppAssets.imagePickerAnimation,
                                  width: 100,
                                )
                              : Image.file(image!, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),

                  /// preview text============================================
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: userNameController,
                          builder: (context, value, child) =>
                              textPreviewBuilder(
                                userNameController.text.isEmpty
                                    ? 'User name'
                                    : userNameController.text,
                              ),
                        ),
                        dividerBuilder(),
                        ValueListenableBuilder(
                          valueListenable: emailController,
                          builder: (context, value, child) =>
                              textPreviewBuilder(
                                emailController.text.isEmpty
                                    ? 'example@email.com'
                                    : emailController.text,
                              ),
                        ),
                        dividerBuilder(),
                        ValueListenableBuilder(
                          valueListenable: phoneController,
                          builder: (context, value, child) =>
                              textPreviewBuilder(
                                phoneController.text.isEmpty
                                    ? '+200000000000'
                                    : phoneController.text,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// text fields ================================================
              Form(
                key: formKey1,
                child: Column(
                  spacing: context.height * 0.015,
                  children: [
                    DataTextField(
                      hintText: 'Enter User Name ',
                      controller: userNameController,
                      onChanged: (_) {},
                      validator: (value) {
                        return Validation.isEmptyFieldValidator(
                          value,
                          'This Field is required',
                        );
                      },
                    ),
                    DataTextField(
                      hintText: 'Enter User Email ',
                      controller: emailController,
                      onChanged: (_) {},
                      validator: (value) {
                        return Validation.emailValidator(value);
                      },
                    ),
                    DataTextField(
                      hintText: 'Enter User Phone ',
                      controller: phoneController,
                      onChanged: (_) {},
                      validator: (value) {
                        return Validation.isEmptyFieldValidator(
                          value,
                          'This Field is Required',
                        );
                      },
                    ),
                  ],
                ),
              ),

              /// add user button ===========================================
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: AppColors.goldColor,
                  padding: EdgeInsets.symmetric(vertical: 13),
                ),
                onPressed: addUser,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Enter user', style: AppStyles.regular20DarkBlue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textPreviewBuilder(String text) {
    return Text(text, style: AppStyles.medium16Gold.copyWith(height: 1.8));
  }

  Widget dividerBuilder() {
    return Divider(
      color: AppColors.goldColor,
      thickness: 1,
      radius: BorderRadius.circular(2),
    );
  }

  void addUser() {
    if (formKey1.currentState!.validate()) {
      widget.usersList.add(
        User(
          userName: userNameController.value.text,
          email: emailController.value.text,
          phone: phoneController.value.text,
          userImage: image?.path ?? 'assets/images/test.jpg',
        ),
      );
      widget.onUserAdd();
      Navigator.pop(context);
    }
  }
}
