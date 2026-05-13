import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/student_course.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_state.dart';
import 'package:lms_mobileapp/shared/widgets/cards/course_card.dart';
import 'package:lms_mobileapp/shared/widgets/inputs/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selected = 'All';
  final filters = const ['All', 'Design', 'Business', 'Development'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  Text('Search', style: AppTextTheme.headingLG.copyWith(fontSize: 30)),
                  const Spacer(),
                  const Icon(Icons.notifications_none_rounded),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchField(hintText: 'Search courses, skills, mentors...', onChanged: (_) {}),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final item = filters[index];
                  final isSelected = item == selected;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(item),
                      selected: isSelected,
                      onSelected: (_) => setState(() => selected = item),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _item('Scalable Design Systems for Enterprise', 'Sarah Chen', '\$89.99',
                      'https://picsum.photos/seed/search1/700/420'),
                  _item('Advanced UX Research Methodologies', 'Michael Torres', '\$74.50',
                      'https://picsum.photos/seed/search2/700/420'),
                  _item('Foundations of Product Strategy', 'Elena Rodriguez', '\$64.00',
                      'https://picsum.photos/seed/search3/700/420'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String title, String instructor, String price, String imageUrl) {
    final course = StudentCourse(
      id: title.toLowerCase().replaceAll(' ', '-'),
      title: title,
      subtitle: 'Search result',
      instructor: instructor,
      category: selected,
      progressLabel: 'Enroll Now',
      progress: 0,
      price: price,
      rating: 4.8,
      imageUrl: imageUrl,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, wishlist) {
          return CourseCard(
            title: title,
            instructor: instructor,
            imageUrl: imageUrl,
            price: price,
            progressLabel: 'Enroll Now',
            isWishlisted: wishlist.contains(course.id),
            onTap: () => Navigator.pushNamed(context, AppRoutes.courseDetails),
            onWishlistTap: () => context.read<WishlistBloc>().add(WishlistToggled(course)),
          );
        },
      ),
    );
  }
}
