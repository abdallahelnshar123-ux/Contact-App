import 'package:contact_app/home_screen/widget/bottom_sheet_widget.dart';
import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/app_styles.dart';
import 'package:contact_app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      /// route logo ==========================================================
      appBar: AppBar(
        title: Image.asset(AppAssets.routeLogo),
        titleSpacing: context.width * 0.065,
        toolbarHeight: context.height * 0.1,
      ),

      /// screen body =========================================================
      body: Container(
        padding: EdgeInsets.fromLTRB(
          context.width * 0.04,
          context.height * 0.11,
          context.width * 0.04,
          0,
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          /// animation & text ===============================================
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// animation ==================================================
              Lottie.asset(AppAssets.emptyListAnimation),

              /// text========================================================
              Text(
                'There is No Contacts Added Here',
                style: AppStyles.medium20Gold,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),

      /// bottom sheet button ==================================================
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomSheetWidget(),
            isScrollControlled: true,
          );
        },
        backgroundColor: AppColors.goldColor,
        child: Icon(Icons.add, color: AppColors.darkBlueColor, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
