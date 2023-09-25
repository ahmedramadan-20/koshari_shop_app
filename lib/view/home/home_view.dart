import 'package:flutter/material.dart';
import 'package:koshariapp/data/koshary_data.dart';
import 'package:koshariapp/utils/constants.dart';

import 'components/home_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.05,
                  color: Colors.red,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Text(categories[index]);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
