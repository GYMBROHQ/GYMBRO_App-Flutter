import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/active_subscription_card.dart';
import '../../organisms/schedule_bottom_sheet.dart';
import '../../organisms/qr_code_bottom_sheet.dart';
import '../../organisms/reviews_list.dart';
import '../../organisms/review_submission_bottom_sheet.dart';
import '../../../../../application/gym/state/gym_details_notifier.dart';
import '../../../../../application/gym/state/gym_subscription_provider.dart';
import '../../../../../application/review/state/review_notifier.dart';
import '../../../../../domain/gym/entities/gym.dart';
import '../../../../../domain/gym/value_objects/operating_hours.dart';
import '../../../../../domain/subscription/entities/subscription.dart' as domain;
import '../../../../providers/providers.dart';

/// Gym Details Page - Displays detailed information about a specific gym
/// Design: mobile-first revision from GYMBRO_Docs
class GymDetailsPage extends ConsumerStatefulWidget {
  final String gymId;

  const GymDetailsPage({
    super.key,
    required this.gymId,
  });

  @override
  ConsumerState<GymDetailsPage> createState() => _GymDetailsPageState();
}

class _GymDetailsPageState extends ConsumerState<GymDetailsPage> {
  bool isFavorite = false;
  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final gymAsync = ref.watch(gymDetailsProvider(widget.gymId));

