import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koshariapp/animations/fade_animations.dart';
import 'package:koshariapp/cubit/layout_cubit.dart';
import 'package:koshariapp/models/koshary_model.dart';
import 'package:koshariapp/utils/constants.dart';

import '../../cubit/layout_state.dart';
import '../../theme/custom_app_theme.dart';
import 'components/app_bar.dart';

class DetailsView extends StatelessWidget {
  final Koushari model;
  final bool isComeFromMoreSection;

  const DetailsView(
      {Key? key, required this.model, required this.isComeFromMoreSection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppConstantsColor.backgroundColor,
            appBar: const CustomDetailsViewAppBar(),
            body: SizedBox(
              width: size.width,
              height: size.height * 1.1,
              child: Column(
                children: [
                  // image and bg color
                  topProductImageAndBg(size),
                  // more product pics
                  morePicsOfProduct(size),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        productNameAndPrice(),
                        productInfo(size.width, size.height),
                        moreDetailsText(size.width, size.height),
                        SizedBox(height: size.height*0.15,),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: FadeAnimation(
                            delay: 2.5,
                            child: MaterialButton(
                              color: AppConstantsColor.materialButtonColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              minWidth: size.width/1.2,
                              height: size.height/15,
                              onPressed: () {},
                              child: Text(
                                'add to bag'.toUpperCase(),
                                style: TextStyle(color: AppConstantsColor.lightTextColor),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget moreDetailsText(width, height) {
    return FadeAnimation(
        delay: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(
            'More details'.toUpperCase(),
            style: AppTheme.detailsMoreText,
          ),
        ));
  }

// about the plate
  Widget productInfo(width, height) {
    return FadeAnimation(
      delay: 1.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: SizedBox(
          width: width,
          height: height / 9,
          child: Text(
            'Some date about Koushari Some date about Koushari Some date about Koushari Some date about Koushari Some date about Koushari Some date about Koushari Some date about Koushari Some date about Koushari',
            style: AppTheme.detailsProductDescriptions,
          ),
        ),
      ),
    );
  }

// product name and price
  productNameAndPrice() {
    return FadeAnimation(
      delay: 1,
      child: Row(
        children: [
          Text(
            model.name,
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppConstantsColor.darkTextColor),
          ),
          Expanded(child: Container()),
          Text(
            'EGP${model.price.toStringAsFixed(1)}',
            style: AppTheme.detailsProductPrice,
          )
        ],
      ),
    );
  }

  Widget morePicsOfProduct(Size size) {
    return FadeAnimation(
      delay: 0.5,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => index == 3
                ? Container(
                    width: size.width / 5,
                    height: size.height / 14,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: AssetImage(model.image),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.grey.withOpacity(1),
                          BlendMode.darken,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: AppConstantsColor.lightTextColor,
                        size: 30,
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                    child: roundedImage(
                      size.width,
                      size.height,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget topProductImageAndBg(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height / 2.3,
      child: Stack(
        children: [
          Positioned(
            left: 60,
            bottom: 20,
            child: FadeAnimation(
              delay: 0.5,
              child: Container(
                width: size.width,
                height: size.height / 2.2,
                decoration: BoxDecoration(
                  color: model.color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(1500),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 30,
            child: Hero(
              tag: isComeFromMoreSection ? model.size : model.image,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-25 / 360),
                child: SizedBox(
                  width: size.width / 1.3,
                  height: size.height / 4.3,
                  child: Image(
                    image: AssetImage(
                      model.image,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  roundedImage(width, height) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: width / 5,
      height: height / 14,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
      child: Image(
        image: AssetImage(model.image),
      ),
    );
  }
}
