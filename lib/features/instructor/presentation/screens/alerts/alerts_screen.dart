import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/instructor_chrome_app_bar.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstructorDesign.canvas,
      appBar: const InstructorChromeAppBar(
        showBackWhenCanPop: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        children: [
          const Text(
            'Alerts',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: InstructorDesign.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Stay ahead of submissions, messages, and platform signals.',
            style: TextStyle(
              fontSize: 13,
              height: 1.4,
              color: InstructorDesign.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          _sectionLabel('TODAY'),
          const SizedBox(height: 10),
          _AlertRow(
            icon: Icons.assignment_outlined,
            title: 'New Submission',
            subtitle:
                'Elena Smith submitted Project 01 for the UI Design Fundamentals course.',
            time: '2m ago',
          ),
          _AlertRow(
            icon: Icons.chat_bubble_outline,
            title: 'Student Message',
            subtitle:
                'David Chen sent a message about Module 2: Color Theory application.',
            time: '1h ago',
          ),
          _AlertRow(
            icon: Icons.school_outlined,
            title: 'Enrollment Alert',
            subtitle:
                'Marcus Thorne just enrolled in your Advanced Prototyping masterclass.',
            time: '4h ago',
          ),
          const SizedBox(height: 22),
          _sectionLabel('YESTERDAY'),
          const SizedBox(height: 10),
          _AlertRow(
            icon: Icons.publish_outlined,
            title: 'Course Published',
            subtitle:
                'Your course "Typography for Web" is now live and available to all students.',
            time: '1d ago',
          ),
          _AlertRow(
            icon: Icons.star_outline_rounded,
            title: 'New Review',
            subtitle:
                'Sarah Jenkins left a 5-star review on your latest workshop session.',
            time: '1d ago',
          ),
          _AlertRow(
            icon: Icons.warning_amber_rounded,
            title: 'Payment Issue',
            subtitle:
                'We were unable to process your monthly revenue payout. Please update your bank details.',
            time: '1d ago',
          ),
        ],
      ),
    );
  }

  static Widget _sectionLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.1,
        color: InstructorDesign.textTertiary,
      ),
    );
  }
}

class _AlertRow extends StatelessWidget {
  const _AlertRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: InstructorDesign.surface,
          borderRadius: BorderRadius.circular(18),
          boxShadow: InstructorDesign.cardShadow(context),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: InstructorDesign.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: InstructorDesign.primary, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: InstructorDesign.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      color: InstructorDesign.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: InstructorDesign.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.circle, size: 8, color: InstructorDesign.primary),
          ],
        ),
      ),
    );
  }
}
