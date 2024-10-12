class RPricingCalculator {
  RPricingCalculator._(); // To avoid creating instances

  // Calculate total price based on product price, tax, and shipping cost
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  // Calculate shipping cost as a string (for UI)
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  // Calculate tax as a string (for UI)
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  // Get tax rate based on the location
  static double getTaxRateForLocation(String location) {
    // You can enhance this function by using an API or database lookup to get tax rates based on location
    return 0.10; // Example: 10% tax rate
  }

  // Get shipping cost based on location
  static double getShippingCost(String location) {
    // You can enhance this function with a more advanced shipping calculation, API lookup, etc.
    return 5.00; // Example: $5 shipping cost
  }

  // // Sum all cart values and return the total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items
  //       .map((item) => item.price)
  //       .fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
