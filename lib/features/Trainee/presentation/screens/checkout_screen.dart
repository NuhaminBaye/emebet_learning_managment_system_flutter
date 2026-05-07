import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPayment = "Telebirr";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Checkout", style: AppTextTheme.headingMD),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1480714378408-67c0a6c0e0c7",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("PREMIUM COURSE", style: TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.w600)),
                        AppSpacing.verticalXs,
                        Text("Sustainable Urban Planning", style: AppTextTheme.headingMD),
                        const Text("Master the future of eco-cities", style: AppTextTheme.bodyRegular),
                        AppSpacing.verticalMd,
                        Row(
                          children: [
                            Text("\$49.99", style: AppTextTheme.headingLG.copyWith(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            const Icon(Icons.play_circle_outline, size: 20),
                            AppSpacing.horizontalXs,
                            const Text("12 Modules", style: AppTextTheme.bodySmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            // Payment Method
            const Text("Payment Method", style: AppTextTheme.headingMD),
            AppSpacing.verticalSm,
            const Text("SECURE", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),

            AppSpacing.verticalMd,

            _buildPaymentOption("Telebirr", "Mobile Wallet Payment", "assets/icons/telebirr.png", true),
            _buildPaymentOption("Stripe", "Credit or Debit Card", "assets/icons/stripe.png", false),
            _buildPaymentOption("PayPal", "Express Checkout", "assets/icons/paypal.png", false),

            AppSpacing.verticalLg,

            // Order Summary
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Order Summary", style: AppTextTheme.headingMD),
                  AppSpacing.verticalLg,

                  // Promo Code
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter coupon",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      AppSpacing.horizontalSm,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("Apply"),
                      ),
                    ],
                  ),

                  AppSpacing.verticalLg,

                  _buildSummaryRow("Subtotal", "\$49.99"),
                  _buildSummaryRow("Discount", "-\$0.00", isDiscount: true),
                  const Divider(),
                  _buildSummaryRow("Total", "\$49.99", isBold: true),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            // Pay Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text(
                  "Pay Now →",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            AppSpacing.verticalLg,

            // Security Note
            const Center(
              child: Text(
                "ENCRYPTED WITH 256-BIT SSL",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, String subtitle, String iconPath, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? const Color(0xFF22C55E) : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // You can replace with actual icons later
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.payment, color: Colors.green),
          ),
          AppSpacing.horizontalMd,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
              Text(subtitle, style: AppTextTheme.bodySmall),
            ],
          ),
          const Spacer(),
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? const Color(0xFF22C55E) : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String amount, {bool isBold = false, bool isDiscount = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextTheme.bodyMedium),
          Text(
            amount,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isDiscount ? Colors.green : null,
            ),
          ),
        ],
      ),
    );
  }
}