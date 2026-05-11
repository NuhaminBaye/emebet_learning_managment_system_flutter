import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class LessonCard extends StatelessWidget {
  final String title;
  final String type;
  final String duration;
  final int commentCount;
  final bool isDraft;
  final VoidCallback onTap;
  final VoidCallback onCommentTap;

  const LessonCard({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.commentCount,
    required this.onTap,
    required this.onCommentTap,
    this.isDraft = false,
  });

  Color _getTypeColor() {
    switch (type.toUpperCase()) {
      case 'VIDEO':
        return const Color(0xFF3B82F6);
      case 'QUIZ':
        return const Color(0xFFF59E0B);
      case 'READING':
        return const Color(0xFF8B5CF6);
      case 'PROJECT':
        return const Color(0xFF10B981);
      default:
        return AppColors.primary;
    }
  }

  Color _getTypeBgColor() {
    final color = _getTypeColor();
    return color.withOpacity(0.1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Type Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getTypeBgColor(),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    type.toUpperCase(),
                    style: AppTextTheme.bodySmall.copyWith(
                      color: _getTypeColor(),
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                // Title and Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            duration,
                            style: AppTextTheme.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Icon(
                            Icons.comment_outlined,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: onCommentTap,
                            child: Text(
                              '$commentCount Comments',
                              style: AppTextTheme.bodySmall.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (isDraft)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'DRAFT',
                      style: AppTextTheme.bodySmall.copyWith(
                        color: const Color(0xFFF59E0B),
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  )
                else
                  const Icon(
                    Icons.more_vert,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
