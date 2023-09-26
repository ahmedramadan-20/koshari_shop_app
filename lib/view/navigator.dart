import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koshariapp/cubit/layout_cubit.dart';
import 'package:koshariapp/utils/constants.dart';

import '../cubit/layout_state.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  // PageController _pageController = PageController();
  // int _selectedIndex = 0;
  // List<Widget> _screens = [
  //   HomeView(),
  //   Container(
  //     color: Colors.red,
  //   ),
  //   Container(
  //     color: Colors.yellow,
  //   ),
  //   Container(
  //     color: Colors.deepPurpleAccent,
  //   ),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  //   // _pageController.jumpToPage(_selectedIndex);
  //   _pageController.animateToPage(
  //     _selectedIndex,
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.linear,
  //   );
  // }
  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: cubit.pageController,
            children: cubit.screens,
          ),
          bottomNavigationBar: CustomNavigationBar(
            currentIndex: cubit.selectedIndex,
            onTap: cubit.changeBottomNav,
            iconSize: 27.0,
            bubbleCurve: Curves.linear,
            selectedColor: AppConstantsColor.materialButtonColor,
            strokeColor: AppConstantsColor.materialButtonColor,
            unSelectedColor: const Color(0xffacacac),
            backgroundColor: Colors.white,
            scaleFactor: 0.1,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(
                  Icons.home_outlined,
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  Icons.person_outline,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
