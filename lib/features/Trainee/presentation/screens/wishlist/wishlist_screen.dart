// // // import 'package:flutter/material.dart';
// // // import 'package:lms_mobileapp/core/constants/app_routes.dart';
// // // import 'package:lms_mobileapp/core/constants/colors.dart';
// // // import 'package:lms_mobileapp/core/constants/spacing.dart';
// // // import 'package:lms_mobileapp/core/constants/text_theme.dart';
// // // import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';

// // // class WishlistScreen extends StatelessWidget {
// // //   const WishlistScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: AppColors.background,
// // //       appBar: AppBar(
// // //         title: const Text("Saved Courses", style: AppTextTheme.headingMD),
// // //         backgroundColor: AppColors.background,
// // //         elevation: 0,
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () {},
// // //             child: Text("Clear all", style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
// // //           ),
// // //         ],
// // //       ),
// // //       body: ListView(
// // //         padding: const EdgeInsets.symmetric(horizontal: 16),
// // //         children: [
// // //           const Text("3 Saved Courses", style: AppTextTheme.headingLG),
// // //           AppSpacing.verticalSm,
// // //           const Text("Continue your learning journey", style: AppTextTheme.bodyRegular),
// // //           AppSpacing.verticalLg,

// // //           _buildSavedCourse(
// // //             title: "Scalable Design Systems for Enterprise",
// // //             price: "\$89.99",
// // //             rating: "4.9",
// // //             imageUrl: "https://images.unsplash.com/photo-1557804506-669a67965ba0",
// // //           ),
// // //           _buildSavedCourse(
// // //             title: "Advanced UX Research Methodologies",
// // //             price: "\$74.50",
// // //             rating: "4.8",
// // //             imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475",
// // //           ),
// // //           _buildSavedCourse(
// // //             title: "Full-Stack Development with Next.js 14",
// // //             price: "\$129.99",
// // //             rating: "4.6",
// // //             imageUrl: "https://images.unsplash.com/photo-1517694712202-14dd9538aa97",
// // //           ),

// // //           AppSpacing.verticalXl,
// // //           const Text("You Might Also Like", style: AppTextTheme.headingMD),
// // //           AppSpacing.verticalMd,

