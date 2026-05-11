import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/comment_card.dart';

class StudentCommentsScreen extends StatefulWidget {
  final String? lessonId;
  final String? lessonTitle;

  const StudentCommentsScreen({
    super.key,
    this.lessonId,
    this.lessonTitle,
  });

  @override
  State<StudentCommentsScreen> createState() => _StudentCommentsScreenState();
}

class _StudentCommentsScreenState extends State<StudentCommentsScreen> {
  final List<Map<String, dynamic>> comments = [
    {
      'id': '1',
      'authorName': 'Elena Rodriguez',
      'authorRole': 'Student',
      'timeAgo': 'Started yesterday • Lesson 1: Design',
      'comment':
          'The explanation of visual hierarchy was really helpful! Could you clarify how it applies to the board layouts with multiple primary actions?',
      'avatarUrl': '',
      'likeCount': 12,
    },
    {
      'id': '2',
      'authorName': 'Alex Mercad',
      'authorRole': 'Instructor',
      'timeAgo': 'Replied 15 minutes ago',
      'comment':
          'Great question, Elena! In complex information, visual hierarchy guides focus. To apply this with multiple primary actions, use Progressive Disclosure and Consistent State Indicators to keep interfaces organized while maintaining user attention.',
      'avatarUrl': '',
      'likeCount': 0,
    },
    {
      'id': '3',
      'authorName': 'Marcus Chen',
      'authorRole': 'Student',
      'timeAgo': '2 months ago • Course Design',
      'comment':
          'I\'m struggling with finding a secondary color that complements Lumina Green. Any suggestions for high-energy palettes?',
      'avatarUrl': '',
      'likeCount': 0,
    },
  ];

  void _handleReply(String commentId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Reply to comment $commentId'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleLike(String commentId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Liked comment $commentId'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Student Comments',
          style: AppTextTheme.headingMD.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lesson Title
            if (widget.lessonTitle != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lesson Comments',
                      style: AppTextTheme.headingMD.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.lessonTitle ?? '',
                      style: AppTextTheme.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

            // Comments List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return CommentCard(
                  authorName: comment['authorName'],
                  authorRole: comment['authorRole'],
                  timeAgo: comment['timeAgo'],
                  comment: comment['comment'],
                  avatarUrl: comment['avatarUrl'],
                  likeCount: comment['likeCount'],
                  onReply: () => _handleReply(comment['id']),
                  onLike: () => _handleLike(comment['id']),
                );
              },
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}
