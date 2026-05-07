// import 'package:flutter/material.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';
// import 'package:lms_mobileapp/shared/widgets/inputs/search_field.dart';
// import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   String _selectedFilter = 'All';

//   final List<String> _filters = ['All', 'Design Systems', 'UI/UX', 'Research', 'Development', 'Strategy'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               child: Row(
//                 children: [
//                   const Text("Search", style: AppTextTheme.headingLG),
//                   const Spacer(),
//                   IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
//                 ],
//               ),
//             ),

//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: SearchField(
//                 hintText: 'Search courses, skills, or instructors...',
//                 controller: _searchController,
//                 onChanged: (value) => setState(() {}),
//               ),
//             ),

//             AppSpacing.verticalMd,

//             // Filters
//             SizedBox(
//               height: 48,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: _filters.length,
//                 itemBuilder: (context, index) {
//                   final filter = _filters[index];
//                   final isSelected = filter == _selectedFilter;
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 10),
//                     child: FilterChip(
//                       label: Text(filter),
//                       selected: isSelected,
//                       onSelected: (_) => setState(() => _selectedFilter = filter),
//                       backgroundColor: isSelected ? AppColors.primary : AppColors.surface,
//                       labelColor: isSelected ? Colors.white : AppColors.textPrimary,
//                     ),
//                   );
//                 },
//               ),
//             ),

//             AppSpacing.verticalMd,

//             // Results
//             Expanded(
//               child: ListView(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 children: [
//                   _buildCourseItem(
//                     title: "Scalable Design Systems for Enterprise",
//                     instructor: "Sarah Chen",
//                     price: "\$89.99",
//                     rating: "4.9",
//                     imageUrl: "https://images.unsplash.com/photo-1557804506-669a67965ba0",
//                   ),
//                   _buildCourseItem(
//                     title: "Advanced UX Research Methodologies",
//                     instructor: "Michael Torres",
//                     price: "\$74.50",
//                     rating: "4.8",
//                     imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475",
//                   ),
//                   _buildCourseItem(
//                     title: "Foundations of Product Strategy",
//                     instructor: "Elena Rodriguez",
//                     price: "\$64.00",
//                     rating: "4.7",
//                     imageUrl: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCourseItem({
//     required String title,
//     required String instructor,
//     required String price,
//     required String rating,
//     required String imageUrl,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: CourseCard(
//         title: title,
//         instructor: instructor,
//         imageUrl: imageUrl,
//         price: price,
//         progressLabel: "Enroll Now",
//         onTap: () {},
//         onWishlistTap: () {},
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/shared/widgets/inputs/search_field.dart';
import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'All';

  final List<String> _filters = ['All', 'Design Systems', 'UI/UX', 'Research', 'Development', 'Strategy'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Text("Search", style: AppTextTheme.headingLG),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchField(
                hintText: 'Search courses, skills, or instructors...',
                onChanged: (value) => setState(() {}),
              ),
            ),

            AppSpacing.verticalMd,

            // Filters
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final filter = _filters[index];
                  final isSelected = filter == _selectedFilter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: FilterChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (_) => setState(() => _selectedFilter = filter),
                      backgroundColor: isSelected ? AppColors.primary : AppColors.surface,
                    ),
                  );
                },
              ),
            ),

            AppSpacing.verticalMd,

            // Results
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCourseItem(
                    title: "Scalable Design Systems for Enterprise",
                    instructor: "Sarah Chen",
                    price: "\$89.99",
                    rating: "4.9",
                    imageUrl: "https://images.unsplash.com/photo-1557804506-669a67965ba0",
                  ),
                  _buildCourseItem(
                    title: "Advanced UX Research Methodologies",
                    instructor: "Michael Torres",
                    price: "\$74.50",
                    rating: "4.8",
                    imageUrl: "https://images.unsplash.com/photo-1518770660439-4636190af475",
                  ),
                  _buildCourseItem(
                    title: "Foundations of Product Strategy",
                    instructor: "Elena Rodriguez",
                    price: "\$64.00",
                    rating: "4.7",
                    imageUrl: "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseItem({
    required String title,
    required String instructor,
    required String price,
    required String rating,
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CourseCard(
        title: title,
        instructor: instructor,
        imageUrl: imageUrl,
        price: price,
        progressLabel: "Enroll Now",
        // onTap: () {},
        onWishlistTap: () {},
      ),
    );
  }
}