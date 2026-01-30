import 'package:contact_app/home_screen/widget/bottom_sheet_widget.dart';
import 'package:contact_app/home_screen/widget/empty_users_body.dart';
import 'package:contact_app/home_screen/widget/widget_gridview.dart';
import 'package:contact_app/models/user.dart';
import 'package:contact_app/utils/app_assets.dart';
import 'package:contact_app/utils/app_colors.dart';
import 'package:contact_app/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];

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
      body: usersList.isEmpty
          ? EmptyUsersBody()
          : WidgetGridview(
              itemCount: usersList.length,
              users: usersList,
              // onDeletePressed: (int index) {
              //   usersList.removeAt(index);
              //   setState(() {});
              // },
            ),

      /// bottom sheet button ==================================================
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 8,
        children: [
          /// delete button =================================================
          Visibility(
            visible: usersList.isNotEmpty,
            child: builtFloatingActionButton(
              context,
              () {
                usersList.removeLast();
                setState(() {});
              },
              AppColors.redColor,
              SvgPicture.asset(
                AppAssets.trashIcon,
                colorFilter: ColorFilter.mode(
                  AppColors.whiteColor,
                  BlendMode.srcIn,
                ),
                width: 18,
              ),
              AppColors.darkBlueColor,
            ),
          ),

          Visibility(
            visible: usersList.length != 6,
            child: builtFloatingActionButton(
              context,
              () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => BottomSheetWidget(
                    usersList: usersList,
                    onUserAdd: () {
                      setState(() {});
                    },
                  ),
                  isScrollControlled: true,
                );
              },
              AppColors.goldColor,
              Icon(Icons.add, color: AppColors.darkBlueColor, size: 35),
              AppColors.darkBlueColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget builtFloatingActionButton(
    BuildContext context,
    VoidCallback onPressed,
    Color backGroundColor,
    Widget icon,
    Color iconColor,
  ) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backGroundColor,
      child: icon,
    );
  }
}
