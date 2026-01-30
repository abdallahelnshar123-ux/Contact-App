import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/app_styles.dart';
import 'package:contact_app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserCardWidget extends StatelessWidget {
  String image;
  String name;
  String phone;
  String email;

  // Function onDeletePressed;

  UserCardWidget({
    super.key,
    required this.image,
    required this.phone,
    required this.email,
    required this.name,
    // required this.onDeletePressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.goldColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //spacing: context.height * 0.005,
        children: [
          /// image & name ====================================================
          AspectRatio(
            aspectRatio: 1 / 1,

            /// image =========================================================
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(8),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),

              /// name =======================================================
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.goldColor,
                ),
                child: Text(name, style: AppStyles.medium14DarkBlue),
              ),
            ),
          ),

          /// email & phone & button ==========================================
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(context.width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //spacing: context.height * 0.01,
                children: [
                  /// email =====================================================
                  textDataBuilder(context, AppAssets.mailIcon, email),

                  /// phone =====================================================
                  textDataBuilder(context, AppAssets.phoneIcon, phone),
                  Spacer(),

                  /// delete button ============================================
                  ElevatedButton(
                    onPressed: () {
                      // onDeletePressed();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: AppColors.redColor,
                      padding: EdgeInsets.symmetric(vertical: 9),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: context.width * 0.02,
                      children: [
                        SvgPicture.asset(
                          AppAssets.trashIcon,
                          width: 12,
                          colorFilter: ColorFilter.mode(
                            AppColors.whiteColor,
                            BlendMode.srcIn,
                          ),
                        ),

                        Text('Delete', style: AppStyles.medium10White),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textDataBuilder(BuildContext context, String icon, String data) {
    return Row(
      spacing: context.width * 0.02,
      children: [
        SvgPicture.asset(
          icon,
          width: 20,
          colorFilter: ColorFilter.mode(
            AppColors.darkBlueColor,
            BlendMode.srcIn,
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(data),
          ),
        ),
      ],
    );
  }
}
