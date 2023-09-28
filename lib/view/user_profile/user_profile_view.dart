import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koshariapp/animations/fade_animations.dart';
import 'package:koshariapp/cubit/layout_cubit.dart';
import 'package:koshariapp/cubit/layout_state.dart';
import 'package:koshariapp/data/koshary_data.dart';
import 'package:koshariapp/utils/constants.dart';
import 'package:koshariapp/view/user_profile/components/rounded_list_tile.dart';

import '../../models/user_status.dart';
import '../../theme/custom_app_theme.dart';
import 'components/user_appbar.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppConstantsColor.backgroundColor,
            appBar: const UserViewAppBar(),
            body: SizedBox(
              width: width,
              height: height,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7),
                child: Column(
                  children: [
                    topUserInfo(width),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    userStatusListView(width, height, cubit),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    roundedLists(width, height),
                    FadeAnimation(
                      delay: 2.5,
                      child: SizedBox(
                        width: width,
                        height: height / 6.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'My Account',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              'Switch to another Account',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.blue[600],
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.red[600],
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget roundedLists(double width, double height) {
    return FadeAnimation(
      delay: 2,
      child: SizedBox(
        width: width,
        height: height * 0.35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            RoundedListTile(
              icon: Icons.wallet_travel_outlined,
              title: 'Payments',
              leadingBackColor: Colors.green[600],
              trailing: Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[700],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '2 New',
                      style: TextStyle(
                        color: AppConstantsColor.lightTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.lightTextColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            RoundedListTile(
              icon: Icons.archive_outlined,
              title: 'Achievements',
              leadingBackColor: Colors.yellow[600],
              trailing: Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.darkTextColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            RoundedListTile(
              icon: Icons.shield,
              title: 'Privacy',
              leadingBackColor: Colors.grey[600],
              trailing: Container(
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red[500],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Action Needed  ',
                      style: TextStyle(
                        color: AppConstantsColor.lightTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppConstantsColor.lightTextColor,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userStatusListView(double width, double height, LayoutCubit cubit) {
    return FadeAnimation(
        delay: 1.5,
        child: SizedBox(
          width: width,
          height: height * 0.12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Status',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              SizedBox(
                width: width,
                height: height * 0.08,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: userStatus.length,
                  itemBuilder: (context, index) {
                    UserStatus status = userStatus[index];
                    return GestureDetector(
                      onTap: () {
                        cubit.changeUserStatus(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: cubit.currentStatusIndex == index
                                ? status.selectColor
                                : status.unSelectColor,
                            borderRadius: BorderRadius.circular(25)),
                        width: 120,
                        margin: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              status.emoji,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              status.txt,
                              style: const TextStyle(
                                color: AppConstantsColor.lightTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
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
