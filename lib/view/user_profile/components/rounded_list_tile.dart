import 'package:flutter/material.dart';
import 'package:koshariapp/theme/custom_app_theme.dart';
import 'package:koshariapp/utils/constants.dart';

class RoundedListTile extends StatelessWidget {
  final Color? leadingBackColor;
  final IconData icon;
  final String title;
  final Widget trailing;

  const RoundedListTile(
      {super.key,
      this.leadingBackColor,
      required this.icon,
      required this.title,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: leadingBackColor,
              radius: 25,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  color: AppConstantsColor.lightTextColor,
                ),
              ),
            ),
            title: Text(
              title,
              style: AppTheme.profileRepeatedListTileTitle,
            ),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
