// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_bloc.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_event.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_state.dart';

// class GradeAnalyticsScreen extends StatelessWidget {
//   const GradeAnalyticsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => GradeAnalyticsBloc()..add(LoadGradeAnalytics()),
//       child: const _GradeAnalyticsView(),
//     );
//   }
// }

// class _GradeAnalyticsView extends StatelessWidget {
//   const _GradeAnalyticsView();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GradeAnalyticsBloc, GradeAnalyticsState>(
//       builder: (context, state) {
//         if (state is GradeAnalyticsLoading) {
//           return const Scaffold(body: Center(child: CircularProgressIndicator()));
//         }

//         if (state is GradeAnalyticsLoaded) {
//           final data = state.data;

//           return Scaffold(
//             backgroundColor: AppColors.background,
//             appBar: AppBar(
//               backgroundColor: AppColors.background,
//               elevation: 0,
//               title: const Text("Your Academic Performance", style: AppTextTheme.headingMD),
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//             body: SingleChildScrollView(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Stats Row
//                   Row(
//                     children: [
//                       _buildStatCard("3.8", "GPA", "OVERALL SCORE"),
//                       AppSpacing.horizontalMd,
//                       _buildStatCard("45", "Credits", "COMPLETED"),
//                     ],
//                   ),

//                   AppSpacing.verticalLg,

//                   // Progress Over Time
//                   const Text("Progress Over Time", style: AppTextTheme.headingMD),
//                   AppSpacing.verticalSm,
//                   Container(
//                     height: 200,
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: AppColors.surface,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Center(
//                       child: Text("📈 Line Chart Placeholder\n(Progress Over Time)", textAlign: TextAlign.center),
//                     ),
//                   ),

//                   AppSpacing.verticalLg,

//                   // Component Breakdown
//                   const Text("Component Breakdown", style: AppTextTheme.headingMD),
//                   AppSpacing.verticalSm,
//                   _buildProgressRow("Assignments", "12%", 0.12),
//                   _buildProgressRow("Quizzes", "85%", 0.85),
//                   _buildProgressRow("Final Exam", "June 15", 0.0),

//                   AppSpacing.verticalLg,

//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primary,
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                       ),
//                       child: const Text("View Detailed Feedback →"),
//                     ),
//                   ),

//                   AppSpacing.verticalLg,

//                   // Certificates
//                   const Text("Your Certificates", style: AppTextTheme.headingMD),
//                   AppSpacing.verticalMd,
//                   _buildCertificateCard("UI Design Specialist", "Lumora Academy"),
//                   _buildCertificateCard("Data Science Pro", "Lumora Academy"),

//                   AppSpacing.verticalLg,

//                   // Personal Feedback
//                   const Text("Personal Feedback", style: AppTextTheme.headingMD),
//                   AppSpacing.verticalSm,
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: AppColors.surface,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           '"Your latest submission on modular structures shows a profound understanding of spatial economy..."',
//                           style: AppTextTheme.bodyRegular,
//                         ),
//                         AppSpacing.verticalMd,
//                         const Row(
//                           children: [
//                             CircleAvatar(radius: 16),
//                             AppSpacing.horizontalSm,
//                             Text("Elena Drasov\nInstructor • June 10"),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }

//         return const Scaffold(body: Center(child: Text("Error loading analytics")));
//       },
//     );
//   }

//   Widget _buildStatCard(String value, String label, String sublabel) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: AppColors.surface,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             Text(value, style: AppTextTheme.headingLG),
//             Text(label, style: AppTextTheme.bodyMedium),
//             Text(sublabel, style: AppTextTheme.bodySmall),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProgressRow(String label, String percentage, double value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(label),
//               Text(percentage),
//             ],
//           ),
//           AppSpacing.verticalSm,
//           LinearProgressIndicator(value: value, backgroundColor: AppColors.grey100, color: Colors.green),
//         ],
//       ),
//     );
//   }

//   Widget _buildCertificateCard(String title, String academy) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: const Icon(Icons.verified, color: Colors.green, size: 32),
//         title: Text(title),
//         subtitle: Text(academy),
//         trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/grade_analaytics_state.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/certeficate_screen.dart';

class GradeAnalyticsScreen extends StatelessWidget {
  const GradeAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GradeAnalyticsBloc()..add(LoadGradeAnalytics()),
      child: const _GradeAnalyticsView(),
    );
  }
}

class _GradeAnalyticsView extends StatelessWidget {
  const _GradeAnalyticsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GradeAnalyticsBloc, GradeAnalyticsState>(
      builder: (context, state) {
        if (state is GradeAnalyticsLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (state is GradeAnalyticsLoaded) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              backgroundColor: AppColors.background,
              elevation: 0,
              title: const Text("Your Academic Performance", style: AppTextTheme.headingMD),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats Row
                  Row(
                    children: [
                      _buildStatCard("3.8", "GPA", "OVERALL SCORE"),
                      AppSpacing.horizontalMd,
                      _buildStatCard("45", "Credits", "COMPLETED"),
                    ],
                  ),

                  AppSpacing.verticalLg,

                  // Progress Over Time
                  const Text("Progress Over Time", style: AppTextTheme.headingMD),
                  AppSpacing.verticalSm,
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text("📈 Line Chart Placeholder")),
                  ),

                  AppSpacing.verticalLg,

                  const Text("Component Breakdown", style: AppTextTheme.headingMD),
                  AppSpacing.verticalSm,
                  _buildProgressRow("Assignments", "12%", 0.12),
                  _buildProgressRow("Quizzes", "85%", 0.85),
                  _buildProgressRow("Final Exam", "June 15", 0.0),

                  AppSpacing.verticalLg,

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text("View Detailed Feedback →"),
                    ),
                  ),

                  AppSpacing.verticalLg,

                  // Certificates Section
                  const Text("Your Certificates", style: AppTextTheme.headingMD),
                  AppSpacing.verticalMd,

                  _buildCertificateCard(
                    context,
                    "UI Design Specialist",
                    "Lumora Academy",
                  ),
                  _buildCertificateCard(
                    context,
                    "Data Science Pro",
                    "Lumora Academy",
                  ),

                  AppSpacing.verticalLg,

                  // Personal Feedback
                  const Text("Personal Feedback", style: AppTextTheme.headingMD),
                  AppSpacing.verticalSm,
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '"Your latest submission on modular structures shows a profound understanding of spatial economy..."',
                          style: AppTextTheme.bodyRegular,
                        ),
                        AppSpacing.verticalMd,
                        const Row(
                          children: [
                            CircleAvatar(radius: 16),
                            AppSpacing.horizontalSm,
                            Text("Elena Drasov\nInstructor • June 10"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Scaffold(body: Center(child: Text("Error loading analytics")));
      },
    );
  }

  Widget _buildStatCard(String value, String label, String sublabel) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(value, style: AppTextTheme.headingLG),
            Text(label, style: AppTextTheme.bodyMedium),
            Text(sublabel, style: AppTextTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressRow(String label, String percentage, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(label), Text(percentage)],
          ),
          AppSpacing.verticalSm,
          LinearProgressIndicator(value: value, backgroundColor: AppColors.grey100, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildCertificateCard(BuildContext context, String title, String academy) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CertificateScreen()),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: const Icon(Icons.verified, color: Colors.green, size: 32),
          title: Text(title),
          subtitle: Text(academy),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        ),
      ),
    );
  }
}