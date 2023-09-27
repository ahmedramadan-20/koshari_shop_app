import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koshariapp/utils/components/custom_snackbar.dart';
import 'package:koshariapp/view/bag/bag_view.dart';

import '../models/koshary_model.dart';
import '../view/home/home_view.dart';
import '../view/user_profile/user_profile_view.dart';
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
    const BagView(),
    const UserProfileView(),
  ];

  // category change index
  int selectedIndexOfCategory = 0;

  void changeCategoryIndex(int index) {
    selectedIndexOfCategory = index;

    emit(ChangeCategoryState());
  }

// featured change index
  int selectedIndexOfFeatured = 1;

  void changeFeaturedIndex(int index) {
    selectedIndexOfFeatured = index;
    emit(ChangeFeaturedState());
  }

// choose extra
  int? selectedExtra;

  void changeExtraIndex(int index) {
    selectedExtra = index;
    emit(ChangeExtraState());
  }

// bag items
  List<Koushari> bagItems = [];

  // add to Bag method
  void addToBag(Koushari data, context) {
// if we have this item in bag
    bool contains = bagItems.contains(data);
    if (contains) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.failedSnackBar());
      emit(AddedToCartFailedState());
    } else {
      bagItems.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBars.successSnackBar());
      emit(AddedToCartSuccessState());
    }
  }

// price of items on bag
  double allItemsOnBagPrice() {
    double sumPrice = 0.0;
    for (Koushari item in bagItems) {
      sumPrice = sumPrice + item.price;
    }
    return sumPrice;
  }

  // remove item from bag
  void removeFromBag(Koushari item) {
    bagItems.remove(item);
    emit(RemoveFromCartState());
  }
}
