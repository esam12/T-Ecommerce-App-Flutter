import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/products/sortable/sortable_products.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        /// AppBar
        appBar: TAppbar(
          title: Text('Popular Products'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child:  TSortableProducts(),
          ),
        ),
      ),
    );
  }
}
