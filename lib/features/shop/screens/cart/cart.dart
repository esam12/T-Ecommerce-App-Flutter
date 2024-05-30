import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/common/widgets/texts/product_price_text.dart';
import 'package:eco/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        appBar: TAppbar(
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (_, __) =>
                  const SizedBox(height: TSizes.spaceBtwSections),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TCartItem(dark: dark),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            /// Add Remove Buttons
                            SizedBox(width: 70),
                            TProductQuantityWithAddRemoveButton(),
                          ],
                        ),
                        TProductPriceText(price: '250')
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TElevatedButton(
            text: "Checkout \$250",
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
