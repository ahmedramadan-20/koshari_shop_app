import 'package:flutter/material.dart';
import 'package:koshariapp/animations/fade_animations.dart';

import '../../../theme/custom_app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        height: height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
              delay: 0.5,
              child: const Text(
                'No dishes added!',
                style: AppTheme.bagEmptyListTitle,
              ),
            ),
            FadeAnimation(
              delay: 0.5,
              child: const Text(
                'Once you have added, come back 😋',
                style: AppTheme.bagEmptyListSubTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
