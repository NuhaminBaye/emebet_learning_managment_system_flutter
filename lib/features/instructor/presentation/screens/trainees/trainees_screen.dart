// // import 'package:flutter/material.dart';
// // import 'package:lms_mobileapp/core/constants/colors.dart';
// // import 'package:lms_mobileapp/core/constants/spacing.dart';
// // import 'package:lms_mobileapp/core/constants/text_theme.dart';

// // class TraineesScreen extends StatelessWidget {
// //   const TraineesScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.background,
// //       appBar: AppBar(
// //         backgroundColor: AppColors.background,
// //         elevation: 0,
// //         title: const Text("The Digital Atelier", style: AppTextTheme.headingMD),
// //         actions: [
// //           IconButton(icon: const Icon(Icons.search), onPressed: () {}),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text("Student Roster", style: AppTextTheme.headingLG),
// //             const Text(
// //               "Monitor individual student engagement and curriculum progress across the Digital Architecture cohort.",
// //               style: AppTextTheme.bodyRegular,
// //             ),

// //             AppSpacing.verticalLg,

// //             // Stats Row
// //             Row(
// //               children: [
// //                 Expanded(child: _buildStatCard("TOTAL ENROLLED", "128", "+12% this month")),
// //                 AppSpacing.horizontalMd,
// //                 Expanded(child: _buildStatCard("AVG. PROGRESSION", "64%", "")),
// //               ],
// //             ),

// //             AppSpacing.verticalMd,

// //             _buildStatCard("ACTIVE TODAY", "42", "", showAvatars: true),

// //             AppSpacing.verticalLg,

// //             // Filters
// //             Row(
// //               children: [
// //                 Expanded(child: _buildFilterChip("All Students", true)),
// //                 AppSpacing.horizontalSm,
// //                 Expanded(child: _buildFilterChip("Active", false)),
// //                 AppSpacing.horizontalSm,
// //                 Expanded(child: _buildFilterChip("Completed", false)),
// //               ],
// //             ),

// //             AppSpacing.verticalMd,

// //             // Sort
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 const Text("Sort by: Last Active", style: AppTextTheme.bodyMedium),
// //                 const Icon(Icons.arrow_drop_down),
// //               ],
// //             ),

// //             AppSpacing.verticalLg,

