import 'package:eco/common/layouts/grid_layout.dart';
import 'package:eco/common/widgets/brands/brand_show_case.dart';
import 'package:eco/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:eco/common/widgets/texts/section_heading.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              const TBrandShowCase(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ]),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Products
              TSectionHeader(title: "You might like", onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                  itemCount: 6,
                  itemBuilder: (context, index) =>
                      const TProductCardVertical()),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
