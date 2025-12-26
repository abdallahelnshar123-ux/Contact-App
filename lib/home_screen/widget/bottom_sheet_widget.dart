import 'dart:io';

import 'package:contact_app/home_screen/widget/data_text_field.dart';
import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_styles.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  XFile? image;
  final ImagePicker picker = ImagePicker();

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
                        image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {});
                      },
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: BoxBorder.all(
                              color: AppColors.goldColor,
                              width: 1,
                            ),
                          ),
                          decoration: BoxDecoration(
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
                              : Image.file(
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                ),
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
                        textPreviewBuilder('User Name'),
                        dividerBuilder(),
                        textPreviewBuilder('example@email.com'),
                        dividerBuilder(),
                        textPreviewBuilder('+200000000000'),
                      ],
                    ),
                  ),
                ],
              ),

              /// text fields ================================================
              Form(
                child: Column(
                  spacing: context.height * 0.015,
                  children: [
                    DataTextField(hintText: 'Enter User Name '),
                    DataTextField(hintText: 'Enter User Email '),
                    DataTextField(hintText: 'Enter User Phone '),
                  ],
                ),
              ),

              /// enter user button ===========================================
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: AppColors.goldColor,
                  padding: EdgeInsets.symmetric(vertical: 18),
                ),
                onPressed: () {},
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
}
