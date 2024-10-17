import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheti_project2/common/widgets/products.cart/coupon_code.dart';
import 'package:kheti_project2/common/widgets/success_screen/success_screen1.dart';
import 'package:kheti_project2/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:kheti_project2/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:kheti_project2/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:kheti_project2/navigation_menu.dart';

import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/custom_rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = RHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: RAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              const RCartItems(showAddRemoveButton: false),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Coupon TextField
              const RCouponCode(),
              const SizedBox(height: RSizes.spaceBtwSections),

              // Billing Section inside Rounded Container
              RRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(RSizes.md),
                backgroundColor: isDarkMode ? RColors.black : RColors.white,
                child: Column(
                  // Removed `const` keyword
                  children: [
                    // Pricing
                    const RBillingAmountSection(),
                    const SizedBox(height: RSizes.spaceBtwItems),

                    // Divider
                    const Divider(),
                    const SizedBox(height: RSizes.spaceBtwItems),

                    // Payment Methods
                    const RBillingPaymentSection(),
                    const SizedBox(height: RSizes.spaceBtwItems),

                    // Address
                    const RBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: RImages.successfullyRegisterAnimation,
              title: 'Give a Title',
              subTitle: 'Give a SubTitle',
              onPressed: () => Get.to(() => const NavigationMenu()),
            ),
          ),
          child: const Text("Pay ₹899"),
        ),
      ),
    );
  }
}
