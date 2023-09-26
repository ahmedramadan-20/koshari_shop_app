
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/home/home_view.dart';
import 'layout_state.dart';



class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);


  // cubit for bottom nav bar
   PageController pageController = PageController();
   int selectedIndex = 0;

  void changeBottomNav(int index) {
    selectedIndex = index;
    pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
    emit(ChatChangeBottomNavState());
  }
   List<Widget> screens = [
    const HomeView(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
  ];

  // category change index
  int selectedIndexOfCategory = 0;

void changeCategoryIndex(int index ){
  selectedIndexOfCategory = index;

  emit(ChangeCategoryState());
}

// featured change index
  int selectedIndexOfFeatured = 1;
void changeFeaturedIndex(int index ){
  selectedIndexOfFeatured = index;
  emit(ChangeFeaturedState());

}



}

