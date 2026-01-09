import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme/theme.dart';
import '../molecules/review_card.dart';
import '../atoms/rating_stars.dart';
import '../../../../../application/review/state/review_notifier.dart';
import '../../../../../domain/review/entities/review.dart';

/// Organism for displaying a list of gym reviews with pagination
class ReviewsList extends ConsumerStatefulWidget {
  final String gymId;
  final String? currentAuthId;
  final VoidCallback? onWriteReview;

  const ReviewsList({
    required this.gymId,
    super.key,
    this.currentAuthId,
    this.onWriteReview,
  });

  @override
  ConsumerState<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends ConsumerState<ReviewsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _loadMore();
    }
  }

  void _loadMore() {
    final notifier = ref.read(gymReviewsProvider(widget.gymId).notifier);
    notifier.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final reviewsAsync = ref.watch(gymReviewsProvider(widget.gymId));

    return reviewsAsync.when(
      data: (result) {
        if (result.reviews.isEmpty) {
          return _buildEmptyState(isDark);
        }

        final averageRating =
            result.reviews.fold<double>(0, (sum, r) => sum + r.rating) /
                result.reviews.length;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(isDark, result.totalCount, averageRating),
            SizedBox(height: AppSpacing.spacing4),
            _buildReviewsList(result.reviews),
          ],
        );
      },
      loading: () => _buildLoadingState(),
      error: (error, stackTrace) => _buildErrorState(isDark, error.toString()),
    );
  }

  Widget _buildHeader(bool isDark, int reviewCount, double averageRating) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews',
                style: AppTypography.h5.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (widget.onWriteReview != null)
                TextButton(
                  onPressed: widget.onWriteReview,
                  child: Text(
                    'Write Review',
                    style: AppTypography.bodyMd.copyWith(
                      color: AppColors.primary500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: AppSpacing.spacing2),
          Row(
            children: [
              Text(
                averageRating.toStringAsFixed(1),
                style: AppTypography.h3.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: AppSpacing.spacing3),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingStars(
                    rating: averageRating,
                    size: 16,
                  ),
                  SizedBox(height: AppSpacing.spacing1),
                  Text(
                    '$reviewCount ${reviewCount == 1 ? 'review' : 'reviews'}',
                    style: AppTypography.labelSm.copyWith(
                      color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsList(List<Review> reviews) {
    return ListView.separated(
      controller: _scrollController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing5),
      itemCount: reviews.length,
      separatorBuilder: (context, index) => SizedBox(height: AppSpacing.spacing3),
      itemBuilder: (context, index) {
        final review = reviews[index];
        final isUserReview = widget.currentAuthId != null &&
            review.authId == widget.currentAuthId;

        return ReviewCard(
          review: review,
          isUserReview: isUserReview,
          onEdit: isUserReview ? () => widget.onWriteReview?.call() : null,
          onDelete: isUserReview ? () => _showDeleteConfirmation(review) : null,
        );
      },
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.spacing5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews',
                style: AppTypography.h5.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (widget.onWriteReview != null)
                TextButton(
                  onPressed: widget.onWriteReview,
                  child: Text(
                    'Write Review',
                    style: AppTypography.bodyMd.copyWith(
                      color: AppColors.primary500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: AppSpacing.spacing4),
          Center(
            child: Column(
              children: [
                Icon(
                  Icons.rate_review_outlined,
                  size: 64,
                  color: isDark ? DarkAppColors.textMuted : AppColors.neutral400,
                ),
                SizedBox(height: AppSpacing.spacing3),
                Text(
                  'No reviews yet',
                  style: AppTypography.bodyMd.copyWith(
                    color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: AppSpacing.spacing2),
                Text(
                  'Be the first to review this gym',
                  style: AppTypography.bodySm.copyWith(
                    color: isDark ? DarkAppColors.textMuted : AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.spacing5),
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorState(bool isDark, String error) {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.spacing5),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: AppColors.error500,
          ),
          SizedBox(height: AppSpacing.spacing3),
          Text(
            'Failed to load reviews',
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSpacing.spacing2),
          Text(
            error,
            style: AppTypography.bodySm.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(Review review) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark
            ? DarkAppColors.surfaceElevated1
            : AppColors.backgroundPrimary,
        title: Text(
          'Delete Review',
          style: AppTypography.h6.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to delete your review? This action cannot be undone.',
          style: AppTypography.bodyMd.copyWith(
            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteReview();
            },
            child: Text(
              'Delete',
              style: TextStyle(color: AppColors.error500),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteReview() async {
    try {
      final notifier =
          ref.read(userReviewForGymProvider(widget.gymId).notifier);
      await notifier.deleteReview();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Review deleted successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete review: $e'),
            backgroundColor: AppColors.error500,
          ),
        );
      }
    }
  }
}
