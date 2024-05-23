import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:eco/common/widgets/custom_shapes/containers/image_rounded.dart';
import 'package:eco/features/shop/controllers/home_controller.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
              autoPlay: true,
            ),
            items: banners
                .map((imagUrl) => TRoundedImage(imageUrl: imagUrl))
                .toList()),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < banners.length; i++)
              Obx(
                () => TCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? TColors.primary
                      : TColors.grey,
                ),
              ),
          ],
        )
      ],
    );
  }
}
