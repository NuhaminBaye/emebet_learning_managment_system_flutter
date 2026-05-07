// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:lms_mobileapp/core/constants/colors.dart';
// // import 'package:lms_mobileapp/core/constants/spacing.dart';
// // import 'package:lms_mobileapp/core/constants/text_theme.dart';
// // import 'package:lms_mobileapp/features/Trainee/domain/entities/lesson.dart';
// // import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_bloc.dart';
// // import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_event.dart';
// // import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_state.dart';

// // class LessonDetailScreen extends StatelessWidget {
// //   const LessonDetailScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) => LessonDetailBloc()..add(LoadLessonDetail()),
// //       child: const _LessonDetailView(),
// //     );
// //   }
// // }

// // class _LessonDetailView extends StatefulWidget {
// //   const _LessonDetailView();

// //   @override
// //   State<_LessonDetailView> createState() => _LessonDetailViewState();
// // }

// // class _LessonDetailViewState extends State<_LessonDetailView> with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 3, vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<LessonDetailBloc, LessonDetailState>(
// //       builder: (context, state) {
// //         if (state is LessonDetailLoading) {
// //           return const Scaffold(body: Center(child: CircularProgressIndicator()));
// //         }

// //         if (state is LessonDetailError) {
// //           return Scaffold(body: Center(child: Text(state.message)));
// //         }

// //         final lesson = (state as LessonDetailLoaded).lesson;

