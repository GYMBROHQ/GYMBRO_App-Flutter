import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Avatar component for displaying user profile images
class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final VoidCallback? onTap;

  const AppAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 32,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
            width: 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: imageUrl != null
            ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallback(isDark),
              )
            : _buildFallback(isDark),
      ),
    );
  }

  Widget _buildFallback(bool isDark) {
    return Container(
      color: isDark ? DarkAppColors.surfaceElevated2 : AppColors.neutral100,
      child: Center(
        child: Text(
          initials ?? '?',
          style: AppTypography.labelMd.copyWith(
            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
