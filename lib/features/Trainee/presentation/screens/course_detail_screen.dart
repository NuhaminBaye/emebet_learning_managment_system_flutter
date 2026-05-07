// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:lms_mobileapp/core/constants/colors.dart';
// // import 'package:lms_mobileapp/core/constants/spacing.dart';
// // import 'package:lms_mobileapp/core/constants/text_theme.dart';
// // import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_bloc.dart';
// // import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_event.dart';
// // import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_state.dart';


// // class CourseDetailScreen extends StatelessWidget {
// //   const CourseDetailScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) => CourseDetailBloc()..add(LoadCourseDetail()),
// //       child: const _CourseDetailView(),
// //     );
// //   }
// // }

// // class _CourseDetailView extends StatefulWidget {
// //   const _CourseDetailView();

// //   @override
// //   State<_CourseDetailView> createState() => _CourseDetailViewState();
// // }

// // class _CourseDetailViewState extends State<_CourseDetailView> with SingleTickerProviderStateMixin {
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
// //     return BlocBuilder<CourseDetailBloc, CourseDetailState>(
// //       builder: (context, state) {
// //         if (state is CourseDetailLoading || state is CourseDetailInitial) {
// //           return const Scaffold(body: Center(child: CircularProgressIndicator()));
// //         }

// //         if (state is CourseDetailError) {
// //           return Scaffold(body: Center(child: Text(state.message)));
// //         }

// //         final course = (state as CourseDetailLoaded).course;

// //         return Scaffold(
// //           body: NestedScrollView(
// //             headerSliverBuilder: (context, innerBoxIsScrolled) => [
// //               SliverAppBar(
// //                 expandedHeight: 260,
// //                 pinned: true,
// //                 flexibleSpace: FlexibleSpaceBar(
// //                   background: Image.network(course.imageUrl, fit: BoxFit.cover),
// //                 ),
// //                 leading: IconButton(
// //                   icon: const Icon(Icons.arrow_back, color: Colors.white),
// //                   onPressed: () => Navigator.pop(context),
// //                 ),
// //                 actions: [
// //                   IconButton(icon: const Icon(Icons.favorite_border, color: Colors.white), onPressed: () {}),
// //                   IconButton(icon: const Icon(Icons.share, color: Colors.white), onPressed: () {}),
// //                 ],
// //               ),
// //             ],
// //             body: Column(
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(course.title, style: AppTextTheme.headingLG),
// //                       AppSpacing.verticalSm,
// //                       Row(
// //                         children: [
// //                           const Icon(Icons.star, color: Color(0xFFFFB703), size: 20),
// //                           Text(" ${course.rating} • ${course.reviewCount} reviews", style: AppTextTheme.bodyMedium),
// //                         ],
// //                       ),
// //                       AppSpacing.verticalSm,
// //                       Text("by ${course.instructor}", style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
// //                     ],
// //                   ),
// //                 ),

// //                 TabBar(
// //                   controller: _tabController,
// //                   labelColor: AppColors.primary,
// //                   unselectedLabelColor: AppColors.textSecondary,
// //                   indicatorColor: AppColors.primary,
// //                   tabs: const [
// //                     Tab(text: "Overview"),
// //                     Tab(text: "Lessons"),
// //                     Tab(text: "Reviews"),
// //                   ],
// //                 ),

// //                 Expanded(
// //                   child: TabBarView(
// //                     controller: _tabController,
// //                     children: [
// //                       _OverviewTab(course: course),
// //                       _LessonsTab(course: course),
// //                       _ReviewsTab(),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           bottomNavigationBar: SafeArea(
// //             child: Container(
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: AppColors.surface,
// //                 boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, -2))],
// //               ),
// //               child: ElevatedButton(
// //                 onPressed: () {},
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: const Color(0xFF22C55E),
// //                   padding: const EdgeInsets.symmetric(vertical: 16),
// //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //                 ),
// //                 child: Text("Enroll Now - ${course.price}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';
// import 'package:lms_mobileapp/features/Trainee/domain/entities/course.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_bloc.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_event.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_state.dart';

// class CourseDetailScreen extends StatelessWidget {
//   const CourseDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CourseDetailBloc()..add(LoadCourseDetail()),
//       child: const _CourseDetailView(),
//     );
//   }
// }

// class _CourseDetailView extends StatefulWidget {
//   const _CourseDetailView();

//   @override
//   State<_CourseDetailView> createState() => _CourseDetailViewState();
// }

// class _CourseDetailViewState extends State<_CourseDetailView> with SingleTickerProviderStateMixin {
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
//     return BlocBuilder<CourseDetailBloc, CourseDetailState>(
//       builder: (context, state) {
//         if (state is CourseDetailLoading || state is CourseDetailInitial) {
//           return const Scaffold(
//             body: Center(child: CircularProgressIndicator()),
//           );
//         }