// //             // Students List
// //             _buildStudentCard(
// //               name: "Elena Smith",
// //               email: "elena.s@atelier.edu",
// //               progress: 82,
// //               module: "ADVANCED MODULE",
// //               avatarColor: Colors.pink,
// //             ),
// //             _buildStudentCard(
// //               name: "Marcus Liao",
// //               email: "marcus.l@atelier.edu",
// //               progress: 45,
// //               module: "FOUNDATION",
// //               avatarColor: Colors.blue,
// //             ),
// //             _buildStudentCard(
// //               name: "Sarah Rodriguez",
// //               email: "sarah.r@atelier.edu",
// //               progress: 17,
// //               module: "INTRODUCTION",
// //               avatarColor: Colors.purple,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildStatCard(String title, String value, String subtitle, {bool showAvatars = false}) {
// //     return Container(
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: AppColors.surface,
// //         borderRadius: BorderRadius.circular(20),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(title, style: AppTextTheme.bodySmall),
// //           AppSpacing.verticalSm,
// //           Text(value, style: AppTextTheme.headingLG),
// //           if (subtitle.isNotEmpty) Text(subtitle, style: AppTextTheme.bodySmall),
// //           if (showAvatars)
// //             const Padding(
// //               padding: EdgeInsets.only(top: 8),
// //               child: Row(
// //                 children: [
// //                   CircleAvatar(radius: 12, backgroundColor: Colors.pink),
// //                   CircleAvatar(radius: 12, backgroundColor: Colors.blue),
// //                   CircleAvatar(radius: 12, backgroundColor: Colors.purple),
// //                 ],
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildFilterChip(String label, bool selected) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(vertical: 10),
// //       decoration: BoxDecoration(
// //         color: selected ? AppColors.primary : AppColors.surface,
// //         borderRadius: BorderRadius.circular(30),
// //       ),
// //       child: Center(
// //         child: Text(
// //           label,
// //           style: TextStyle(
// //             color: selected ? Colors.white : AppColors.textPrimary,
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildStudentCard({
// //     required String name,
// //     required String email,
// //     required int progress,
// //     required String module,
// //     required Color avatarColor,
// //   }) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 12),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: AppColors.surface,
// //         borderRadius: BorderRadius.circular(20),
// //       ),
// //       child: Row(
// //         children: [
// //           CircleAvatar(
// //             radius: 28,
// //             backgroundColor: avatarColor,
// //             child: Text(name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
// //           ),
// //           AppSpacing.horizontalMd,
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(name, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
// //                 Text(email, style: AppTextTheme.bodySmall),
// //                 AppSpacing.verticalSm,
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: LinearProgressIndicator(
// //                         value: progress / 100,
// //                         backgroundColor: AppColors.grey100,
// //                         color: progress > 70 ? Colors.green : Colors.orange,
// //                         minHeight: 6,
// //                       ),
// //                     ),
// //                     AppSpacing.horizontalSm,
// //                     Text("$progress%", style: AppTextTheme.bodySmall),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Column(
// //             crossAxisAlignment: CrossAxisAlignment.end,
// //             children: [
// //               Text(module, style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary)),
// //               AppSpacing.verticalSm,
// //               if (progress < 30)
// //                 Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //                   decoration: BoxDecoration(
// //                     color: Colors.red.withOpacity(0.1),
// //                     borderRadius: BorderRadius.circular(12),
// //                   ),
// //                   child: const Text("NEEDS HELP", style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
// //                 ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';

// class TraineesScreen extends StatelessWidget {
//   const TraineesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         title: const Text("The Digital Atelier", style: AppTextTheme.headingMD),
//         actions: [
//           IconButton(icon: const Icon(Icons.search), onPressed: () {}),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Student Roster", style: AppTextTheme.headingLG),
//             const Text(
//               "Monitor individual student engagement and curriculum progress across the Digital Architecture cohort.",
//               style: AppTextTheme.bodyRegular,
//             ),

//             AppSpacing.verticalLg,

//             // Stats Cards
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildStatCard(
//                     title: "TOTAL ENROLLED",
//                     value: "128",
//                     subtitle: "+12% this month",
//                   ),
//                 ),
//                 AppSpacing.horizontalMd,
//                 Expanded(
//                   child: _buildStatCard(
//                     title: "AVG. PROGRESSION",
//                     value: "64%",
//                     subtitle: "",
//                   ),
//                 ),
//               ],
//             ),

//             AppSpacing.verticalMd,

//             _buildStatCard(
//               title: "ACTIVE TODAY",
//               value: "42",
//               subtitle: "",
//               showAvatars: true,
//             ),

//             AppSpacing.verticalLg,

//             // Filters
//             Row(
//               children: [
//                 Expanded(child: _buildFilterChip("All Students", true)),
//                 AppSpacing.horizontalSm,
//                 Expanded(child: _buildFilterChip("Active", false)),
//                 AppSpacing.horizontalSm,
//                 Expanded(child: _buildFilterChip("Completed", false)),
//               ],
//             ),

//             AppSpacing.verticalMd,

//             // Sort
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text("Sort by: Last Active", style: AppTextTheme.bodyMedium),
//                 const Icon(Icons.arrow_drop_down),
//               ],
//             ),

//             AppSpacing.verticalLg,

//             // Students
//             _buildStudentCard(
//               name: "Elena Smith",
//               email: "elena.s@atelier.edu",
//               progress: 82,
//               module: "ADVANCED MODULE",
//               avatarColor: Colors.pink,
//             ),
//             _buildStudentCard(
//               name: "Marcus Liao",
//               email: "marcus.l@atelier.edu",
//               progress: 45,
//               module: "FOUNDATION",
//               avatarColor: Colors.blue,
//             ),
//             _buildStudentCard(
//               name: "Sarah Rodriguez",
//               email: "sarah.r@atelier.edu",
//               progress: 17,
//               module: "INTRODUCTION",
//               avatarColor: Colors.purple,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatCard(String title, String value, String subtitle, {bool showAvatars = false}) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: AppTextTheme.bodySmall),
//           AppSpacing.verticalSm,
//           Text(value, style: AppTextTheme.headingLG),
//           if (subtitle.isNotEmpty) Text(subtitle, style: AppTextTheme.bodySmall),
//           if (showAvatars)
//             const Padding(
//               padding: EdgeInsets.only(top: 8),
//               child: Row(
//                 children: [
//                   CircleAvatar(radius: 12, backgroundColor: Colors.pink),
//                   CircleAvatar(radius: 12, backgroundColor: Colors.blue),
//                   CircleAvatar(radius: 12, backgroundColor: Colors.purple),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFilterChip(String label, bool selected) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//         color: selected ? const Color(0xFF22C55E) : AppColors.surface,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Center(
//         child: Text(
//           label,
//           style: TextStyle(
//             color: selected ? Colors.white : AppColors.textPrimary,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildStudentCard({
//     required String name,
//     required String email,
//     required int progress,
//     required String module,
//     required Color avatarColor,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 28,
//             backgroundColor: avatarColor,
//             child: Text(name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           ),
//           AppSpacing.horizontalMd,
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(name, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
//                 Text(email, style: AppTextTheme.bodySmall),
//                 AppSpacing.verticalSm,
//                 Row(
//                   children: [
//                     Expanded(
//                       child: LinearProgressIndicator(
//                         value: progress / 100,
//                         backgroundColor: AppColors.grey100,
//                         color: progress > 70 ? const Color(0xFF22C55E) : Colors.orange,
//                         minHeight: 8,
//                       ),
//                     ),
//                     AppSpacing.horizontalSm,
//                     Text("$progress%", style: AppTextTheme.bodySmall),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(module, style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary)),
//               AppSpacing.verticalSm,
//               if (progress < 30)
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.red.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Text("NEEDS HELP", style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class TraineesScreen extends StatelessWidget {
  const TraineesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("The Digital Atelier", style: AppTextTheme.headingMD),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Student Roster", style: AppTextTheme.headingLG),
            const Text(
              "Monitor individual student engagement and curriculum progress across the Digital Architecture cohort.",
              style: AppTextTheme.bodyRegular,
            ),

            AppSpacing.verticalLg,

            // Stats Row
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: "TOTAL ENROLLED",
                    value: "128",
                    subtitle: "+12% this month",
                  ),
                ),
                AppSpacing.horizontalMd,
                Expanded(
                  child: _buildStatCard(
                    title: "AVG. PROGRESSION",
                    value: "64%",
                    subtitle: "",
                  ),
                ),
              ],
            ),

            AppSpacing.verticalMd,

            _buildStatCard(
              title: "ACTIVE TODAY",
              value: "42",
              subtitle: "",
              showAvatars: true,
            ),

            AppSpacing.verticalLg,

            // Filters
            Row(
              children: [
                Expanded(child: _buildFilterChip("All Students", true)),
                AppSpacing.horizontalSm,
                Expanded(child: _buildFilterChip("Active", false)),
                AppSpacing.horizontalSm,
                Expanded(child: _buildFilterChip("Completed", false)),
              ],
            ),

            AppSpacing.verticalMd,

            // Sort
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sort by: Last Active", style: AppTextTheme.bodyMedium),
                const Icon(Icons.arrow_drop_down),
              ],
            ),

            AppSpacing.verticalLg,

            // Students List
            _buildStudentCard(
              name: "Elena Smith",
              email: "elena.s@atelier.edu",
              progress: 82,
              module: "ADVANCED MODULE",
              avatarColor: Colors.pink,
            ),
            _buildStudentCard(
              name: "Marcus Liao",
              email: "marcus.l@atelier.edu",
              progress: 45,
              module: "FOUNDATION",
              avatarColor: Colors.blue,
            ),
            _buildStudentCard(
              name: "Sarah Rodriguez",
              email: "sarah.r@atelier.edu",
              progress: 17,
              module: "INTRODUCTION",
              avatarColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    bool showAvatars = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextTheme.bodySmall),
          AppSpacing.verticalSm,
          Text(value, style: AppTextTheme.headingLG),
          if (subtitle.isNotEmpty) Text(subtitle, style: AppTextTheme.bodySmall),
          if (showAvatars)
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  CircleAvatar(radius: 12, backgroundColor: Colors.pink),
                  CircleAvatar(radius: 12, backgroundColor: Colors.blue),
                  CircleAvatar(radius: 12, backgroundColor: Colors.purple),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF22C55E) : AppColors.surface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildStudentCard({
    required String name,
    required String email,
    required int progress,
    required String module,
    required Color avatarColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: avatarColor,
            child: Text(name[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          AppSpacing.horizontalMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                Text(email, style: AppTextTheme.bodySmall),
                AppSpacing.verticalSm,
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress / 100,
                        backgroundColor: AppColors.grey100,
                        color: progress > 70 ? const Color(0xFF22C55E) : Colors.orange,
                        minHeight: 8,
                      ),
                    ),
                    AppSpacing.horizontalSm,
                    Text("$progress%", style: AppTextTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(module, style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary)),
              AppSpacing.verticalSm,
              if (progress < 30)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("NEEDS HELP", style: TextStyle(color: Colors.red, fontSize: 10, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}