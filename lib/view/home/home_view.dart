import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:koshariapp/animations/fade_animations.dart';
import 'package:koshariapp/data/koshary_data.dart';
import 'package:koshariapp/models/koshary_model.dart';
import 'package:koshariapp/theme/custom_app_theme.dart';
import 'package:koshariapp/utils/constants.dart';

import 'components/home_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndexOfCategory = 0;
  int selectedIndexOfFeatured = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstantsColor.backgroundColor,
        appBar: const HomeAppBar(),
        body: Column(
          children: [
            _categoryView(size),
            SizedBox(
              height: size.height * 0.01,
            ),
            _mainPlatesListView(size),
            _moreTextAndIcon(),
            _bottomCategory(size),
          ],
        ),
      ),
    );
  }

  SizedBox _bottomCategory(Size size) {
    return SizedBox(
            width: size.width,
            height: size.height * 0.28,

            child: ListView.builder(
              itemCount: availablePlates.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                Koushari model = availablePlates[index];
                return Container(
                  width: size.width * 0.5,
                  margin: EdgeInsetsDirectional.all(
                    10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        left: 4,
                        child: FadeAnimation(
                          delay: 1,
                          child: Container(
                            width: size.width / 13,
                            height: size.height / 10,
                            color: Colors.red,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Center(
                                child: FadeAnimation(
                                  delay: 1.5,
                                  child: const Text(
                                    'NEW',
                                    style: AppTheme.homeGridNewText,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 5,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppConstantsColor.darkTextColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        child: FadeAnimation(
                          delay: 1.5,
                          child: RotationTransition(
                            turns: const AlwaysStoppedAnimation(0 / 360),
                            child: Hero(
                              tag: model.size,
                              child: Image(
                                image: AssetImage(
                                  model.image,
                                ),
                                width: size.width * 0.45,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        child: FadeAnimation(
                          delay: 2,
                          child: Text(
                            '${model.name} ${model.size}',
                            style: AppTheme.homeGridNameAndModel,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: FadeAnimation(
                          delay: 2.2,
                          child: Text(
                            'EGP ${model.price.toStringAsFixed(1)}',
                            style: AppTheme.homeGridPrice,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }

  Padding _moreTextAndIcon() {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'More',
            style: AppTheme.homeMoreText,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.arrow_right,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainPlatesListView(Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsetsDirectional.symmetric(
            horizontal: size.width * 0.02,
          ),
          width: size.width / 16,
          height: size.height / 2.4,
          child: RotatedBox(
            quarterTurns: -1,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndexOfFeatured = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: size.width * 0.04,
                    ),
                    child: Text(
                      featured[index],
                      style: TextStyle(
                        fontSize: selectedIndexOfFeatured == index ? 21 : 18,
                        color: selectedIndexOfFeatured == index
                            ? AppConstantsColor.darkTextColor
                            : AppConstantsColor.unSelectedTextColor,
                        fontWeight: selectedIndexOfFeatured == index
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          height: size.height * 0.4,
          width: size.width * 0.89,
          child: ListView.builder(
            itemCount: availablePlates.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Koushari model = availablePlates[index];
              return GestureDetector(
                onTap: () {
                  // Navigate to details Screen
                },
                child: Container(
                  margin: EdgeInsetsDirectional.symmetric(
                    horizontal: size.width * 0.005,
                    vertical: size.height * 0.01,
                  ),
                  width: size.width / 1.5,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width / 1.81,
                        decoration: BoxDecoration(
                          color: model.color,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        child: FadeAnimation(
                          delay: 1,
                          child: Row(
                            children: [
                              Text(
                                model.name,
                                style: AppTheme.homeProductName,
                              ),
                              SizedBox(
                                width: size.width * 0.3,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 40,
                          left: 10,
                          child: FadeAnimation(
                            delay: 1.5,
                            child: Text(
                              model.size,
                              style: AppTheme.homeProductModel,
                            ),
                          )),
                      Positioned(
                          top: 80,
                          left: 10,
                          child: FadeAnimation(
                            delay: 2,
                            child: Text(
                              "EGP ${model.price.toStringAsFixed(1)}",
                              style: AppTheme.homeProductPrice,
                            ),
                          )),
                      Positioned(
                        left: 40,
                        top: 70,
                        child: FadeAnimation(
                          delay: 2,
                          child: Hero(
                            tag: model.image,
                            child: RotationTransition(
                              turns: const AlwaysStoppedAnimation(-60 / 360),
                              child: SizedBox(
                                width: 250,
                                height: 230,
                                child: Image(
                                  image: AssetImage(model.image),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 170,
                          child: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.circleArrowRight,
                              color: Colors.white,
                              size: 25,
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Widget _categoryView(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.04,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndexOfCategory = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: size.width * 0.04,
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: selectedIndexOfCategory == index ? 21 : 18,
                      color: selectedIndexOfCategory == index
                          ? AppConstantsColor.darkTextColor
                          : AppConstantsColor.unSelectedTextColor,
                      fontWeight: selectedIndexOfCategory == index
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
