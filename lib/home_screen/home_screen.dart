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
      appBar: AppBar(
        title: Image.asset(AppAssets.routeLogo),
        titleSpacing: context.width * 0.065,
        toolbarHeight: context.height * 0.1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.goldColor,
        child: Icon(Icons.add, color: AppColors.darkBlueColor, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
        padding: EdgeInsets.fromLTRB(
          context.width * 0.04,
          context.height * 0.11,
          context.width * 0.04,
          0,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset(AppAssets.emptyListAnimation),
            Text(
              'There is No Contacts Added Here',
              style: AppStyles.medium20Gold,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