// //         return Scaffold(
// //           body: NestedScrollView(
// //             headerSliverBuilder: (context, innerBoxIsScrolled) => [
// //               SliverAppBar(
// //                 expandedHeight: 220,
// //                 pinned: true,
// //                 flexibleSpace: FlexibleSpaceBar(
// //                   background: Image.network(lesson.thumbnailUrl, fit: BoxFit.cover),
// //                 ),
// //                 leading: IconButton(
// //                   icon: const Icon(Icons.arrow_back),
// //                   onPressed: () => Navigator.pop(context),
// //                 ),
// //                 title: Text(lesson.moduleName, style: const TextStyle(fontSize: 16)),
// //               ),
// //             ],
// //             body: Column(
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(16),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(lesson.title, style: AppTextTheme.headingLG),
// //                       AppSpacing.verticalMd,
// //                       ElevatedButton(
// //                         onPressed: () {},
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: Colors.green,
// //                           minimumSize: const Size.fromHeight(50),
// //                         ),
// //                         child: const Text("Mark as Complete"),
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 TabBar(
// //                   controller: _tabController,
// //                   labelColor: AppColors.primary,
// //                   unselectedLabelColor: AppColors.textSecondary,
// //                   indicatorColor: AppColors.primary,
// //                   tabs: const [
// //                     Tab(text: "Content"),
// //                     Tab(text: "Resources"),
// //                     Tab(text: "Discussion"),
// //                   ],
// //                 ),

// //                 Expanded(
// //                   child: TabBarView(
// //                     controller: _tabController,
// //                     children: [
// //                       _ContentTab(lesson: lesson),
// //                       const _ResourcesTab(),
// //                       const _DiscussionTab(),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // // ====================== TABS ======================

// // class _ContentTab extends StatelessWidget {
// //   final Lesson lesson;
// //   const _ContentTab({required this.lesson});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       padding: const EdgeInsets.all(16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text("Key Learning Objectives", style: AppTextTheme.headingMD),
// //           AppSpacing.verticalSm,
// //           ...lesson.objectives.map((obj) => Padding(
// //                 padding: const EdgeInsets.only(bottom: 12),
// //                 child: Row(
// //                   children: [
// //                     const Icon(Icons.check_circle, color: Colors.green),
// //                     AppSpacing.horizontalSm,
// //                     Expanded(child: Text(obj)),
// //                   ],
// //                 ),
// //               )),

// //           AppSpacing.verticalLg,
// //           const Text("In this foundational lesson...", style: AppTextTheme.bodyRegular),
// //           AppSpacing.verticalLg,

// //           // Assignments & Quiz
// //           _buildActionCard("Assignments", "3 Assignments"),
// //           _buildActionCard("Take Quiz", "Final Quiz"),
// //           _buildActionCard("Grade Analytics", "View Performance"),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildActionCard(String title, String subtitle) {
// //     return Card(
// //       margin: const EdgeInsets.only(bottom: 12),
// //       child: ListTile(
// //         leading: const Icon(Icons.assignment_outlined, color: Colors.green),
// //         title: Text(title),
// //         subtitle: Text(subtitle),
// //         trailing: const Icon(Icons.arrow_forward_ios, size: 18),
// //       ),
// //     );
// //   }
// // }

// // class _ResourcesTab extends StatelessWidget {
// //   const _ResourcesTab();

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView(
// //       padding: const EdgeInsets.all(16),
// //       children: const [
// //         ListTile(leading: Icon(Icons.file_present), title: Text("Worksheet.docx"), trailing: Icon(Icons.download)),
// //         ListTile(leading: Icon(Icons.picture_as_pdf), title: Text("Sustainability Framework.pdf"), trailing: Icon(Icons.download)),
// //       ],
// //     );
// //   }
// // }

// // class _DiscussionTab extends StatelessWidget {
// //   const _DiscussionTab();

// //   @override
// //   Widget build(BuildContext context) {
// //     return const Center(child: Text("Discussion Tab\n(Coming Soon)"));
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';
// import 'package:lms_mobileapp/features/Trainee/domain/entities/lesson.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_bloc.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_event.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_state.dart';


// class LessonDetailScreen extends StatelessWidget {
//   const LessonDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LessonDetailBloc()..add(LoadLessonDetail()),
//       child: const _LessonDetailView(),
//     );
//   }
// }

// class _LessonDetailView extends StatefulWidget {
//   const _LessonDetailView();

//   @override
//   State<_LessonDetailView> createState() => _LessonDetailViewState();
// }

// class _LessonDetailViewState extends State<_LessonDetailView> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LessonDetailBloc, LessonDetailState>(
//       builder: (context, state) {
//         // Handle all states properly
//         if (state is LessonDetailLoading || state is LessonDetailInitial) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         if (state is LessonDetailError) {
//           return Scaffold(
//             body: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Text(state.message, textAlign: TextAlign.center),
//               ),
//             ),
//           );
//         }

//         if (state is LessonDetailLoaded) {
//           final lesson = state.lesson;

//           return Scaffold(
//             body: NestedScrollView(
//               headerSliverBuilder: (context, innerBoxIsScrolled) => [
//                 SliverAppBar(
//                   expandedHeight: 220,
//                   pinned: true,
//                   flexibleSpace: FlexibleSpaceBar(
//                     background: Image.network(lesson.thumbnailUrl, fit: BoxFit.cover),
//                   ),
//                   leading: IconButton(
//                     icon: const Icon(Icons.arrow_back),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   title: Text(lesson.moduleName, style: const TextStyle(fontSize: 16)),
//                 ),
//               ],
//               body: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(lesson.title, style: AppTextTheme.headingLG),
//                         AppSpacing.verticalMd,
//                         ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                             minimumSize: const Size.fromHeight(50),
//                           ),
//                           child: const Text("Mark as Complete"),
//                         ),
//                       ],
//                     ),
//                   ),

//                   TabBar(
//                     controller: _tabController,
//                     labelColor: AppColors.primary,
//                     unselectedLabelColor: AppColors.textSecondary,
//                     indicatorColor: AppColors.primary,
//                     tabs: const [
//                       Tab(text: "Content"),
//                       Tab(text: "Resources"),
//                       Tab(text: "Discussion"),
//                     ],
//                   ),

//                   Expanded(
//                     child: TabBarView(
//                       controller: _tabController,
//                       children: [
//                         _ContentTab(lesson: lesson),
//                         const _ResourcesTab(),
//                         const _DiscussionTab(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }

//         return const Scaffold(body: Center(child: Text("Unknown State")));
//       },
//     );
//   }
// }

// // ====================== TABS ======================

// class _ContentTab extends StatelessWidget {
//   final Lesson lesson;
//   const _ContentTab({required this.lesson});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Key Learning Objectives", style: AppTextTheme.headingMD),
//           AppSpacing.verticalSm,
//           ...lesson.objectives.map((obj) => Padding(
//                 padding: const EdgeInsets.only(bottom: 12),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.check_circle, color: Colors.green),
//                     AppSpacing.horizontalSm,
//                     Expanded(child: Text(obj)),
//                   ],
//                 ),
//               )),

//           AppSpacing.verticalLg,
//           const Text("In this foundational lesson...", style: AppTextTheme.bodyRegular),
//           AppSpacing.verticalLg,

//           _buildActionCard("Assignments", "3 Assignments"),
//           _buildActionCard("Take Quiz", "Final Quiz"),
//           _buildActionCard("Grade Analytics", "View Performance"),
//         ],
//       ),
//     );
//   }

//   Widget _buildActionCard(String title, String subtitle) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: const Icon(Icons.assignment_outlined, color: Colors.green),
//         title: Text(title),
//         subtitle: Text(subtitle),
//         trailing: const Icon(Icons.arrow_forward_ios, size: 18),
//       ),
//     );
//   }
// }

// class _ResourcesTab extends StatelessWidget {
//   const _ResourcesTab();

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: const [
//         ListTile(leading: Icon(Icons.file_present), title: Text("Worksheet.docx"), trailing: Icon(Icons.download)),
//         ListTile(leading: Icon(Icons.picture_as_pdf), title: Text("Sustainability Framework.pdf"), trailing: Icon(Icons.download)),
//       ],
//     );
//   }
// }

// class _DiscussionTab extends StatelessWidget {
//   const _DiscussionTab();

//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text("Discussion Tab\n(Coming Soon)"));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/lesson.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/my_courses/lesson_detail_state.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/assignment_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/grade_analaytics_screen.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/quiz_screen.dart';

class LessonDetailScreen extends StatelessWidget {
  const LessonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LessonDetailBloc()..add(LoadLessonDetail()),
      child: const _LessonDetailView(),
    );
  }
}

class _LessonDetailView extends StatefulWidget {
  const _LessonDetailView();

  @override
  State<_LessonDetailView> createState() => _LessonDetailViewState();
}

class _LessonDetailViewState extends State<_LessonDetailView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonDetailBloc, LessonDetailState>(
      builder: (context, state) {
        if (state is LessonDetailLoading || state is LessonDetailInitial) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (state is LessonDetailError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }

        final lesson = (state as LessonDetailLoaded).lesson;

        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: 220,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(lesson.thumbnailUrl, fit: BoxFit.cover),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text(lesson.moduleName, style: const TextStyle(fontSize: 16)),
              ),
            ],
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(lesson.title, style: AppTextTheme.headingLG),
                      AppSpacing.verticalMd,
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text("Mark as Complete"),
                      ),
                    ],
                  ),
                ),

                TabBar(
                  controller: _tabController,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.primary,
                  tabs: const [
                    Tab(text: "Content"),
                    Tab(text: "Resources"),
                    Tab(text: "Discussion"),
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _ContentTab(lesson: lesson),
                      const _ResourcesTab(),
                      const _DiscussionTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ====================== TABS ======================

class _ContentTab extends StatelessWidget {
  final Lesson lesson;
  const _ContentTab({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Key Learning Objectives", style: AppTextTheme.headingMD),
          AppSpacing.verticalSm,
          ...lesson.objectives.map((obj) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    AppSpacing.horizontalSm,
                    Expanded(child: Text(obj)),
                  ],
                ),
              )),

          AppSpacing.verticalLg,
          const Text("In this foundational lesson...", style: AppTextTheme.bodyRegular),
          AppSpacing.verticalLg,

          // Action Cards with Navigation
          // _buildActionCard(
          //   context,
          //   "Assignments",
          //   "3 Assignments",
          //   // () => Navigator.pushNamed(context, '/assignments'), // Change route as needed
            

          // ),
          // _buildActionCard(
          //   context,
          //   "Take Quiz",
          //   "Final Quiz",
          //   () => Navigator.pushNamed(context, '/quiz'),
          // ),

            _buildActionCard(context, "Assignments", "3 Assignments", () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AssignmentScreen()));
            }),

            _buildActionCard(context, "Take Quiz", "Final Quiz", () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
            }),
          _buildActionCard(
            context,
            "Grade Analytics",
            "View Performance",
  () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const GradeAnalyticsScreen()));
            }          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, String title, String subtitle, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: const Icon(Icons.assignment_outlined, color: Colors.green),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        ),
      ),
    );
  }
}

