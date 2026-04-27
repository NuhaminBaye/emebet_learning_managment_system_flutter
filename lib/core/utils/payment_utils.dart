class PaymentUtils {
  static String formatCurrency(double amount) {
    return "\$${amount.toStringAsFixed(2)}";
  }
}