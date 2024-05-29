import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/features/personalization/screens/address/widgets/address_item.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: TColors.primary,
          child: Icon(
            Iconsax.add,
            color: TColors.white,
          ),
        ),
        appBar: TAppbar(
          showBackArrow: true,
          title: Text(
            'Addresses',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                AddressItem(selectedAddress: false),
                AddressItem(selectedAddress: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
