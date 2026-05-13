import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';

/// Instructor shell app bar: avatar, brand, search (matches mockups).
class InstructorChromeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InstructorChromeAppBar({
    super.key,
    this.avatarUrl =
        'https://ui-avatars.com/api/?name=Julian+Sterling&background=2ECC71&color=fff',
    this.brand = 'The Digital Atelier',
    this.onSearchTap,
    this.backgroundColor = InstructorDesign.surface,
    this.showBackWhenCanPop = false,
  });

  final String avatarUrl;
  final String brand;
  final VoidCallback? onSearchTap;
  final Color backgroundColor;

  /// When true, shows a back chevron before the avatar if [Navigator.canPop].
  final bool showBackWhenCanPop;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    final showBack = showBackWhenCanPop && canPop;

    return Material(
      color: backgroundColor,
      elevation: 0,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              if (showBack)
                IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                  color: InstructorDesign.textPrimary,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                ),
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: avatarUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    width: 40,
                    height: 40,
                    color: InstructorDesign.surfaceMuted,
                  ),
                  errorWidget: (_, __, ___) => Container(
                    width: 40,
                    height: 40,
                    color: InstructorDesign.surfaceMuted,
                    alignment: Alignment.center,
                    child: const Icon(Icons.person, color: InstructorDesign.textTertiary),
                  ),
                ),
              ),
              SizedBox(width: showBack ? 8 : 12),
              Expanded(
                child: Text(
                  brand,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: InstructorDesign.primary,
                  ),
                ),
              ),
              IconButton(
                onPressed: onSearchTap,
                icon: const Icon(Icons.search, color: InstructorDesign.textTertiary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
