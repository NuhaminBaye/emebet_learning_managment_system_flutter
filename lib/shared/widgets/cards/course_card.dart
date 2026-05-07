// // import 'package:flutter/material.dart';
// // import 'package:lms_mobileapp/core/constants/colors.dart';
// // import 'package:lms_mobileapp/core/constants/text_theme.dart';

// // class CourseCard extends StatelessWidget {
// //   final String title;
// //   final String instructor;
// //   final String imageUrl;
// //   final String price;
// //   final String progressLabel;
// //   final VoidCallback onTap;

// //   const CourseCard({
// //     super.key,
// //     required this.title,
// //     required this.instructor,
// //     required this.imageUrl,
// //     required this.price,
// //     required this.progressLabel,
// //     required this.onTap,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         margin: const EdgeInsets.all(8),
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(20),
// //           color: AppColors.surface,
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.04),
// //               blurRadius: 16,
// //               offset: const Offset(0, 10),
// //             ),
// //           ],
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             ClipRRect(
// //               borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
// //               child: Image.network(
// //                 imageUrl,
// //                 height: 140,
// //                 width: double.infinity,
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     title,
// //                     maxLines: 2,
// //                     overflow: TextOverflow.ellipsis,
// //                     style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: Text(
// //                           instructor,
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                           style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 4),
// //                       const Icon(Icons.star, size: 14, color: Color(0xFFFFB703)),
// //                       const SizedBox(width: 4),
// //                       Text('4.9', style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary)),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 14),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(price, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
// //                       Container(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
// //                         decoration: BoxDecoration(
// //                           color: AppColors.grey100,
// //                           borderRadius: BorderRadius.circular(14),
// //                         ),
// //                         child: Text(progressLabel, style: AppTextTheme.caption.copyWith(color: AppColors.textPrimary)),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';

// class CourseCard extends StatefulWidget {
//   final String title;
//   final String instructor;
//   final String imageUrl;
//   final String price;
//   final String progressLabel;
//   final VoidCallback onTap;
//   final VoidCallback? onWishlistTap; // New callback

//   const CourseCard({
//     super.key,
//     required this.title,
//     required this.instructor,
//     required this.imageUrl,
//     required this.price,
//     required this.progressLabel,
//     required this.onTap,
//     this.onWishlistTap,
//   });

//   @override
//   State<CourseCard> createState() => _CourseCardState();
// }

// class _CourseCardState extends State<CourseCard> {
//   bool _isWishlisted = false;

//   void _toggleWishlist() {
//     setState(() {
//       _isWishlisted = !_isWishlisted;
//     });
//     widget.onWishlistTap?.call();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       child: Container(
//         width: 220,
//         margin: const EdgeInsets.only(right: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: AppColors.surface,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.06),
//               blurRadius: 12,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image with Heart Icon
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//                   child: Image.network(
//                     widget.imageUrl,
//                     height: 140,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       height: 140,
//                       color: AppColors.grey100,
//                       child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
//                     ),
//                   ),
//                 ),
//                 // Heart Icon
//                 Positioned(
//                   top: 12,
//                   right: 12,
//                   child: GestureDetector(
//                     onTap: _toggleWishlist,
//                     child: Container(
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.9),
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 6,
//                           ),
//                         ],
//                       ),
//                       child: Icon(
//                         _isWishlisted ? Icons.favorite : Icons.favorite_border,
//                         color: _isWishlisted ? Colors.red : Colors.grey[700],
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // Content
//             Padding(
//               padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.title,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           widget.instructor,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary),
//                         ),
//                       ),
//                       const Icon(Icons.star, size: 14, color: Color(0xFFFFB703)),
//                       const SizedBox(width: 4),
//                       Text('4.9', style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary)),
//                     ],
//                   ),
//                   const SizedBox(height: 14),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         widget.price,
//                         style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: AppColors.grey100,
//                           borderRadius: BorderRadius.circular(14),
//                         ),
//                         child: Text(
//                           widget.progressLabel,
//                           style: AppTextTheme.caption.copyWith(color: AppColors.textPrimary),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class CourseCard extends StatefulWidget {
  final String title;
  final String instructor;
  final String imageUrl;
  final String price;
  final String progressLabel;
  final String? courseId; // Optional: for future dynamic routing
  final VoidCallback? onWishlistTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.price,
    required this.progressLabel,
    this.courseId,
    this.onWishlistTap,
  });

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool _isWishlisted = false;

  void _toggleWishlist() {
    setState(() => _isWishlisted = !_isWishlisted);
    widget.onWishlistTap?.call();
  }

  void _navigateToCourseDetail() {
    Navigator.pushNamed(context, AppRoutes.courseDetails);
    // In future: Navigator.pushNamed(context, AppRoutes.courseDetail(widget.courseId!));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToCourseDetail,   // ← Main card tap navigates
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Heart Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(
                    widget.imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 140,
                      color: AppColors.grey100,
                      child: const Icon(Icons.image_not_supported, size: 40, color: Colors.grey),
                    ),
                  ),
                ),
                // Heart Icon (Only heart tap, not whole card)
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () {
                      // Stop propagation so card tap doesn't trigger
                      _toggleWishlist();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.95),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6),
                        ],
                      ),
                      child: Icon(
                        _isWishlisted ? Icons.favorite : Icons.favorite_border,
                        color: _isWishlisted ? Colors.red : Colors.grey[700],
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Content
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.instructor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.bodySmall.copyWith(color: AppColors.textSecondary),
                        ),
                      ),
                      const Icon(Icons.star, size: 14, color: Color(0xFFFFB703)),
                      const SizedBox(width: 4),
                      const Text('4.9', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.price,
                        style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.grey100,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          widget.progressLabel,
                          style: AppTextTheme.caption.copyWith(color: AppColors.textPrimary),
                        ),
                      ),
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
}