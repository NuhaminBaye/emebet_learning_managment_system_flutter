import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_event.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/bloc/wishlist/wishlist_state.dart';
import 'package:lms_mobileapp/shared/widgets/buttons/primary_button.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Saved Courses', style: AppTextTheme.headingMD),
        actions: [
          BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) => TextButton(
              onPressed: state.courses.isEmpty
                  ? null
                  : () => context.read<WishlistBloc>().add(const WishlistCleared()),
              child: Text('Clear all', style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
            ),
          ),
        ],
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state.isLoading) return const Center(child: CircularProgressIndicator());
          if (state.courses.isEmpty) {
            return const Center(
              child: Text(
                'No saved courses yet.\nTap the heart icon to save one.',
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 120),
            itemCount: state.courses.length,
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final course = state.courses[index];
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 14, offset: Offset(0, 8))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                      child: CachedNetworkImage(
                        imageUrl: course.imageUrl,
                        height: 154,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const ColoredBox(
                          color: AppColors.grey300,
                          child: SizedBox(height: 154),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(course.title, style: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 6),
                          Text(course.instructor, style: AppTextTheme.bodySmall),
                          const SizedBox(height: 6),
                          Text(course.price, style: AppTextTheme.bodyMedium.copyWith(color: AppColors.primary)),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  text: 'Enroll Now',
                                  onPressed: () => Navigator.pushNamed(context, AppRoutes.courseDetails),
                                  height: 46,
                                  radius: 14,
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton.filledTonal(
                                onPressed: () => context.read<WishlistBloc>().add(WishlistToggled(course)),
                                icon: const Icon(Icons.favorite, color: Color(0xFFEF4444)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
