import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koshariapp/animations/fade_animations.dart';
import 'package:koshariapp/models/koshary_model.dart';
import 'package:koshariapp/utils/constants.dart';
import 'package:koshariapp/view/bag/components/empty_state.dart';

import '../../cubit/layout_cubit.dart';
import '../../cubit/layout_state.dart';
import '../../theme/custom_app_theme.dart';



class BagView extends StatelessWidget {
  const BagView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    var cubit = LayoutCubit.get(context);

    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppConstantsColor.backgroundColor,
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: width,
              height: height,
              child: Column(
                children: [
                  bagAppBar(width, height, cubit),
                  cubit.bagItems.isEmpty
                      ? const EmptyState()
                      : Column(
                          children: [
                            SizedBox(
                              width: width,
                              height: height * 0.68,
                              child: ListView.builder(
                                itemCount: cubit.bagItems.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  Koushari currentBagItem =
                                      cubit.bagItems[index];
                                  return FadeAnimation(
                                    delay: 1.5 * (index / 4),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      height: height * 0.2,
                                      width: width,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.4,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(20),
                                                  width: width * 0.4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    color: currentBagItem.color
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                Positioned(
                                                    left: 6,
                                                    child: SizedBox(
                                                      width: 180,
                                                      height: 180,
                                                      child: Image(
                                                        image: AssetImage(
                                                          currentBagItem.image,
                                                        ),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 14,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                currentBagItem.size,
                                                style: AppTheme.bagProductModel,
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                'EGP ${currentBagItem.price.toStringAsFixed(2)}',
                                                style: AppTheme.bagProductPrice,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cubit.removeFromBag(currentBagItem);
                                                    },
                                                    child: Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.grey[300],
                                                      ),
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.remove,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.0),
                                                    child: Text(
                                                      '1',
                                                      style: AppTheme
                                                          .bagProductNumOfDish,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.grey[300],
                                                      ),
                                                      child: const Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                                width: width,
                                height: height * 0.13,
                                child: Column(
                                  children: [
                                    FadeAnimation(
                                        delay: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'total'.toUpperCase(),
                                              style: AppTheme.bagTotalPrice,
                                            ),
                                            Text(
                                              'EGP ${cubit.allItemsOnBagPrice().toStringAsFixed(2)}',
                                              style: AppTheme.bagSumOfItemOnBag,
                                            )
                                          ],
                                        )),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    FadeAnimation(
                                      delay: 3,
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minWidth: width / 1.2,
                                        height: height / 15,
                                        color: AppConstantsColor
                                            .materialButtonColor,
                                        onPressed: () {},
                                        child: Text(
                                          'next'.toUpperCase(),
                                          style: TextStyle(
                                              color: AppConstantsColor
                                                  .lightTextColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bagAppBar(double width, double height, LayoutCubit cubit) {
    return SizedBox(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My Bag',
              style: AppTheme.bagTitle,
            ),
            Text(
              'Total ${cubit.bagItems.length} Items',
              style: AppTheme.bagTotalPrice,
            ),
          ],
        ),
      ),
    );
  }
}
