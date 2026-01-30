import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_styles.dart';
import '../../utils/screen_size.dart';

class EmptyUsersBody extends StatelessWidget {
  const EmptyUsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
