import 'package:flutter/material.dart';
import 'package:koshariapp/animations/fade_animations.dart';
import 'package:koshariapp/utils/constants.dart';

import '../../theme/custom_app_theme.dart';
import 'components/user_appbar.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const UserViewAppBar(),
        body: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
            child: Column(
              children: [
                topUserInfo(width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topUserInfo(double width) {
    return FadeAnimation(
      delay: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/28817140?v=4"),
          ),
          SizedBox(
            width: width * 0.03,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed Ramadan',
                style: AppTheme.profileDevName,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'software Engineer',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(
            width: width * 0.03,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }
}
