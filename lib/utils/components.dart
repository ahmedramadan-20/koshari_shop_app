import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:koshariapp/cubit/layout_cubit.dart';
import 'package:koshariapp/view/details_view/details_view.dart';

import '../animations/fade_animations.dart';
import '../data/koshary_data.dart';
import '../models/koshary_model.dart';
import '../theme/custom_app_theme.dart';
import 'constants.dart';

Widget bottomCategory(
  Size size,
) {
  return SizedBox(
    width: size.width,
    height: size.height * 0.28,
    child: ListView.builder(
      itemCount: availablePlates.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        Koushari model = availablePlates[index];
        return GestureDetector(
          onTap: () {
            // navigate to details Screen
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsView(
                    model: model,
                    isComeFromMoreSection: true,
                  ),
                ));
          },
          child: Container(
            width: size.width * 0.5,
            margin: const EdgeInsetsDirectional.all(
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
          ),
        );
      },
    ),
  );
}

Widget moreTextAndIcon() {
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

Widget mainPlatesListView(Size size, int featuredIndex, context) {
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
                  LayoutCubit.get(context).changeFeaturedIndex(index);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: size.width * 0.04,
                  ),
                  child: Text(
                    featured[index],
                    style: TextStyle(
                      fontSize: featuredIndex == index ? 21 : 18,
                      color: featuredIndex == index
                          ? AppConstantsColor.darkTextColor
                          : AppConstantsColor.unSelectedTextColor,
                      fontWeight: featuredIndex == index
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
      SizedBox(
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsView(
                        model: model,
                        isComeFromMoreSection: false,
                      ),
                    ));
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
                              width: size.width * 0.26,
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
                            turns: const AlwaysStoppedAnimation(-40 / 360),
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

Widget categoryView(Size size, int categoryIndex, context) {
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
                LayoutCubit.get(context).changeCategoryIndex(index);
              },
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: size.width * 0.04,
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: categoryIndex == index ? 21 : 18,
                    color: categoryIndex == index
                        ? AppConstantsColor.darkTextColor
                        : AppConstantsColor.unSelectedTextColor,
                    fontWeight: categoryIndex == index
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
