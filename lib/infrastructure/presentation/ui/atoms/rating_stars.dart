import 'package:flutter/material.dart';
import '../../config/theme/theme.dart';

/// Rating stars display component that can be used for both display and input
class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final bool isInteractive;
  final ValueChanged<double>? onRatingChanged;
  final Color? activeColor;
  final Color? inactiveColor;

  const RatingStars({
    required this.rating,
    super.key,
    this.size = 20,
    this.isInteractive = false,
    this.onRatingChanged,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final active = activeColor ?? AppColors.warning500;
    final inactive = inactiveColor ??
        (isDark ? DarkAppColors.borderDefault : AppColors.borderDefault);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1.0;
        final isFullStar = rating >= starValue;
        final isHalfStar = !isFullStar && rating >= starValue - 0.5;

        return GestureDetector(
          onTap: isInteractive
              ? () => onRatingChanged?.call(starValue)
              : null,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size * 0.05),
            child: Icon(
              isFullStar
                  ? Icons.star
                  : isHalfStar
                      ? Icons.star_half
                      : Icons.star_border,
              size: size,
              color: (isFullStar || isHalfStar) ? active : inactive,
            ),
          ),
        );
      }),
    );
  }
}

/// Interactive rating stars for input
class RatingStarsInput extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double> onRatingChanged;
  final double size;
  final Color? activeColor;
  final Color? inactiveColor;

  const RatingStarsInput({
    required this.onRatingChanged,
    super.key,
    this.initialRating = 0,
    this.size = 32,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  State<RatingStarsInput> createState() => _RatingStarsInputState();
}

class _RatingStarsInputState extends State<RatingStarsInput> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  void _updateRating(double rating) {
    setState(() {
      _currentRating = rating;
    });
    widget.onRatingChanged(rating);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final active = widget.activeColor ?? AppColors.warning500;
    final inactive = widget.inactiveColor ??
        (isDark ? DarkAppColors.borderDefault : AppColors.borderDefault);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        final starValue = index + 1.0;
        final isActive = _currentRating >= starValue;

        return GestureDetector(
          onTap: () => _updateRating(starValue),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.size * 0.1),
            child: Icon(
              isActive ? Icons.star : Icons.star_border,
              size: widget.size,
              color: isActive ? active : inactive,
            ),
          ),
        );
      }),
    );
  }
}
