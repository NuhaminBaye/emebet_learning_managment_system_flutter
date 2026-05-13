import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.authorName,
    required this.authorRole,
    required this.timeAgo,
    required this.comment,
    required this.avatarUrl,
    this.isInstructor = false,
    this.indentLevel = 0,
    this.showActions = false,
    this.onReply,
    this.onLike,
    this.likeCount = 0,
  });

  final String authorName;
  final String authorRole;
  final String timeAgo;
  final String comment;
  final String avatarUrl;
  final bool isInstructor;
  /// 0 = root, 1 = nested reply
  final int indentLevel;
  final bool showActions;
  final VoidCallback? onReply;
  final VoidCallback? onLike;
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    final bg = isInstructor
        ? InstructorDesign.primary.withValues(alpha: 0.06)
        : InstructorDesign.surface;

    return Padding(
      padding: EdgeInsets.only(
        left: indentLevel * 20.0,
        bottom: 12,
      ),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isInstructor
                ? InstructorDesign.primary.withValues(alpha: 0.15)
                : InstructorDesign.chipInactiveBg.withValues(alpha: 0.9),
          ),
          boxShadow: isInstructor
              ? null
              : InstructorDesign.cardShadow(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: avatarUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: avatarUrl,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorWidget: (_, __, ___) => _fallbackAvatar(),
                        )
                      : _fallbackAvatar(),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            authorName,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: InstructorDesign.textPrimary,
                            ),
                          ),
                          if (authorRole.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: isInstructor
                                    ? InstructorDesign.primary
                                    : InstructorDesign.surfaceMuted,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                authorRole,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.4,
                                  color: isInstructor
                                      ? Colors.white
                                      : InstructorDesign.textSecondary,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        timeAgo,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: InstructorDesign.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              comment,
              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
                color: InstructorDesign.textPrimary,
              ),
            ),
            if (showActions && (onReply != null || onLike != null)) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  if (onLike != null)
                    TextButton.icon(
                      onPressed: onLike,
                      icon: const Icon(Icons.favorite_border, size: 18),
                      label: Text(
                        likeCount > 0 ? '$likeCount' : '',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  if (onReply != null)
                    TextButton.icon(
                      onPressed: onReply,
                      icon: const Icon(Icons.reply_rounded, size: 18),
                      label: const Text('Reply'),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _fallbackAvatar() {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      color: InstructorDesign.surfaceMuted,
      child: Text(
        authorName.isNotEmpty ? authorName[0].toUpperCase() : '?',
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          color: InstructorDesign.primary,
        ),
      ),
    );
  }
}
