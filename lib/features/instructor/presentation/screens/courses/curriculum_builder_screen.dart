// import 'package:flutter/material.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';

// class CurriculumBuilderScreen extends StatelessWidget {
//   const CurriculumBuilderScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         title: const Text("Curriculum Builder", style: AppTextTheme.headingMD),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Sustainable Design Principles 101", style: AppTextTheme.headingLG),
//             AppSpacing.verticalSm,
//             const Text("8 LESSONS LISTED", style: AppTextTheme.bodySmall),

//             AppSpacing.verticalMd,

//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.add),
//               label: const Text("Add Lesson"),
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//             ),

//             AppSpacing.verticalLg,

//             _buildLessonItem("Introduction to Minimalism", "VIDEO", "12:45", "12 Comments"),
//             _buildLessonItem("Color Theory & Emotion", "QUIZ", "15:00", "5 Comments"),
//             _buildLessonItem("Typography Essentials", "READING", "20:00", "0 Comments", isDraft: true),
//             _buildLessonItem("Asymmetrical Layouts", "VIDEO", "18:10", "8 Comments"),
//             _buildLessonItem("Organic Grid Systems", "PROJECT", "45:00", "3 Comments"),

//             AppSpacing.verticalLg,

//             // Course Insights
//             const Text("Course Insights", style: AppTextTheme.headingMD),
//             AppSpacing.verticalMd,
//             Row(
//               children: [
//                 _buildInsightCard("4.2h", "TOTAL LENGTH"),
//                 AppSpacing.horizontalMd,
//                 _buildInsightCard("124", "ACTIVE STUDENTS"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLessonItem(String title, String type, String duration, String comments, {bool isDraft = false}) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: type == "VIDEO" ? Colors.blue[50] : type == "QUIZ" ? Colors.orange[50] : Colors.purple[50],
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Text(type, style: TextStyle(color: type == "VIDEO" ? Colors.blue : type == "QUIZ" ? Colors.orange : Colors.purple, fontSize: 12, fontWeight: FontWeight.w600)),
//           ),
//           AppSpacing.horizontalMd,
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
//                 Text("$duration • $comments", style: AppTextTheme.bodySmall),
//               ],
//             ),
//           ),
//           if (isDraft)
//             const Text("DRAFT", style: TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold)),
//           const Icon(Icons.more_vert),
//         ],
//       ),
//     );
//   }

//   Widget _buildInsightCard(String value, String label) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: AppColors.surface,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           children: [
//             Text(value, style: AppTextTheme.headingLG),
//             Text(label, style: AppTextTheme.bodySmall, textAlign: TextAlign.center),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class CurriculumBuilderScreen extends StatelessWidget {
  const CurriculumBuilderScreen({super.key});

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
        title: const Text("Curriculum Builder", style: AppTextTheme.headingMD),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sustainable Design Principles 101",
              style: AppTextTheme.headingLG,
            ),
            AppSpacing.verticalSm,
            const Text(
              "8 LESSONS LISTED",
              style: AppTextTheme.bodySmall,
            ),

            AppSpacing.verticalMd,

            // Add Lesson Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.addLesson);
                },
                icon: const Icon(Icons.add, size: 20),
                label: const Text("Add Lesson"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),

            AppSpacing.verticalLg,

            // Lesson Items
            _buildLessonItem(
              title: "Introduction to Minimalism",
              type: "VIDEO",
              duration: "12:45",
              comments: "12",
            ),
            _buildLessonItem(
              title: "Color Theory & Emotion",
              type: "QUIZ",
              duration: "15:00",
              comments: "5",
            ),
            _buildLessonItem(
              title: "Typography Essentials",
              type: "READING",
              duration: "20:00",
              comments: "0",
              isDraft: true,
            ),
            _buildLessonItem(
              title: "Asymmetrical Layouts",
              type: "VIDEO",
              duration: "18:10",
              comments: "8",
            ),
            _buildLessonItem(
              title: "Organic Grid Systems",
              type: "PROJECT",
              duration: "45:00",
              comments: "3",
            ),

            AppSpacing.verticalXl,

            // Course Insights
            const Text("Course Insights", style: AppTextTheme.headingMD),
            AppSpacing.verticalMd,

            Row(
              children: [
                _buildInsightCard("4.2h", "TOTAL LENGTH"),
                AppSpacing.horizontalMd,
                _buildInsightCard("124", "ACTIVE STUDENTS"),
              ],
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonItem({
    required String title,
    required String type,
    required String duration,
    required String comments,
    bool isDraft = false,
  }) {
    Color badgeColor = Colors.blue;
    if (type == "QUIZ") badgeColor = Colors.orange;
    if (type == "READING") badgeColor = Colors.purple;
    if (type == "PROJECT") badgeColor = Colors.teal;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Type Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              type,
              style: TextStyle(
                color: badgeColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          AppSpacing.horizontalMd,

          // Title and Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
                ),
                AppSpacing.verticalXs,
                Text(
                  "$duration • $comments Comments",
                  style: AppTextTheme.bodySmall,
                ),
              ],
            ),
          ),

          // Draft Tag
          if (isDraft)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "DRAFT",
                style: TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),

          const Icon(Icons.more_vert, size: 20),
        ],
      ),
    );
  }

  Widget _buildInsightCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(value, style: AppTextTheme.headingLG),
            Text(label, style: AppTextTheme.bodySmall, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}