import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koshariapp/utils/constants.dart';

import '../../cubit/layout_cubit.dart';
import '../../cubit/layout_state.dart';
import '../../utils/components.dart';
import 'components/home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {

    var cubit = LayoutCubit.get(context);
    Size size = MediaQuery.sizeOf(context);

    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {

        return SafeArea(
          child: Scaffold(
            backgroundColor: AppConstantsColor.backgroundColor,
            appBar: const HomeAppBar(),
            body: Column(
              children: [
                categoryView(
                  size,
                  cubit.selectedIndexOfCategory,
                  context,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                mainPlatesListView(
                  size,
                  cubit.selectedIndexOfFeatured,
                  context,
                ),
                moreTextAndIcon(),
                bottomCategory(size,),
              ],
            ),
          ),
        );
      },
    );
  }
}
