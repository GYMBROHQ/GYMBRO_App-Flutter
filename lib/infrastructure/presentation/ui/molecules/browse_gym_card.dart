import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Enhanced card component for displaying gym information in browse page
/// Design: mobile-first revision from GYMBRO_Docs
class BrowseGymCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double rating;
  final String distance;
  final String priceLevel;
  final bool isOpen;
  final bool isFeatured;
  final bool isNew;
  final List<String> amenities;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final bool isFavorite;

  const BrowseGymCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.distance,
    required this.priceLevel,
    required this.isOpen,
    this.isFeatured = false,
    this.isNew = false,
    required this.amenities,
    this.onTap,
    this.onFavoriteToggle,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: AppBorderRadius.lg,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? DarkAppColors.surfaceElevated1 : Colors.white,
          borderRadius: AppBorderRadius.lg,
          border: isDark
              ? null
              : Border.all(
                  color: AppColors.borderLight,
                  width: 1,
                ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(),
            _buildInfoSection(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        // Image with aspect ratio 16:9
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundTertiary,
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  // Handle image loading error
                },
              ),
            ),
            // Gradient overlay
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ),
        // Badges and favorite button
        Positioned(
          top: AppSpacing.spacing2,
          left: AppSpacing.spacing2,
          right: AppSpacing.spacing2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (isFeatured)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.spacing2,
                        vertical: AppSpacing.spacing1,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary500,
                        borderRadius: AppBorderRadius.sm,
                      ),
                      child: Text(
                        'Featured',
                        style: AppTypography.labelSm.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  if (isFeatured && isNew) SizedBox(width: AppSpacing.spacing2),
                  if (isNew)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSpacing.spacing2,
                        vertical: AppSpacing.spacing1,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success500,
                        borderRadius: AppBorderRadius.sm,
                      ),
                      child: Text(
                        'New',
                        style: AppTypography.labelSm.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
              // Favorite button
              InkWell(
                onTap: onFavoriteToggle,
                child: Container(
                  padding: EdgeInsets.all(AppSpacing.spacing1),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    size: AppIconSizes.sm,
                    color: isFavorite ? AppColors.error500 : AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and rating
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: AppTypography.h5.copyWith(
                    color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: AppSpacing.spacing2),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.spacing2,
                  vertical: AppSpacing.spacing1,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warning500.withValues(alpha: 0.1),
                  borderRadius: AppBorderRadius.sm,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: AppIconSizes.xs,
                      color: AppColors.warning500,
                    ),
                    SizedBox(width: AppSpacing.spacing1),
                    Text(
                      rating.toStringAsFixed(1),
                      style: AppTypography.labelSm.copyWith(
                        color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.spacing2),
          // Distance, price, and status
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: AppIconSizes.xs,
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              ),
              SizedBox(width: AppSpacing.spacing1),
              Text(
                distance,
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                ),
              ),
              SizedBox(width: AppSpacing.spacing2),
              Text(
                '•',
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                ),
              ),
              SizedBox(width: AppSpacing.spacing2),
              Text(
                priceLevel,
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: AppSpacing.spacing2),
              Text(
                '•',
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                ),
              ),
              SizedBox(width: AppSpacing.spacing2),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.spacing2,
                  vertical: AppSpacing.spacing1,
                ),
                decoration: BoxDecoration(
                  color: isOpen
                      ? AppColors.success500.withValues(alpha: 0.1)
                      : AppColors.error500.withValues(alpha: 0.1),
                  borderRadius: AppBorderRadius.sm,
                ),
                child: Text(
                  isOpen ? 'Open' : 'Closed',
                  style: AppTypography.labelSm.copyWith(
                    color: isOpen ? AppColors.success500 : AppColors.error500,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.spacing2),
          // Divider and amenities row
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isDark ? DarkAppColors.borderDefault : AppColors.borderLight,
                  width: 1,
                ),
              ),
            ),
            padding: EdgeInsets.only(top: AppSpacing.spacing3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Amenity icons (show first 4)
                Row(
                  children: amenities.take(4).map((amenity) {
                    return Padding(
                      padding: EdgeInsets.only(right: AppSpacing.spacing4),
                      child: _buildAmenityIcon(amenity, isDark),
                    );
                  }).toList(),
                ),
                // Chevron arrow
                Icon(
                  Icons.chevron_right,
                  size: AppIconSizes.md,
                  color: isDark
                      ? DarkAppColors.textSecondary.withValues(alpha: 0.5)
                      : AppColors.textSecondary.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityIcon(String amenity, bool isDark) {
    IconData icon;
    switch (amenity.toLowerCase()) {
      case 'wifi':
        icon = Icons.wifi;
        break;
      case 'showers':
        icon = Icons.shower;
        break;
      case 'parking':
        icon = Icons.local_parking;
        break;
      case 'sauna':
        icon = Icons.hot_tub;
        break;
      case 'pool':
        icon = Icons.pool;
        break;
      case 'lockers':
        icon = Icons.lock;
        break;
      case 'classes':
      case 'groups':
        icon = Icons.group;
        break;
      default:
        icon = Icons.check_circle;
    }

    return Icon(
      icon,
      size: 18,
      color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
    );
  }
}
