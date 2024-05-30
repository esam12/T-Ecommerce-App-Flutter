import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/products/cart/cart_list_items.dart';
import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TAppbar(
          showBackArrow: true,
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: TCartListItems(),
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
