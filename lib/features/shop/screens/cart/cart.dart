import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kheti_project2/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:kheti_project2/features/shop/screens/checkout/checkout.dart';
import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../utils/constants/size.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(RSizes.defaultSpace),
        child: RCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen()),
          child: const Text("Pay ₹899"),
        ),
      ),
    );
  }
}
