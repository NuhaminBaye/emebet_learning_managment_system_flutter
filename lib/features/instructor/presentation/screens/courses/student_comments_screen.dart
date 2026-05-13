import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
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
  final _composer = TextEditingController();

  late final List<_CommentRow> _thread;

  @override
  void initState() {
    super.initState();
    _thread = [
      _CommentRow(
        id: '1',
        authorName: 'Elena Rodriguez',
        authorRole: 'Student',
        timeAgo: 'Started yesterday • Lesson 1: Design',
        comment:
            'The explanation of visual hierarchy was really helpful! Could you clarify how it applies to board layouts with multiple primary actions?',
        avatarUrl:
            'https://ui-avatars.com/api/?name=Elena+Rodriguez&background=f1f5f9&color=334155',
        isInstructor: false,
        indentLevel: 0,
      ),
      _CommentRow(
        id: '2',
        authorName: 'Alex Mercado',
        authorRole: 'Instructor',
        timeAgo: 'Replied 15 minutes ago',
        comment:
            'Great question, Elena! In complex interfaces, visual hierarchy guides focus. Use progressive disclosure and consistent state indicators when you have multiple primary actions.',
        avatarUrl:
            'https://ui-avatars.com/api/?name=Alex+Mercado&background=2ECC71&color=fff',
        isInstructor: true,
        indentLevel: 1,
      ),
      _CommentRow(
        id: '3',
        authorName: 'Marcus Chen',
        authorRole: 'Student',
        timeAgo: '2 months ago • Course Design',
        comment:
            'I\'m struggling to find a secondary color that complements Lumina Green. Any suggestions for high-energy palettes?',
        avatarUrl:
            'https://ui-avatars.com/api/?name=Marcus+Chen&background=f1f5f9&color=334155',
        isInstructor: false,
        indentLevel: 0,
      ),
    ];
  }

  @override
  void dispose() {
    _composer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstructorDesign.canvas,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: InstructorDesign.canvas,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          color: InstructorDesign.textPrimary,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Student Comments',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: InstructorDesign.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (widget.lessonTitle != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.lessonTitle!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: InstructorDesign.textSecondary,
                  ),
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
              itemCount: _thread.length,
              itemBuilder: (context, index) {
                final row = _thread[index];
                return CommentCard(
                  authorName: row.authorName,
                  authorRole: row.authorRole,
                  timeAgo: row.timeAgo,
                  comment: row.comment,
                  avatarUrl: row.avatarUrl,
                  isInstructor: row.isInstructor,
                  indentLevel: row.indentLevel,
                  showActions: false,
                );
              },
            ),
          ),
          Material(
            elevation: 12,
            shadowColor: Colors.black26,
            color: InstructorDesign.surface,
            child: SafeArea(
              top: false,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _composer,
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Write a reply…',
                          hintStyle: TextStyle(
                            color:
                                InstructorDesign.textTertiary.withValues(alpha: 0.85),
                          ),
                          filled: true,
                          fillColor: InstructorDesign.canvas,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Material(
                      color: InstructorDesign.primary,
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          if (_composer.text.trim().isEmpty) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Reply sent')),
                          );
                          _composer.clear();
                          FocusScope.of(context).unfocus();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentRow {
  _CommentRow({
    required this.id,
    required this.authorName,
    required this.authorRole,
    required this.timeAgo,
    required this.comment,
    required this.avatarUrl,
    required this.isInstructor,
    required this.indentLevel,
  });

  final String id;
  final String authorName;
  final String authorRole;
  final String timeAgo;
  final String comment;
  final String avatarUrl;
  final bool isInstructor;
  final int indentLevel;
}
