import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/theme/theme.dart';
import '../atoms/atoms.dart';
import '../molecules/alert_banner.dart';
import '../../../../../application/review/state/review_notifier.dart';
import '../../../../../domain/review/entities/review.dart';

/// Bottom sheet for submitting or editing a gym review
class ReviewSubmissionBottomSheet extends ConsumerStatefulWidget {
  final String gymId;
  final Review? existingReview;
  final bool hasEligibility;

  const ReviewSubmissionBottomSheet({
    required this.gymId,
    super.key,
    this.existingReview,
    this.hasEligibility = true,
  });

  @override
  ConsumerState<ReviewSubmissionBottomSheet> createState() =>
      _ReviewSubmissionBottomSheetState();
}

class _ReviewSubmissionBottomSheetState
    extends ConsumerState<ReviewSubmissionBottomSheet> {
  late double _rating;
  late TextEditingController _commentController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _rating = widget.existingReview?.rating ?? 0;
    _commentController =
        TextEditingController(text: widget.existingReview?.comment);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? DarkAppColors.backgroundPrimary
            : AppColors.backgroundPrimary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.only(
        bottom: mediaQuery.viewInsets.bottom,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.spacing5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(isDark),
                SizedBox(height: AppSpacing.spacing5),
                if (!widget.hasEligibility) ...[
                  AlertBanner.warning(
                    title: 'Subscription Required',
                    subtitle:
                        'You need an active subscription to review this gym',
                  ),
                  SizedBox(height: AppSpacing.spacing4),
                ],
                _buildRatingSection(isDark),
                SizedBox(height: AppSpacing.spacing5),
                _buildCommentSection(isDark),
                SizedBox(height: AppSpacing.spacing5),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.existingReview != null ? 'Edit Review' : 'Write a Review',
          style: AppTypography.h5.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.close,
            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Widget _buildRatingSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Rating',
          style: AppTypography.bodyMd.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.spacing3),
        Center(
          child: Column(
            children: [
              RatingStarsInput(
                initialRating: _rating,
                size: 40,
                onRatingChanged: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              SizedBox(height: AppSpacing.spacing2),
              Text(
                _getRatingText(_rating),
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.primary500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommentSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Review (Optional)',
          style: AppTypography.bodyMd.copyWith(
            color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSpacing.spacing3),
        AppTextField(
          controller: _commentController,
          hint: 'Share your experience with this gym...',
          maxLines: 5,
          maxLength: 1000,
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    final canSubmit = _rating > 0 && !_isSubmitting && widget.hasEligibility;

    return AppButton(
      text: widget.existingReview != null ? 'Update Review' : 'Submit Review',
      onPressed: canSubmit ? _submitReview : null,
      isFullWidth: true,
      isLoading: _isSubmitting,
    );
  }

  String _getRatingText(double rating) {
    if (rating == 0) return 'Select a rating';
    if (rating <= 1) return 'Poor';
    if (rating <= 2) return 'Fair';
    if (rating <= 3) return 'Good';
    if (rating <= 4) return 'Very Good';
    return 'Excellent';
  }

  Future<void> _submitReview() async {
    if (_rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a rating')),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final notifier =
          ref.read(userReviewForGymProvider(widget.gymId).notifier);
      await notifier.submitReview(
        rating: _rating,
        comment: _commentController.text.trim().isEmpty
            ? null
            : _commentController.text.trim(),
      );

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.existingReview != null
                  ? 'Review updated successfully'
                  : 'Review submitted successfully',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit review: $e'),
            backgroundColor: AppColors.error500,
          ),
        );
      }
    }
  }
}
