import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';
import '../atoms/rating_stars.dart';
import '../../../../../domain/review/entities/review.dart';

/// Card component for displaying a single gym review
class ReviewCard extends StatelessWidget {
  final Review review;
  final bool isUserReview;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ReviewCard({
    required this.review,
    super.key,
    this.isUserReview = false,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(AppSpacing.spacing4),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary500.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    _getInitials(review.reviewerName),
                    style: AppTypography.labelMd.copyWith(
                      color: AppColors.primary500,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppSpacing.spacing3),
              // Reviewer info and rating
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          review.reviewerName ?? 'Anonymous',
                          style: AppTypography.bodyMd.copyWith(
                            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (isUserReview)
                          PopupMenuButton<String>(
                            icon: Icon(
                              Icons.more_vert,
                              size: 20,
                              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                            ),
                            onSelected: (value) {
                              if (value == 'edit') {
                                onEdit?.call();
                              } else if (value == 'delete') {
                                onDelete?.call();
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, size: 18, color: AppColors.textPrimary),
                                    SizedBox(width: AppSpacing.spacing2),
                                    const Text('Edit'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    Icon(Icons.delete, size: 18, color: AppColors.error500),
                                    SizedBox(width: AppSpacing.spacing2),
                                    Text('Delete', style: TextStyle(color: AppColors.error500)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.spacing1),
                    Row(
                      children: [
                        RatingStars(
                          rating: review.rating,
                          size: 14,
                        ),
                        SizedBox(width: AppSpacing.spacing2),
                        Text(
                          review.formattedDate,
                          style: AppTypography.labelXs.copyWith(
                            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (review.comment != null && review.comment!.isNotEmpty) ...[
            SizedBox(height: AppSpacing.spacing3),
            Text(
              review.comment!,
              style: AppTypography.bodySm.copyWith(
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _getInitials(String? name) {
    if (name == null || name.isEmpty) return 'A';
    final parts = name.split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return 'A';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }
}
