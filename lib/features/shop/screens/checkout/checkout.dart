import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eco/common/widgets/products/cart/cart_list_items.dart';
import 'package:eco/common/widgets/products/cart/coupon_widget.dart';
import 'package:eco/common/widgets/success_screen.dart';
import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:eco/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:eco/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:eco/navigation_menu.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return SafeArea(
      child: Scaffold(
        appBar: TAppbar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Items in Cart
                const TCartListItems(
                  showAddRemoveButtons: false,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Coupon TextField
                const TCouponCode(),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Billing Section
                TRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: const Column(
                    children: [
                      /// Pricing
                      TBillingAmountSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      /// Divider
                      Divider(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      /// Payment Method
                      TBillingPaymentSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      /// Address
                      TBillingAddressSection(),
                      SizedBox(height: TSizes.spaceBtwItems),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: TElevatedButton(
            text: 'Checkout \$268',
            onPressed: () {
              Get.to(() => SuccessScreen(
                    image: TImages.successfulPaymentIcon,
                    title: 'Payment Success!',
                    subTitle: "Your item will be shipped soon!",
                    onPressed: () => Get.offAll(
                      () => const NavigationMenu(),
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