class _ResourcesTab extends StatelessWidget {
  const _ResourcesTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(leading: Icon(Icons.file_present), title: Text("Worksheet.docx"), trailing: Icon(Icons.download)),
        ListTile(leading: Icon(Icons.picture_as_pdf), title: Text("Sustainability Framework.pdf"), trailing: Icon(Icons.download)),
      ],
    );
  }
}

class _DiscussionTab extends StatelessWidget {
  const _DiscussionTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildComment(
          name: "Marcus Chen",
          time: "2h ago",
          message: "How should I approach the asymptotic analysis when we have nested loops with different growth rates?",
          isInstructorReply: false,
        ),
        _buildComment(
          name: "Sarah Jenkins",
          time: "1h ago",
          message: "This explanation of the Virtual DOM is the clearest I've heard yet. Especially the part about the reconciliation algorithm.",
          isInstructorReply: false,
        ),
        _buildComment(
          name: "Dr. Aris Thorne",
          time: "3h ago",
          message: "Glad it clicked, Sarah! If you want to dive deeper, check out the supplementary paper on fiber architecture in the resources tab.",
          isInstructorReply: true,
        ),
        _buildComment(
          name: "Leo Kim",
          time: "8h ago",
          message: "Does anyone have a good mental model for 'useEffect' cleanup functions? I keep forgetting.",
          isInstructorReply: false,
        ),
      ],
    );
  }

  Widget _buildComment({
    required String name,
    required String time,
    required String message,
    required bool isInstructorReply,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isInstructorReply ? Colors.orange[100] : AppColors.primaryLight,
                  child: Text(name[0]),
                ),
                AppSpacing.horizontalSm,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                        if (isInstructorReply) ...[
                          AppSpacing.horizontalSm,
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text("INSTRUCTOR", style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ],
                    ),
                    Text(time, style: AppTextTheme.bodySmall),
                  ],
                ),
              ],
            ),
            AppSpacing.verticalSm,
            Text(message, style: AppTextTheme.bodyRegular),
            AppSpacing.verticalSm,
            const Row(
              children: [
                Icon(Icons.thumb_up_outlined, size: 18),
                SizedBox(width: 8),
                Text("12"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}