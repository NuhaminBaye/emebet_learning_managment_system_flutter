import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    super.key,
    required this.title,
    required this.type,
    required this.duration,
    required this.commentCount,
    required this.onTap,
    required this.onCommentTap,
    this.isDraft = false,
    this.moduleLabel,
  });

  final String title;
  final String type;
  final String duration;
  final int commentCount;
  final bool isDraft;
  final VoidCallback onTap;
  final VoidCallback onCommentTap;
  /// e.g. "Module 01" — optional second line in hierarchy-heavy layouts
  final String? moduleLabel;

  Color _typeAccent() {
    switch (type.toUpperCase()) {
      case 'VIDEO':
        return const Color(0xFF2563EB);
      case 'QUIZ':
        return const Color(0xFFD97706);
      case 'READING':
        return const Color(0xFF7C3AED);
      case 'PROJECT':
        return InstructorDesign.primary;
      default:
        return InstructorDesign.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final accent = _typeAccent();
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: InstructorDesign.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: InstructorDesign.cardShadow(context),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, right: 10),
                child: Icon(
                  Icons.drag_indicator_rounded,
                  color: InstructorDesign.textTertiary.withValues(alpha: 0.55),
                  size: 22,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (moduleLabel != null) ...[
                      Text(
                        moduleLabel!,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                          color: InstructorDesign.textTertiary,
                        ),
                      ),
                      const SizedBox(height: 6),
                    ],
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            type.toUpperCase(),
                            style: TextStyle(
                              color: accent,
                              fontWeight: FontWeight.w800,
                              fontSize: 10,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (isDraft)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: InstructorDesign.primary.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: InstructorDesign.primary.withValues(alpha: 0.35),
                              ),
                            ),
                            child: const Text(
                              'DRAFT',
                              style: TextStyle(
                                color: InstructorDesign.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                                letterSpacing: 0.6,
                              ),
                            ),
                          )
                        else
                          Icon(
                            Icons.more_horiz_rounded,
                            color: InstructorDesign.textTertiary.withValues(alpha: 0.6),
                            size: 22,
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: InstructorDesign.textPrimary,
                        height: 1.25,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule_rounded,
                          size: 15,
                          color: InstructorDesign.textSecondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: InstructorDesign.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: onCommentTap,
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.chat_bubble_outline_rounded,
                                size: 15,
                                color: InstructorDesign.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '$commentCount',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: InstructorDesign.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
