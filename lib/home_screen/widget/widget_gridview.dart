import 'package:contact_app/home_screen/widget/user_card_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../models/user.dart';
import '../../utils/screen_size.dart';

class WidgetGridview extends StatelessWidget {
  int itemCount;

  // Function onDeletePressed;
  List<User> users;

  WidgetGridview({
    super.key,
    required this.itemCount,
    required this.users,
    // required this.onDeletePressed
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1.8,
        crossAxisCount: 2,
        crossAxisSpacing: context.width * 0.04,
        mainAxisSpacing: context.width * 0.04,
      ),
      itemBuilder: (context, index) => UserCardWidget(
        image: users[index].userImage,
        email: users[index].email,
        name: users[index].userName,
        phone: users[index].phone,
        // onDeletePressed:onDeletePressed(index),
      ),
      itemCount: itemCount,
    );
  }
}
