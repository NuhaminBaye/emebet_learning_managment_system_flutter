import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/instructor_chrome_app_bar.dart';

class InstructorProfileScreen extends StatelessWidget {
  const InstructorProfileScreen({super.key});

  static const _avatar =
      'https://ui-avatars.com/api/?name=Julian+Sterling&background=2ECC71&color=fff&size=256';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: InstructorDesign.canvas,
      appBar: const InstructorChromeAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        children: [
          const SizedBox(height: 8),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: InstructorDesign.cardShadow(context),
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: _avatar,
                      width: 112,
                      height: 112,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Container(
                        width: 112,
                        height: 112,
                        color: InstructorDesign.surfaceMuted,
                      ),
                      errorWidget: (_, __, ___) => Container(
                        width: 112,
                        height: 112,
                        color: InstructorDesign.surfaceMuted,
                        alignment: Alignment.center,
                        child: const Icon(Icons.person, size: 48),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -2,
                  bottom: 4,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: InstructorDesign.surface,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.verified_rounded,
                        color: InstructorDesign.primary, size: 22),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Dr. Julian Sterling',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: InstructorDesign.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Senior Architectural Designer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: InstructorDesign.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            decoration: BoxDecoration(
              color: InstructorDesign.surface,
              borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
              boxShadow: InstructorDesign.cardShadow(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatPill(label: 'COURSES', value: '12'),
                _VerticalRule(),
                _StatPill(label: 'STUDENTS', value: '1.4k'),
                _VerticalRule(),
                _StatPill(label: 'RATING', value: '4.9 ★'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _MenuCard(
            children: [
              _MenuTile(icon: Icons.person_outline, title: 'Edit Profile'),
              _MenuTile(icon: Icons.lock_outline_rounded, title: 'Change Password'),
              _MenuTile(icon: Icons.notifications_none_rounded, title: 'Notifications'),
              _MenuTile(
                icon: Icons.palette_outlined,
                title: 'Appearance',
                trailing: Text(
                  'LIGHT',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: InstructorDesign.textTertiary,
                    fontSize: 12,
                  ),
                ),
              ),
              _MenuTile(icon: Icons.help_outline, title: 'Help Center'),
              _MenuTile(icon: Icons.shield_outlined, title: 'Terms & Privacy'),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFE53935),
                side: const BorderSide(color: Color(0xFFE53935), width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(InstructorDesign.radiusControl),
                ),
              ),
              child: const Text(
                'LOGOUT',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalRule extends StatelessWidget {
  const _VerticalRule();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 36,
      color: InstructorDesign.chipInactiveBg,
    );
  }
}

class _StatPill extends StatelessWidget {
  const _StatPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: InstructorDesign.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.6,
            color: InstructorDesign.textTertiary,
          ),
        ),
      ],
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: InstructorDesign.surface,
        borderRadius: BorderRadius.circular(InstructorDesign.radiusCard),
        boxShadow: InstructorDesign.cardShadow(context),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(children: children),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(icon, color: InstructorDesign.textTertiary, size: 22),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: InstructorDesign.textPrimary,
                  ),
                ),
              ),
              trailing ??
                  const Icon(Icons.chevron_right_rounded,
                      color: InstructorDesign.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}
