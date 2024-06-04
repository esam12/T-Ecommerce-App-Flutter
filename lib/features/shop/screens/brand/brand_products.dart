import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/products/sortable/sortable_products.dart';
import 'package:eco/features/shop/screens/store/widgets/featured_brand_item.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TAppbar(
          title: Text('Nike'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TFeaturedBrandItem(showBorder: true),
                SizedBox(height: TSizes.spaceBtwSections),
                TSortableProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
