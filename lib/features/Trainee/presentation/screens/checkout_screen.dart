import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/shared/widgets/buttons/primary_button.dart';

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
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("The Atelier", style: AppTextTheme.headingMD),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Checkout', style: AppTextTheme.bodyMedium),
            AppSpacing.verticalSm,
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: CachedNetworkImage(
                      imageUrl: "https://picsum.photos/seed/checkout-course/900/420",
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const ColoredBox(color: AppColors.grey300),
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
            Row(
              children: [
                const Text("Payment Method", style: AppTextTheme.headingMD),
                const Spacer(),
                Text("SECURE", style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
              ],
            ),

            AppSpacing.verticalMd,

            _buildPaymentOption("Telebirr", "Mobile Wallet Payment"),
            _buildPaymentOption("Stripe", "Credit or Debit Card"),
            _buildPaymentOption("PayPal", "Express Checkout"),

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
                          backgroundColor: AppColors.grey100,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text("Apply", style: TextStyle(color: AppColors.primary)),
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
            PrimaryButton(
              text: "Pay Now",
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 18),
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

  Widget _buildPaymentOption(String title, String subtitle) {
    final isSelected = selectedPayment == title;
    return GestureDetector(
      onTap: () => setState(() => selectedPayment = title),
      child: Container(
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
    ));
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