//         if (state is CourseDetailError) {
//           return Scaffold(
//             body: Center(child: Text(state.message)),
//           );
//         }

//         final course = (state as CourseDetailLoaded).course;

//         return Scaffold(
//           body: NestedScrollView(
//             headerSliverBuilder: (context, innerBoxIsScrolled) => [
//               SliverAppBar(
//                 expandedHeight: 260,
//                 pinned: true,
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Image.network(course.imageUrl, fit: BoxFit.cover),
//                 ),
//                 leading: IconButton(
//                   icon: const Icon(Icons.arrow_back, color: Colors.white),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 actions: [
//                   IconButton(icon: const Icon(Icons.favorite_border, color: Colors.white), onPressed: () {}),
//                   IconButton(icon: const Icon(Icons.share, color: Colors.white), onPressed: () {}),
//                 ],
//               ),
//             ],
//             body: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(course.title, style: AppTextTheme.headingLG),
//                       AppSpacing.verticalSm,
//                       Row(
//                         children: [
//                           const Icon(Icons.star, color: Color(0xFFFFB703), size: 20),
//                           Text(" ${course.rating} • ${course.reviewCount} reviews", style: AppTextTheme.bodyMedium),
//                         ],
//                       ),
//                       AppSpacing.verticalSm,
//                       Text("by ${course.instructor}", style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
//                     ],
//                   ),
//                 ),

//                 TabBar(
//                   controller: _tabController,
//                   labelColor: AppColors.primary,
//                   unselectedLabelColor: AppColors.textSecondary,
//                   indicatorColor: AppColors.primary,
//                   tabs: const [
//                     Tab(text: "Overview"),
//                     Tab(text: "Lessons"),
//                     Tab(text: "Reviews"),
//                   ],
//                 ),

//                 Expanded(
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: [
//                       _OverviewTab(course: course),
//                       _LessonsTab(course: course),
//                       const _ReviewsTab(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: SafeArea(
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: AppColors.surface,
//                 boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, -2))],
//               ),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF22C55E),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                 ),
//                 child: Text(
//                   "Enroll Now - ${course.price}",
//                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // ==================== TABS ====================

// class _OverviewTab extends StatelessWidget {
//   final Course course;
//   const _OverviewTab({required this.course});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Course Description", style: AppTextTheme.headingMD),
//           AppSpacing.verticalSm,
//           Text(course.description, style: AppTextTheme.bodyRegular),
//           AppSpacing.verticalLg,

//           Text("What you'll learn", style: AppTextTheme.headingMD),
//           AppSpacing.verticalSm,
//           ...course.learningPoints.map((point) => Padding(
//                 padding: const EdgeInsets.only(bottom: 12),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.check_circle, color: Colors.green, size: 22),
//                     AppSpacing.horizontalSm,
//                     Expanded(child: Text(point, style: AppTextTheme.bodyRegular)),
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }

// class _LessonsTab extends StatelessWidget {
//   final Course course;
//   const _LessonsTab({required this.course});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: course.modules.length,
//       itemBuilder: (context, index) {
//         final module = course.modules[index];
//         return Card(
//           margin: const EdgeInsets.only(bottom: 12),
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: module.isLocked ? AppColors.grey100 : AppColors.primaryLight,
//               child: Icon(module.isLocked ? Icons.lock : Icons.play_circle, color: module.isLocked ? Colors.grey : AppColors.primary),
//             ),
//             title: Text(module.title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
//             subtitle: Text("${module.lessonCount} lessons • ${module.duration}"),
//             trailing: module.isLocked ? const Icon(Icons.lock) : const Icon(Icons.play_arrow),
//           ),
//         );
//       },
//     );
//   }
// }

// class _ReviewsTab extends StatelessWidget {
//   const _ReviewsTab();

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16),
//       children: [
//         const Row(
//           children: [
//             Text("4.8", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
//             SizedBox(width: 12),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(children: [Icon(Icons.star, color: Color(0xFFFFB703)), Icon(Icons.star, color: Color(0xFFFFB703)), ...]),
//                 Text("1,268 reviews"),
//               ],
//             ),
//           ],
//         ),
//         AppSpacing.verticalLg,
//         // Sample Reviews
//         _buildReview("Sarah Mitchell", "This course exceeded my expectations...", "2 days ago", 5),
//         _buildReview("Alex Rivera", "The quality of the video lectures is top-notch...", "1 week ago", 4),
//         _buildReview("Lisa Monti", "Perfect pace for someone balancing work and studies...", "2 weeks ago", 5),
//       ],
//     );
//   }

