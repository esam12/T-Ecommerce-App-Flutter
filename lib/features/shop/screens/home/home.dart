import 'package:eco/common/layouts/grid_layout.dart';
import 'package:eco/common/widgets/custom_shapes/containers/primery_header_container.dart';
import 'package:eco/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:eco/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:eco/common/widgets/texts/section_heading.dart';
import 'package:eco/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:eco/features/shop/screens/home/widgets/home_categories.dart';
import 'package:eco/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const TPrimeryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwItems),
    
                  /// SearchBar
                  TSearchContainer(
                    text: "Search in Store",
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
    
                  /// Categories
                  THomeCategories(),
                ],
              ),
            ),
    
            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Slider
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
    
                  /// Popular Products
                  const TSectionHeader(title: "Popular Products"),
                  const SizedBox(height: TSizes.spaceBtwItems),
    
                  TGridLayout(
                    itemCount: 6,
                    itemBuilder: (context, index) =>
                        const TProductCardVertical(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
