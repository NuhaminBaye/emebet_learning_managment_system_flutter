import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';

class InstructorPillBottomNav extends StatelessWidget {
  const InstructorPillBottomNav({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  final int currentIndex;
  final ValueChanged<int> onChanged;

  static const _items = <_NavSpec>[
    _NavSpec(Icons.dashboard_outlined, Icons.dashboard, 'Dashboard'),
    _NavSpec(Icons.menu_book_outlined, Icons.menu_book, 'Courses'),
    _NavSpec(Icons.people_outline, Icons.people, 'Students'),
    _NavSpec(Icons.notifications_none_rounded, Icons.notifications, 'Alerts'),
    _NavSpec(Icons.person_outline, Icons.person, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: InstructorDesign.surface,
      elevation: 12,
      shadowColor: Colors.black26,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Row(
            children: List.generate(_items.length, (i) {
              final spec = _items[i];
              final selected = i == currentIndex;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => onChanged(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? InstructorDesign.primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            selected ? spec.activeIcon : spec.icon,
                            size: 22,
                            color: selected
                                ? InstructorDesign.surface
                                : InstructorDesign.textTertiary,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            spec.label.toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                              color: selected
                                  ? InstructorDesign.surface
                                  : InstructorDesign.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavSpec {
  const _NavSpec(this.icon, this.activeIcon, this.label);
  final IconData icon;
  final IconData activeIcon;
  final String label;
}