//   Widget _buildReview(String name, String comment, String time, int rating) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(backgroundColor: AppColors.primaryLight, child: Text(name[0])),
//                 AppSpacing.horizontalSm,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(name, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
//                     Text(time, style: AppTextTheme.bodySmall),
//                   ],
//                 ),
//                 const Spacer(),
//                 Row(children: List.generate(rating, (_) => const Icon(Icons.star, size: 16, color: Color(0xFFFFB703)))),
//               ],
//             ),
//             AppSpacing.verticalSm,
//             Text(comment, style: AppTextTheme.bodyRegular),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/course.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/course_deatil/course_detail_state.dart';


class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CourseDetailBloc()..add(LoadCourseDetail()),
      child: const _CourseDetailView(),
    );
  }
}

class _CourseDetailView extends StatefulWidget {
  const _CourseDetailView();

  @override
  State<_CourseDetailView> createState() => _CourseDetailViewState();
}

class _CourseDetailViewState extends State<_CourseDetailView> with SingleTickerProviderStateMixin {
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
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      builder: (context, state) {
        if (state is CourseDetailLoading || state is CourseDetailInitial) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (state is CourseDetailError) {
          return Scaffold(body: Center(child: Text(state.message)));
        }

        final course = (state as CourseDetailLoaded).course;

        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: 260,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(course.imageUrl, fit: BoxFit.cover),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(icon: const Icon(Icons.favorite_border, color: Colors.white), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.share, color: Colors.white), onPressed: () {}),
                ],
              ),
            ],
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.title, style: AppTextTheme.headingLG),
                      AppSpacing.verticalSm,
                      Row(
                        children: [
                          const Icon(Icons.star, color: Color(0xFFFFB703), size: 20),
                          Text(" ${course.rating} • ${course.reviewCount} reviews", style: AppTextTheme.bodyMedium),
                        ],
                      ),
                      AppSpacing.verticalSm,
                      Text("by ${course.instructor}", style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
                    ],
                  ),
                ),

                TabBar(
                  controller: _tabController,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.primary,
                  tabs: const [
                    Tab(text: "Overview"),
                    Tab(text: "Lessons"),
                    Tab(text: "Reviews"),
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _OverviewTab(course: course),
                      _LessonsTab(course: course),
                      const _ReviewsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, -2))],
              ),
              child: ElevatedButton(
                onPressed: () { Navigator.pushNamed(context, AppRoutes.checkOut);},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  "Enroll Now - ${course.price}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ==================== TABS ====================

class _OverviewTab extends StatelessWidget {
  final Course course;
  const _OverviewTab({required this.course});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Course Description", style: AppTextTheme.headingMD),
          AppSpacing.verticalSm,
          Text(course.description, style: AppTextTheme.bodyRegular),
          AppSpacing.verticalLg,

          Text("What you'll learn", style: AppTextTheme.headingMD),
          AppSpacing.verticalSm,
          ...course.learningPoints.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 22),
                    AppSpacing.horizontalSm,
                    Expanded(child: Text(point, style: AppTextTheme.bodyRegular)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class _LessonsTab extends StatelessWidget {
  final Course course;
  const _LessonsTab({required this.course});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: course.modules.length,
      itemBuilder: (context, index) {
        final module = course.modules[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: module.isLocked ? AppColors.grey100 : AppColors.primaryLight,
              child: Icon(
                module.isLocked ? Icons.lock : Icons.play_circle,
                color: module.isLocked ? Colors.grey : AppColors.primary,
              ),
            ),
            title: Text(module.title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
            subtitle: Text("${module.lessonCount} lessons • ${module.duration}"),
            trailing: module.isLocked ? const Icon(Icons.lock) : const Icon(Icons.play_arrow),
          ),
        );
      },
    );
  }
}

class _ReviewsTab extends StatelessWidget {
  const _ReviewsTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("4.8", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(Icons.star, color: Color(0xFFFFB703), size: 20),
                  ),
                ),
                const Text("1,268 reviews"),
              ],
            ),
          ],
        ),
        AppSpacing.verticalLg,

        _buildReview("Sarah Mitchell", "This course exceeded my expectations. The modular structure made complex topics really easy to digest. Highly recommend for beginners!", "2 days ago", 5),
        _buildReview("Alex Rivera", "The quality of the video lectures is top-notch. I only wish there were more hands-on coding exercises in the first section.", "1 week ago", 4),
        _buildReview("Lisa Monti", "Perfect pace for someone balancing work and studies. The community forum for this course is also very active.", "2 weeks ago", 5),
      ],
    );
  }

  Widget _buildReview(String name, String comment, String time, int rating) {
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
                  backgroundColor: AppColors.primaryLight,
                  child: Text(name[0]),
                ),
                AppSpacing.horizontalSm,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                    Text(time, style: AppTextTheme.bodySmall),
                  ],
                ),
                const Spacer(),
                Row(
                  children: List.generate(rating, (_) => const Icon(Icons.star, size: 16, color: Color(0xFFFFB703))),
                ),
              ],
            ),
            AppSpacing.verticalSm,
            Text(comment, style: AppTextTheme.bodyRegular),
          ],
        ),
      ),
    );
  }
}