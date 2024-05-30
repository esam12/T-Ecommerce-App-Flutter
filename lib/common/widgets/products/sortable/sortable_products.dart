
import 'package:eco/common/layouts/grid_layout.dart';
import 'package:eco/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
            ),
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ]
                .map((option) => DropdownMenuItem(
                    value: option, child: Text(option)))
                .toList(),
            onChanged: (value) {}),
        const SizedBox(height: TSizes.spaceBtwSections),
    
        /// Products
        TGridLayout(
            itemCount: 4,
            itemBuilder: (context, index) =>
                const TProductCardVertical())
      ],
    );
  }
}
