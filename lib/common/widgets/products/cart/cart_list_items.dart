import 'package:eco/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:eco/common/widgets/texts/product_price_text.dart';
import 'package:eco/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartListItems extends StatelessWidget {
  const TCartListItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            /// Cart Item
            const TCartItem(),
            if (showAddRemoveButtons)
              const SizedBox(height: TSizes.spaceBtwItems),

            /// Add Remove Button Row with total price
            if (showAddRemoveButtons)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      /// Extra space
                      SizedBox(width: 70),

                      /// Add Remove Buttons
                      TProductQuantityWithAddRemoveButton(),
                    ],
                  ),

                  /// Product Price
                  TProductPriceText(price: '250')
                ],
              )
          ],
        );
      },
    );
  }
}