    return gymAsync.when(
      data: (gym) {
        if (gym == null) {
          return _buildErrorState(isDark, 'Gym not found');
        }
        return _buildContent(isDark, gym);
      },
      loading: () => _buildLoadingState(isDark),
      error: (error, stackTrace) => _buildErrorState(isDark, error.toString()),
    );
  }

  Widget _buildLoadingState(bool isDark) {
    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppBackButton(onPressed: () => context.pop()),
      ),
      body: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildErrorState(bool isDark, String error) {
    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppBackButton(onPressed: () => context.pop()),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.spacing5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: AppColors.error500,
              ),
              SizedBox(height: AppSpacing.spacing3),
              Text(
                'Failed to load gym details',
                style: AppTypography.h5.copyWith(
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
        ),
      ),
    );
  }

  Widget _buildContent(bool isDark, Gym gym) {
    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context, isDark),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageGallery(gym),
                SizedBox(height: AppSpacing.spacing5),
                _buildGymHeader(isDark, gym),
                SizedBox(height: AppSpacing.spacing4),
                // Divider
                Container(
                  height: 1,
                  color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                  margin: EdgeInsets.symmetric(vertical: AppSpacing.spacing4),
                ),
                _buildActiveSubscriptionSection(isDark, gym),
                _buildAboutSection(isDark, gym),
                SizedBox(height: AppSpacing.spacing5),
                _buildAmenitiesSection(isDark, gym),
                SizedBox(height: AppSpacing.spacing5),
                _buildHoursSection(isDark, gym),
                SizedBox(height: AppSpacing.spacing5),
                _buildLocationMapSection(isDark),
                SizedBox(height: AppSpacing.spacing5),
                // Divider
                Container(
                  height: 1,
                  color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                  margin: EdgeInsets.symmetric(vertical: AppSpacing.spacing4),
                ),
                _buildReviewsSection(),
                SizedBox(height: AppSpacing.spacing6),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomCTA(isDark),
    );
  }

  Widget _buildAppBar(BuildContext context, bool isDark) {
    return SliverAppBar(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      elevation: 0,
      pinned: true,
      leading: AppBackButton(
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite
                ? AppColors.error500
                : (isDark ? DarkAppColors.textPrimary : AppColors.textPrimary),
          ),
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          onPressed: () {
            // TODO: Show options menu
          },
        ),
        SizedBox(width: AppSpacing.spacing2),
      ],
    );
  }

  Widget _buildImageGallery(Gym gym) {
    // Use photos if available, otherwise fall back to cover photo
    final images = gym.photos.isNotEmpty
        ? gym.photos
        : (gym.coverPhotoUrl != null ? [gym.coverPhotoUrl!] : <String>[]);

    if (images.isEmpty) {
      return Container(
        height: 280,
        color: AppColors.backgroundTertiary,
        child: Center(
          child: Icon(
            Icons.fitness_center,
            size: 64,
            color: AppColors.neutral400,
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 280,
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentImageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundTertiary,
                ),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.fitness_center,
                        size: 64,
                        color: AppColors.neutral400,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: AppSpacing.spacing3),
        _buildImageIndicators(images.length),
      ],
    );
  }

  Widget _buildImageIndicators(int count) {
    if (count <= 1) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: AppSpacing.spacing1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentImageIndex == index
                ? AppColors.primary500
                : AppColors.borderDefault,
          ),
        ),
      ),
    );
  }

  Widget _buildGymHeader(bool isDark, Gym gym) {
    final hasRating = gym.rating != null && gym.rating! > 0;
    final isOpen = OperatingHours.isGymCurrentlyOpen(gym.operatingHours);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            gym.name,
            style: AppTypography.h3.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: AppSpacing.spacing2),
          // Rating, review count, and gym type
          Row(
            children: [
              Icon(
                Icons.star,
                size: 18,
                color: hasRating ? AppColors.warning500 : AppColors.neutral400,
              ),
              SizedBox(width: AppSpacing.spacing1),
              Text(
                hasRating ? '${gym.rating}' : 'No ratings',
                style: AppTypography.bodyMd.copyWith(
                  color: hasRating ? AppColors.warning500 : AppColors.neutral400,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (hasRating) ...[
                SizedBox(width: AppSpacing.spacing2),
                Text(
                  '(${gym.reviewCount} reviews)',
                  style: AppTypography.bodySm.copyWith(
                    color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                  ),
                ),
              ],
              SizedBox(width: AppSpacing.spacing2),
              Text(
                '•',
                style: AppTypography.bodySm.copyWith(
                  color: isDark ? DarkAppColors.textSecondary.withValues(alpha: 0.4) : AppColors.textSecondary.withValues(alpha: 0.4),
                ),
              ),
              SizedBox(width: AppSpacing.spacing2),
              Text(
                'Gym',
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.primary500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.spacing4),
          // Address with icon in rounded square
          InkWell(
            onTap: () {
              // TODO: Open maps
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundTertiary,
                    borderRadius: AppBorderRadius.lg,
                  ),
                  child: Icon(
                    Icons.location_on,
                    size: 20,
                    color: AppColors.primary500,
                  ),
                ),
                SizedBox(width: AppSpacing.spacing3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gym.address.toString(),
                        style: AppTypography.bodySm.copyWith(
                          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                        ),
                      ),
                      if (gym.distance != null) ...[
                        SizedBox(height: 2),
                        Text(
                          gym.distanceDisplay,
                          style: AppTypography.labelXs.copyWith(
                            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.spacing3),
          // Status with icon in rounded square
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundTertiary,
                  borderRadius: AppBorderRadius.lg,
                ),
                child: Icon(
                  Icons.schedule,
                  size: 20,
                  color: isOpen ? AppColors.success500 : AppColors.error500,
                ),
              ),
              SizedBox(width: AppSpacing.spacing3),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: AppTypography.bodySm,
                    children: [
                      TextSpan(
                        text: isOpen ? 'Open' : 'Closed',
                        style: TextStyle(
                          color: isOpen ? AppColors.success500 : AppColors.error500,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (gym.operatingHours.isNotEmpty) ...[
                        TextSpan(
                          text: ' · ${_getTodayClosingTime(gym)}',
                          style: TextStyle(
                            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              // TODO: Add busy indicator here when API provides the data
              // Example: if (gym.busyLevel != null) Container with busy indicator
            ],
          ),
        ],
      ),
    );
  }

  String _getTodayClosingTime(Gym gym) {
    final now = DateTime.now();
    final todayHours = OperatingHours.getTodayHours(gym.operatingHours, now);
    if (todayHours == null || !todayHours.isOpen) return '';

    // If no close time, return empty
    if (todayHours.closeTime == null) return '';

    // Check if gym is currently open based on current time
    final isCurrentlyOpen = todayHours.isCurrentlyOpen(now);

    if (isCurrentlyOpen) {
      return 'Closes ${todayHours.formattedCloseTime}';
    } else if (todayHours.openTime != null) {
      // Gym is closed but will open later today
      return 'Opens ${todayHours.formattedOpenTime}';
    }

    return '';
  }

  Widget _buildAboutSection(bool isDark, Gym gym) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: AppTypography.h5.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: AppSpacing.spacing2),
          Text(
            gym.description,
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              height: 1.6,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          if (gym.description.length > 150) ...[
            SizedBox(height: AppSpacing.spacing1),
            InkWell(
              onTap: () {
                // TODO: Show full description
              },
              child: Text(
                'Read more',
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.primary500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAmenitiesSection(bool isDark, Gym gym) {
    if (gym.amenities.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amenities & Equipment',
            style: AppTypography.h5.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSpacing.spacing3),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3.5,
            ),
            itemCount: gym.amenities.length,
            itemBuilder: (context, index) {
              final amenity = gym.amenities[index];
              return _buildAmenityItem(amenity, isDark);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityItem(String amenity, bool isDark) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.spacing3),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            _getAmenityIcon(amenity),
            size: AppIconSizes.md,
            color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
          ),
          SizedBox(width: AppSpacing.spacing3),
          Expanded(
            child: Text(
              amenity,
              style: AppTypography.bodyMd.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getAmenityIcon(String amenity) {
    final lowerAmenity = amenity.toLowerCase();
    if (lowerAmenity.contains('wifi')) return Icons.wifi;
    if (lowerAmenity.contains('shower')) return Icons.shower;
    if (lowerAmenity.contains('parking')) return Icons.local_parking;
    if (lowerAmenity.contains('sauna')) return Icons.hot_tub;
    if (lowerAmenity.contains('pool') || lowerAmenity.contains('swimming')) return Icons.pool;
    if (lowerAmenity.contains('locker')) return Icons.lock;
    if (lowerAmenity.contains('equipment') || lowerAmenity.contains('weight')) return Icons.fitness_center;
    if (lowerAmenity.contains('class') || lowerAmenity.contains('group')) return Icons.group;
    if (lowerAmenity.contains('towel')) return Icons.dry_cleaning;
    if (lowerAmenity.contains('air') || lowerAmenity.contains('ac')) return Icons.ac_unit;
    if (lowerAmenity.contains('cafe') || lowerAmenity.contains('juice')) return Icons.local_cafe;
    if (lowerAmenity.contains('trainer') || lowerAmenity.contains('personal')) return Icons.person;
    if (lowerAmenity.contains('cardio')) return Icons.directions_run;
    if (lowerAmenity.contains('yoga') || lowerAmenity.contains('stretch')) return Icons.self_improvement;
    return Icons.check_circle_outline;
  }

  Widget _buildHoursSection(bool isDark, Gym gym) {
    final todayHours = OperatingHours.getTodayHours(gym.operatingHours, DateTime.now());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing5),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.spacing4),
        decoration: BoxDecoration(
          color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TODAY\'S HOURS',
                  style: AppTypography.labelXs.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: AppSpacing.spacing1),
                Text(
                  todayHours?.formattedHours ?? 'Not available',
                  style: AppTypography.bodyMd.copyWith(
                    color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            if (gym.operatingHours.isNotEmpty)
              TextButton(
                onPressed: () => _showFullScheduleSheet(gym),
                child: Text(
                  'View full schedule',
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showFullScheduleSheet(Gym gym) {
    // Convert OperatingHours list to Map<String, String> for the bottom sheet
    final hoursMap = <String, String>{};
    for (final hours in gym.operatingHours) {
      hoursMap[hours.dayName] = hours.formattedHours;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ScheduleBottomSheet(hours: hoursMap),
    );
  }

  Widget _buildActiveSubscriptionSection(bool isDark, Gym gym) {
    final subscriptionAsync = ref.watch(gymActiveSubscriptionProvider(widget.gymId));

    return subscriptionAsync.when(
      data: (subscription) {
        if (subscription == null) return const SizedBox.shrink();

        return Padding(
          padding: EdgeInsets.only(
            left: AppSpacing.spacing5,
            right: AppSpacing.spacing5,
            bottom: AppSpacing.spacing5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Membership',
                style: AppTypography.h5.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: AppSpacing.spacing3),
              ActiveSubscriptionCard(
                gymName: gym.name,
                planType: subscription.planName,
                expiryText: _formatExpiryDate(subscription.endDate),
                status: _mapSubscriptionStatus(subscription),
                isExpiring: subscription.isExpiringSoon,
                warningText: subscription.isExpiringSoon
                    ? '${subscription.daysRemaining} days left'
                    : null,
                showRenewButton: subscription.canRenew && subscription.isExpiringSoon,
                onGenerateQR: () => _navigateToQRGeneration(subscription, gym),
                onRenew: () => _navigateToRenewal(subscription),
                onViewDetails: () => _navigateToSubscriptionDetails(subscription),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (error, stackTrace) => const SizedBox.shrink(),
    );
  }

  String _formatExpiryDate(DateTime date) {
    final formatter = DateFormat('MMM d, yyyy');
    return 'Expires ${formatter.format(date)}';
  }

  SubscriptionStatus _mapSubscriptionStatus(domain.Subscription subscription) {
    if (subscription.isExpiringSoon) {
      return SubscriptionStatus.expiring;
    }
    switch (subscription.status) {
      case domain.SubscriptionStatus.active:
        return SubscriptionStatus.active;
      case domain.SubscriptionStatus.expired:
        return SubscriptionStatus.expired;
      case domain.SubscriptionStatus.cancelled:
        return SubscriptionStatus.canceled;
      case domain.SubscriptionStatus.pendingPayment:
        return SubscriptionStatus.pending;
      case domain.SubscriptionStatus.suspended:
        return SubscriptionStatus.expired;
    }
  }

  void _navigateToQRGeneration(domain.Subscription subscription, Gym gym) {
    final authState = ref.read(authNotifierProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;

    if (user == null) return;

    // Get user initials
    final initials = user.fullName != null && user.fullName!.isNotEmpty
        ? user.fullName!
            .split(' ')
            .where((word) => word.isNotEmpty)
            .take(2)
            .map((word) => word[0].toUpperCase())
            .join()
        : 'U';

    final gymLocation = '${gym.address.street}, ${gym.address.city}, ${gym.address.state}';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QRCodeBottomSheet(
        subscriptionId: subscription.id,
        gymId: subscription.gymId,
        gymName: gym.name,
        gymLocation: gymLocation,
        userName: user.fullName ?? 'User',
        userInitials: initials,
        gymImageUrl: gym.photos.isNotEmpty ? gym.photos.first : gym.coverPhotoUrl,
      ),
    );
  }

  void _navigateToRenewal(domain.Subscription subscription) {
    context.push('/subscriptions/${subscription.id}/renew');
  }

  void _navigateToSubscriptionDetails(domain.Subscription subscription) {
    context.push('/subscriptions/${subscription.id}/details');
  }

  Widget _buildLocationMapSection(bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: AppTypography.h5.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: AppSpacing.spacing3),
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundTertiary,
              border: Border.all(
                color: isDark ? DarkAppColors.borderDefault : AppColors.borderDefault,
                width: 1,
              ),
            ),
            child: Stack(
              children: [
                // Map placeholder with gradient
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        isDark ? DarkAppColors.surfaceElevated2 : AppColors.backgroundTertiary,
                        isDark ? DarkAppColors.surfaceElevated1 : AppColors.backgroundSecondary,
                      ],
                    ),
                  ),
                ),
                // Location pin
                Center(
                  child: Icon(
                    Icons.location_on,
                    size: 36,
                    color: AppColors.primary500,
                  ),
                ),
                // Directions button
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.spacing3,
                      vertical: AppSpacing.spacing2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: AppBorderRadius.md,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.directions,
                          size: 16,
                          color: Colors.black,
                        ),
                        SizedBox(width: AppSpacing.spacing1),
                        Text(
                          'Get Directions',
                          style: AppTypography.labelSm.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    final authState = ref.watch(authNotifierProvider);
    final currentAuthId =
        authState is AuthAuthenticated ? authState.user.id : null;

    return ReviewsList(
      gymId: widget.gymId,
      currentAuthId: currentAuthId,
      onWriteReview: () => _showReviewSubmissionDialog(),
    );
  }

  void _showReviewSubmissionDialog() {
    final authState = ref.read(authNotifierProvider);
    if (authState is! AuthAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please log in to write a review'),
        ),
      );
      return;
    }

    // Check if user has a subscription to this gym
    final subscriptionAsync =
        ref.read(gymActiveSubscriptionProvider(widget.gymId));
    final hasSubscription = subscriptionAsync.hasValue &&
        subscriptionAsync.value != null;

    // Get existing review if any
    final userReviewAsync =
        ref.read(userReviewForGymProvider(widget.gymId));
    final existingReview =
        userReviewAsync.hasValue ? userReviewAsync.value : null;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ReviewSubmissionBottomSheet(
        gymId: widget.gymId,
        existingReview: existingReview,
        hasEligibility: hasSubscription,
      ),
    );
  }

  Widget _buildBottomCTA(bool isDark) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.spacing4),
      decoration: BoxDecoration(
        color: isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
        boxShadow: AppShadows.card,
      ),
      child: SafeArea(
        child: AppButton(
          text: 'View Plans',
          onPressed: () {
            context.push('/gyms/${widget.gymId}/plans');
          },
          isFullWidth: true,
        ),
      ),
    );
  }
}