// // //           // You Might Also Like Section
// // //           SizedBox(
// // //             height: 240,
// // //             child: ListView.builder(
// // //               scrollDirection: Axis.horizontal,
// // //               itemCount: 3,
// // //               itemBuilder: (context, index) {
// // //                 return Padding(
// // //                   padding: const EdgeInsets.only(right: 16),
// // //                   child: CourseCard(
// // //                     title: "Product Management",
// // //                     instructor: "Alex Morgan",
// // //                     imageUrl: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
// // //                     price: "\$49.99",
// // //                     progressLabel: "Enroll Now",
// // //                     onTap: () {
// // //                       // Navigate to Course Detail Screen
// // //                       Navigator.pushNamed(context, AppRoutes.courseDetails);
// // //                     },
// // //                     onWishlistTap: () {
// // //                       ScaffoldMessenger.of(context).showSnackBar(
// // //                         const SnackBar(content: Text("Added to Wishlist")),
// // //                       );
// // //                     },
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildSavedCourse({
// // //     required String title,
// // //     required String price,
// // //     required String rating,
// // //     required String imageUrl,
// // //   }) {
// // //     return Container(
// // //       margin: const EdgeInsets.only(bottom: 16),
// // //       decoration: BoxDecoration(
// // //         color: AppColors.surface,
// // //         borderRadius: BorderRadius.circular(20),
// // //       ),
// // //       child: Row(
// // //         children: [
// // //           ClipRRect(
// // //             borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
// // //             child: Image.network(
// // //               imageUrl,
// // //               width: 120,
// // //               height: 110,
// // //               fit: BoxFit.cover,
// // //             ),
// // //           ),
// // //           Expanded(
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(16),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Text(
// // //                     title,
// // //                     maxLines: 2,
// // //                     overflow: TextOverflow.ellipsis,
// // //                     style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
// // //                   ),
// // //                   AppSpacing.verticalXs,
// // //                   Row(
// // //                     children: [
// // //                       const Icon(Icons.star, size: 16, color: Color(0xFFFFB703)),
// // //                       Text(" $rating", style: AppTextTheme.bodySmall),
// // //                     ],
// // //                   ),
// // //                   AppSpacing.verticalSm,
// // //                   Text(
// // //                     price,
// // //                     style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),
// // //                   ),
// // //                   AppSpacing.verticalMd,
// // //                   SizedBox(
// // //                     width: double.infinity,
// // //                     child: ElevatedButton(
// // //                       onPressed: () {},
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: const Color(0xFF22C55E),
// // //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //                         padding: const EdgeInsets.symmetric(vertical: 12),
// // //                       ),
// // //                       child: const Text("Enroll Now", style: TextStyle(fontWeight: FontWeight.w600)),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //           IconButton(
// // //             icon: const Icon(Icons.favorite, color: Colors.red),
// // //             onPressed: () {},
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:lms_mobileapp/core/constants/app_routes.dart';
// // // import 'package:lms_mobileapp/core/constants/colors.dart';
// // // import 'package:lms_mobileapp/core/constants/spacing.dart';
// // // import 'package:lms_mobileapp/core/constants/text_theme.dart';
// // // import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';

// // // class WishlistScreen extends StatelessWidget {
// // //   const WishlistScreen({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: AppColors.background,
// // //       appBar: AppBar(
// // //         backgroundColor: AppColors.background,
// // //         elevation: 0,
// // //         title: const Text("EduStream", style: AppTextTheme.headingMD),
// // //         actions: [
// // //           IconButton(
// // //             icon: const Icon(Icons.notifications_none),
// // //             onPressed: () {},
// // //           ),
// // //         ],
// // //       ),
// // //       body: ListView(
// // //         padding: const EdgeInsets.symmetric(horizontal: 16),
// // //         children: [
// // //           // Header Section
// // //           Row(
// // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //             children: [
// // //               const Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Text("3 Saved Courses", style: AppTextTheme.headingLG),
// // //                   Text("Continue your learning journey", style: AppTextTheme.bodyRegular),
// // //                 ],
// // //               ),
// // //               TextButton(
// // //                 onPressed: () {},
// // //                 child: Text(
// // //                   "Clear all",
// // //                   style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),

// // //           AppSpacing.verticalLg,

// // //           // Saved Courses
// // //           _buildSavedCourse(
// // //             title: "Scalable Design Systems for Enterprise",
// // //             price: "\$89.99",
// // //             rating: "4.9",
// // //             imageUrl: "https://images.unsplash.com/photo-1557804506-669a67965ba0",
// // //           ),
// // //           _buildSavedCourse(
// // //             title: "Advanced UX Research Methodologies",
// // //             price: "\$74.50",
// // //             rating: "4.8",
// // //             imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475",
// // //           ),
// // //           _buildSavedCourse(
// // //             title: "Full-Stack Development with Next.js 14",
// // //             price: "\$129.99",
// // //             rating: "4.6",
// // //             imageUrl: "https://images.unsplash.com/photo-1517694712202-14dd9538aa97",
// // //           ),

// // //           AppSpacing.verticalXl,

// // //           // You Might Also Like
// // //           const Text("You Might Also Like", style: AppTextTheme.headingMD),
// // //           AppSpacing.verticalMd,

// // //           SizedBox(
// // //             height: 240,
// // //             child: ListView.builder(
// // //               scrollDirection: Axis.horizontal,
// // //               itemCount: 3,
// // //               itemBuilder: (context, index) {
// // //                 return Padding(
// // //                   padding: const EdgeInsets.only(right: 16),
// // //                   child: CourseCard(
// // //                     title: "Product Management",
// // //                     instructor: "Alex Morgan",
// // //                     imageUrl: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
// // //                     price: "\$49.99",
// // //                     progressLabel: "Enroll Now",
// // //                     onTap: () {
// // //                       Navigator.pushNamed(context, AppRoutes.courseDetails);
// // //                     },
// // //                     onWishlistTap: () {},
// // //                   ),
// // //                 );
// // //               },
// // //             ),
// // //           ),

// // //           const SizedBox(height: 100),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildSavedCourse({
// // //     required String title,
// // //     required String price,
// // //     required String rating,
// // //     required String imageUrl,
// // //   }) {
// // //     return Container(
// // //       margin: const EdgeInsets.only(bottom: 20),
// // //       decoration: BoxDecoration(
// // //         color: AppColors.surface,
// // //         borderRadius: BorderRadius.circular(20),
// // //       ),
// // //       child: Row(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           // Course Image
// // //           Stack(
// // //             children: [
// // //               ClipRRect(
// // //                 borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
// // //                 child: Image.network(
// // //                   imageUrl,
// // //                   width: 130,
// // //                   height: 130,
// // //                   fit: BoxFit.cover,
// // //                 ),
// // //               ),
// // //               // Heart Icon
// // //               Positioned(
// // //                 top: 12,
// // //                 right: 12,
// // //                 child: Container(
// // //                   padding: const EdgeInsets.all(6),
// // //                   decoration: BoxDecoration(
// // //                     color: Colors.white,
// // //                     shape: BoxShape.circle,
// // //                     boxShadow: [
// // //                       BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6),
// // //                     ],
// // //                   ),
// // //                   child: const Icon(Icons.favorite, color: Colors.red, size: 20),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),

// // //           // Course Info
// // //           Expanded(
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(16),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Text(
// // //                     title,
// // //                     maxLines: 2,
// // //                     overflow: TextOverflow.ellipsis,
// // //                     style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600, height: 1.3),
// // //                   ),
// // //                   AppSpacing.verticalSm,
// // //                   Row(
// // //                     children: [
// // //                       const Icon(Icons.star, size: 16, color: Color(0xFFFFB703)),
// // //                       const SizedBox(width: 4),
// // //                       Text(rating, style: AppTextTheme.bodySmall),
// // //                     ],
// // //                   ),
// // //                   AppSpacing.verticalSm,
// // //                   Text(
// // //                     price,
// // //                     style: AppTextTheme.bodyMedium.copyWith(
// // //                       fontWeight: FontWeight.bold,
// // //                       color: AppColors.primary,
// // //                     ),
// // //                   ),
// // //                   AppSpacing.verticalMd,
// // //                   SizedBox(
// // //                     width: double.infinity,
// // //                     child: ElevatedButton(
// // //                       onPressed: () {},
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: const Color(0xFF22C55E),
// // //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //                         padding: const EdgeInsets.symmetric(vertical: 12),
// // //                       ),
// // //                       child: const Text(
// // //                         "Enroll Now",
// // //                         style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:lms_mobileapp/core/constants/app_routes.dart';
// // import 'package:lms_mobileapp/core/constants/colors.dart';
// // import 'package:lms_mobileapp/core/constants/spacing.dart';
// // import 'package:lms_mobileapp/core/constants/text_theme.dart';
// // import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';

// // class WishlistScreen extends StatelessWidget {
// //   const WishlistScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.background,
// //       appBar: AppBar(
// //         backgroundColor: AppColors.background,
// //         elevation: 0,
// //         title: const Text("EduStream", style: AppTextTheme.headingMD),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.notifications_none),
// //             onPressed: () {},
// //           ),
// //         ],
// //       ),
// //       body: ListView(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         children: [
// //           // Title Section
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             crossAxisAlignment: CrossAxisAlignment.end,
// //             children: [
// //               const Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text("3 Saved Courses", style: AppTextTheme.headingLG),
// //                   Text("Continue your learning journey", style: AppTextTheme.bodyRegular),
// //                 ],
// //               ),
// //               TextButton(
// //                 onPressed: () {},
// //                 child: Text(
// //                   "Clear all",
// //                   style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           AppSpacing.verticalLg,

// //           // Saved Courses
// //           _buildSavedCourseCard(
// //             title: "Scalable Design Systems for Enterprise",
// //             price: "\$89.99",
// //             rating: "4.9",
// //             imageUrl: "https://images.unsplash.com/photo-1557804506-669a67965ba0",
// //           ),
// //           _buildSavedCourseCard(
// //             title: "Advanced UX Research Methodologies",
// //             price: "\$74.50",
// //             rating: "4.8",
// //             imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475",
// //           ),
// //           _buildSavedCourseCard(
// //             title: "Full-Stack Development with Next.js 14",
// //             price: "\$129.99",
// //             rating: "5.0",
// //             imageUrl: "https://images.unsplash.com/photo-1517694712202-14dd9538aa97",
// //           ),

// //           AppSpacing.verticalXl,

// //           // You Might Also Like
// //           const Text("You Might Also Like", style: AppTextTheme.headingMD),
// //           AppSpacing.verticalMd,

// //           SizedBox(
// //             height: 220,
// //             child: ListView.builder(
// //               scrollDirection: Axis.horizontal,
// //               itemCount: 3,
// //               itemBuilder: (context, index) {
// //                 return Padding(
// //                   padding: const EdgeInsets.only(right: 16),
// //                   child: SizedBox(
// //                     width: 160,
// //                     child: CourseCard(
// //                       title: "Product Management",
// //                       instructor: "Alex Morgan",
// //                       imageUrl: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
// //                       price: "\$49.99",
// //                       progressLabel: "Enroll Now",
// //                       onTap: () {
// //                         Navigator.pushNamed(context, AppRoutes.courseDetails);
// //                       },
// //                       onWishlistTap: () {},
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),

// //           const SizedBox(height: 80),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildSavedCourseCard({
// //     required String title,
// //     required String price,
// //     required String rating,
// //     required String imageUrl,
// //   }) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 20),
// //       decoration: BoxDecoration(
// //         color: AppColors.surface,
// //         borderRadius: BorderRadius.circular(20),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Stack(
// //             children: [
// //               ClipRRect(
// //                 borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
// //                 child: Image.network(
// //                   imageUrl,
// //                   height: 180,
// //                   width: double.infinity,
// //                   fit: BoxFit.cover,
// //                   errorBuilder: (_, __, ___) => Container(
// //                     height: 180,
// //                     color: AppColors.grey100,
// //                     child: const Icon(Icons.image_not_supported, size: 50),
// //                   ),
// //                 ),
// //               ),
// //               Positioned(
// //                 top: 12,
// //                 right: 12,
// //                 child: Container(
// //                   padding: const EdgeInsets.all(8),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     shape: BoxShape.circle,
// //                     boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8)],
// //                   ),
// //                   child: const Icon(Icons.favorite, color: Colors.red, size: 22),
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(16),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   title,
// //                   maxLines: 2,
// //                   overflow: TextOverflow.ellipsis,
// //                   style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
// //                 ),
// //                 AppSpacing.verticalSm,
// //                 Row(
// //                   children: [
// //                     const Icon(Icons.star, size: 18, color: Color(0xFFFFB703)),
// //                     const SizedBox(width: 6),
// //                     Text(rating, style: AppTextTheme.bodyMedium),
// //                   ],
// //                 ),
// //                 AppSpacing.verticalSm,
// //                 Text(
// //                   price,
// //                   style: AppTextTheme.headingMD.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),
// //                 ),
// //                 AppSpacing.verticalMd,
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: ElevatedButton(
// //                     onPressed: () {},
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color(0xFF22C55E),
// //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                       padding: const EdgeInsets.symmetric(vertical: 14),
// //                     ),
// //                     child: const Text(
// //                       "Enroll Now",
// //                       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:lms_mobileapp/core/constants/app_routes.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';
// import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';

// class WishlistScreen extends StatefulWidget {
//   const WishlistScreen({super.key});

//   @override
//   State<WishlistScreen> createState() => _WishlistScreenState();
// }

// class _WishlistScreenState extends State<WishlistScreen> {
//   // Sample saved courses
//   List<Map<String, String>> savedCourses = [
//     {
//       "title": "Scalable Design Systems for Enterprise",
//       "price": "\$89.99",
//       "rating": "4.9",
//       "imageUrl": "https://images.unsplash.com/photo-1557804506-669a67965ba0",
//     },
//     {
//       "title": "Advanced UX Research Methodologies",
//       "price": "\$74.50",
//       "rating": "4.8",
//       "imageUrl": "https://images.unsplash.com/photo-1518770660439-4636190af475",
//     },
//     {
//       "title": "Full-Stack Development with Next.js 14",
//       "price": "\$129.99",
//       "rating": "5.0",
//       "imageUrl": "https://images.unsplash.com/photo-1517694712202-14dd9538aa97",
//     },
//   ];

//   void _removeFromWishlist(int index) {
//     setState(() {
//       savedCourses.removeAt(index);
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Removed from wishlist")),
//     );
//   }

//   void _addToWishlist(String title) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("$title added to wishlist")),
//     );
//     // In real app, you would add to the saved list here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         title: const Text("EduStream", style: AppTextTheme.headingMD),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         children: [
//           // Header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("3 Saved Courses", style: AppTextTheme.headingLG),
//                   const Text("Continue your learning journey", style: AppTextTheme.bodyRegular),
//                 ],
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() => savedCourses.clear());
//                 },
//                 child: Text("Clear all", style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
//               ),
//             ],
//           ),

//           AppSpacing.verticalLg,

//           // Saved Courses
//           ...List.generate(savedCourses.length, (index) {
//             final course = savedCourses[index];
//             return _buildSavedCourseCard(
//               title: course["title"]!,
//               price: course["price"]!,
//               rating: course["rating"]!,
//               imageUrl: course["imageUrl"]!,
//               onRemove: () => _removeFromWishlist(index),
//             );
//           }),

//           AppSpacing.verticalXl,

//           // You Might Also Like
//           const Text("You Might Also Like", style: AppTextTheme.headingMD),
//           AppSpacing.verticalMd,

//           SizedBox(
//             height: 245, // Increased height to prevent overflow
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 16),
//                   child: SizedBox(
//                     width: 170,
//                     child: CourseCard(
//                       title: "Product Management",
//                       instructor: "Alex Morgan",
//                       imageUrl: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
//                       price: "\$49.99",
//                       progressLabel: "Enroll Now",
//                       onTap: () {
//                         Navigator.pushNamed(context, AppRoutes.courseDetails);
//                       },
//                       onWishlistTap: () => _addToWishlist("Product Management"),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           const SizedBox(height: 100),
//         ],
//       ),
//     );
//   }

//   Widget _buildSavedCourseCard({
//     required String title,
//     required String price,
//     required String rating,
//     required String imageUrl,
//     required VoidCallback onRemove,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       decoration: BoxDecoration(
//         color: AppColors.surface,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//                 child: Image.network(
//                   imageUrl,
//                   height: 180,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (_, __, ___) => Container(
//                     height: 180,
//                     color: AppColors.grey100,
//                     child: const Icon(Icons.image_not_supported, size: 50),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 12,
//                 right: 12,
//                 child: GestureDetector(
//                   onTap: onRemove,
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8)],
//                     ),
//                     child: const Icon(Icons.favorite, color: Colors.red, size: 22),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
//                 ),
//                 AppSpacing.verticalSm,
//                 Row(
//                   children: [
//                     const Icon(Icons.star, size: 18, color: Color(0xFFFFB703)),
//                     const SizedBox(width: 6),
//                     Text(rating, style: AppTextTheme.bodyMedium),
//                   ],
//                 ),
//                 AppSpacing.verticalSm,
//                 Text(
//                   price,
//                   style: AppTextTheme.headingMD.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary),
//                 ),
//                 AppSpacing.verticalMd,
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF22C55E),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: const Text(
//                       "Enroll Now",
//                       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Map<String, String>> savedCourses = [
    {"title": "Scalable Design Systems for Enterprise", "price": "\$89.99", "rating": "4.9", "imageUrl": "https://images.unsplash.com/photo-1557804506-669a67965ba0"},
    {"title": "Advanced UX Research Methodologies", "price": "\$74.50", "rating": "4.8", "imageUrl": "https://images.unsplash.com/photo-1518770660439-4636190af475"},
    {"title": "Full-Stack Development with Next.js 14", "price": "\$129.99", "rating": "5.0", "imageUrl": "https://images.unsplash.com/photo-1517694712202-14dd9538aa97"},
  ];

  void _removeFromWishlist(int index) {
    setState(() => savedCourses.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("EduStream", style: AppTextTheme.headingMD),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("3 Saved Courses", style: AppTextTheme.headingLG),
                  Text("Continue your learning journey", style: AppTextTheme.bodyRegular),
                ],
              ),
              TextButton(
                onPressed: () => setState(() => savedCourses.clear()),
                child: Text("Clear all", style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
              ),
            ],
          ),

          AppSpacing.verticalLg,

          ...List.generate(savedCourses.length, (index) {
            final course = savedCourses[index];
            return _buildSavedCourseCard(
              title: course["title"]!,
              price: course["price"]!,
              rating: course["rating"]!,
              imageUrl: course["imageUrl"]!,
              onRemove: () => _removeFromWishlist(index),
            );
          }),

          AppSpacing.verticalXl,

          const Text("You Might Also Like", style: AppTextTheme.headingMD),
          AppSpacing.verticalMd,

          SizedBox(
            height: 260, // Increased to avoid overflow
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 170,
                    child:SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: CourseCard(
                      title: "Product Management",
                      instructor: "Alex Morgan",
                      imageUrl: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
                      price: "\$49.99",
                      progressLabel: "Enroll Now",
                      // onTap: () {
                      //   Navigator.pushNamed(context, AppRoutes.courseDetails);
                      // },
                      onWishlistTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added to Wishlist")),
                        );
                      },
                    ),
                  ),
                 ) );
              },
            ),
          ),

          const SizedBox(height: 120), // Extra space at bottom
        ],
      ),
    );
  }

  Widget _buildSavedCourseCard({
    required String title,
    required String price,
    required String rating,
    required String imageUrl,
    required VoidCallback onRemove,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(height: 180, color: AppColors.grey100),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.favorite, color: Colors.red, size: 22),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                AppSpacing.verticalSm,
                Row(children: [const Icon(Icons.star, size: 18, color: Color(0xFFFFB703)), Text(" $rating")]),
                AppSpacing.verticalSm,
                Text(price, style: AppTextTheme.headingMD.copyWith(fontWeight: FontWeight.bold, color: AppColors.primary)),
                AppSpacing.verticalMd,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF22C55E), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 14)),
                    child: const Text("Enroll Now", style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}