import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/theme/app_radius.dart';

class DiscussionItemCard extends StatelessWidget {
  const DiscussionItemCard({
    super.key,
    required this.name,
    required this.time,
    required this.message,
    this.isInstructor = false,
  });

  final String name;
  final String time;
  final String message;
  final bool isInstructor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: isInstructor ? const Color(0xFFFFF7ED) : AppColors.primaryLight,
                child: Text(name.characters.first.toUpperCase()),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isInstructor) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF59E0B),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text('INSTRUCTOR', style: TextStyle(color: Colors.white, fontSize: 10)),
                          ),
                        ],
                      ],
                    ),
                    Text(time, style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(message, style: AppTextTheme.bodyMedium),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.reply_outlined, size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Text('Reply', style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary)),
            ],
          ),
        ],
      ),
    );
  }
}
