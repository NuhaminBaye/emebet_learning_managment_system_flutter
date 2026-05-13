import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/theme/app_shadows.dart';
import 'package:lms_mobileapp/shared/widgets/buttons/primary_button.dart';

class EnrollBottomBar extends StatelessWidget {
  final String price;

  const EnrollBottomBar({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [AppShadows.topBar],
        ),
        child: PrimaryButton(
          text: "Enroll Now - $price",
          height: 52,
          radius: 18,
          onPressed: () => Navigator.pushNamed(context, AppRoutes.checkOut),
        ),
      ),
    );
  }
}