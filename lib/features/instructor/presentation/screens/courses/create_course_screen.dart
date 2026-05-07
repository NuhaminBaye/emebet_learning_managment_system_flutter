// // import 'package:flutter/material.dart';
// // import 'package:lms_mobileapp/core/constants/colors.dart';
// // import 'package:lms_mobileapp/core/constants/spacing.dart';
// // import 'package:lms_mobileapp/core/constants/text_theme.dart';

// // class CreateCourseScreen extends StatefulWidget {
// //   const CreateCourseScreen({super.key});

// //   @override
// //   State<CreateCourseScreen> createState() => _CreateCourseScreenState();
// // }

// // class _CreateCourseScreenState extends State<CreateCourseScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   String courseTitle = '';
// //   String description = '';
// //   String price = '';

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.background,
// //       appBar: AppBar(
// //         title: const Text("Create Course", style: AppTextTheme.headingMD),
// //         backgroundColor: AppColors.background,
// //         elevation: 0,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Course Thumbnail
// //               Container(
// //                 height: 200,
// //                 width: double.infinity,
// //                 decoration: BoxDecoration(
// //                   color: AppColors.surface,
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: const Center(
// //                   child: Icon(Icons.add_photo_alternate, size: 60, color: Colors.grey),
// //                 ),
// //               ),

// //               AppSpacing.verticalLg,

// //               Text("Foundation", style: AppTextTheme.bodySmall.copyWith(color: AppColors.primary)),
// //               TextFormField(
// //                 decoration: const InputDecoration(labelText: "Title"),
// //                 onChanged: (val) => courseTitle = val,
// //               ),

// //               AppSpacing.verticalMd,
// //               TextFormField(
// //                 decoration: const InputDecoration(labelText: "Description"),
// //                 maxLines: 4,
// //                 onChanged: (val) => description = val,
// //               ),

// //               AppSpacing.verticalLg,

// //               // Classification
// //               const Text("Classification", style: AppTextTheme.headingMD),
// //               // Add chips for Beginner / Intermediate / Advanced

// //               AppSpacing.verticalLg,

// //               // Valuation
// //               const Text("Valuation", style: AppTextTheme.headingMD),
// //               TextFormField(
// //                 decoration: const InputDecoration(labelText: "\$ 0.00"),
// //                 keyboardType: TextInputType.number,
// //               ),

// //               AppSpacing.verticalLg,

// //               // Curriculum Builder (Placeholder)
// //               Container(
// //                 padding: const EdgeInsets.all(20),
// //                 decoration: BoxDecoration(
// //                   color: AppColors.surface,
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     const Text("Curriculum Builder", style: AppTextTheme.headingMD),
// //                     AppSpacing.verticalMd,
// //                     const Text("Structure your knowledge"),
// //                     AppSpacing.verticalMd,
// //                     ElevatedButton(
// //                       onPressed: () {},
// //                       child: const Text("Add Curriculum →"),
// //                     ),
// //                   ],
// //                 ),
// //               ),

// //               AppSpacing.verticalLg,

// //               // Aesthetic / Thumbnail
// //               const Text("Aesthetic", style: AppTextTheme.headingMD),
// //               // Thumbnail upload area

// //               AppSpacing.verticalLg,

// //               SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: () {},
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.green,
// //                     padding: const EdgeInsets.symmetric(vertical: 18),
// //                   ),
// //                   child: const Text("Publish Course", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:lms_mobileapp/core/constants/app_routes.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';

// class CreateCourseScreen extends StatefulWidget {
//   const CreateCourseScreen({super.key});

//   @override
//   State<CreateCourseScreen> createState() => _CreateCourseScreenState();
// }

// class _CreateCourseScreenState extends State<CreateCourseScreen> {
//   String selectedLevel = "Beginner";
//   final TextEditingController titleController = TextEditingController(text: "Advanced Architectural Visualization");
//   final TextEditingController descriptionController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text("Create Course", style: AppTextTheme.headingMD),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Subtitle
//             Text(
//               "Design everything experience that inspires. Every detail. From your curriculum to the thumbnail, define your brand's craft.",
//               style: AppTextTheme.bodyRegular.copyWith(color: AppColors.textSecondary),
//             ),

//             AppSpacing.verticalLg,

//             // Foundation Section
//             const Text("Foundation", style: AppTextTheme.headingMD),
//             AppSpacing.verticalMd,

//             // Title
//             const Text("Title", style: AppTextTheme.bodySmall),
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(
//                 hintText: "Advanced Architectural Visualization",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),

//             AppSpacing.verticalLg,

//             // Description
//             const Text("Description", style: AppTextTheme.bodySmall),
//             TextField(
//               controller: descriptionController,
//               maxLines: 5,
//               decoration: InputDecoration(
//                 hintText: "Write a short description about your course...",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),

//             AppSpacing.verticalLg,

//             // Classification
//             const Text("Classification", style: AppTextTheme.headingMD),
//             AppSpacing.verticalSm,
//             Row(
//               children: [
//                 _buildLevelChip("Beginner"),
//                 AppSpacing.horizontalSm,
//                 _buildLevelChip("Intermediate"),
//                 AppSpacing.horizontalSm,
//                 _buildLevelChip("Advanced"),
//               ],
//             ),

//             AppSpacing.verticalLg,

//             // Valuation
//             const Text("Valuation", style: AppTextTheme.headingMD),
//             AppSpacing.verticalSm,
//             TextField(
//               decoration: InputDecoration(
//                 prefixText: "\$ ",
//                 hintText: "0.00",
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const Text("Enrolled fee (USD)", style: AppTextTheme.bodySmall),

//             AppSpacing.verticalLg,

//             // Curriculum Builder
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: AppColors.surface,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Curriculum Builder", style: AppTextTheme.headingMD),
//                   AppSpacing.verticalSm,
//                   const Text("Structure your knowledge", style: AppTextTheme.bodyRegular),
//                   AppSpacing.verticalLg,
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {  Navigator.pushNamed(context, AppRoutes.CurriculumBuilderScreen);
//                         },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF22C55E),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       ),
//                       child: const Text("Build Curriculum", style: TextStyle(fontWeight: FontWeight.w600)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             AppSpacing.verticalLg,

//             // Aesthetic
//             const Text("Aesthetic", style: AppTextTheme.headingMD),
//             AppSpacing.verticalSm,
//             Container(
//               height: 180,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: AppColors.surface,
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: AppColors.grey200),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.image, size: 48, color: Colors.grey),
//                   AppSpacing.verticalSm,
//                   const Text("Upload Thumbnail", style: AppTextTheme.bodyMedium),
//                   const Text("Recommended size: 1280 x 720", style: AppTextTheme.bodySmall),
//                 ],
//               ),
//             ),

//             AppSpacing.verticalXl,

//             // Publish Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF22C55E),
//                   padding: const EdgeInsets.symmetric(vertical: 18),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//                 ),
//                 child: const Text("Publish Course", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//               ),
//             ),

//             AppSpacing.verticalMd,

//             Center(
//               child: TextButton(
//                 onPressed: () {},
//                 child: const Text("Save as Draft"),
//               ),
//             ),

//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildLevelChip(String level) {
//     final isSelected = selectedLevel == level;
//     return GestureDetector(
//       onTap: () => setState(() => selectedLevel = level),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         decoration: BoxDecoration(
//           color: isSelected ? AppColors.primary : AppColors.surface,
//           borderRadius: BorderRadius.circular(30),
//           border: Border.all(color: isSelected ? AppColors.primary : AppColors.grey200),
//         ),
//         child: Text(
//           level,
//           style: TextStyle(
//             color: isSelected ? Colors.white : AppColors.textPrimary,
//             fontWeight: FontWeight.w500,
//           ),
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

class CreateCourseScreen extends StatefulWidget {
  const CreateCourseScreen({super.key});

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  String selectedLevel = "Beginner";

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
        title: const Text("Create Course", style: AppTextTheme.headingMD),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Design everything experience that inspires. Every detail. From your curriculum to the thumbnail, define your brand's craft.",
              style: AppTextTheme.bodyRegular.copyWith(color: AppColors.textSecondary),
            ),
            AppSpacing.verticalLg,

            const Text("Foundation", style: AppTextTheme.headingMD),
            AppSpacing.verticalMd,

            const Text("Title", style: AppTextTheme.bodySmall),
            TextField(
              decoration: InputDecoration(
                hintText: "Advanced Architectural Visualization",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            AppSpacing.verticalLg,

            const Text("Description", style: AppTextTheme.bodySmall),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write a short description about your course...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),

            AppSpacing.verticalLg,

            const Text("Classification", style: AppTextTheme.headingMD),
            AppSpacing.verticalSm,
            Row(
              children: [
                _buildLevelChip("Beginner"),
                AppSpacing.horizontalSm,
                _buildLevelChip("Intermediate"),
                AppSpacing.horizontalSm,
                _buildLevelChip("Advanced"),
              ],
            ),

            AppSpacing.verticalLg,

            const Text("Valuation", style: AppTextTheme.headingMD),
            AppSpacing.verticalSm,
            TextField(
              decoration: InputDecoration(
                prefixText: "\$ ",
                hintText: "0.00",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              keyboardType: TextInputType.number,
            ),

            AppSpacing.verticalLg,

            // Curriculum Builder
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Curriculum Builder", style: AppTextTheme.headingMD),
                  AppSpacing.verticalSm,
                  const Text("Structure your knowledge", style: AppTextTheme.bodyRegular),
                  AppSpacing.verticalLg,

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.curriculumBuilder);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF22C55E),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Build Curriculum", style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),

            AppSpacing.verticalLg,

            const Text("Aesthetic", style: AppTextTheme.headingMD),
            AppSpacing.verticalSm,
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.grey200),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 48, color: Colors.grey),
                    Text("Upload Thumbnail"),
                  ],
                ),
              ),
            ),

            AppSpacing.verticalXl,

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("Publish Course", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelChip(String level) {
    final isSelected = selectedLevel == level;
    return GestureDetector(
      onTap: () => setState(() => selectedLevel = level),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.grey200),
        ),
        child: Text(
          level,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}