import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../application/gym/state/gym_browse_state.dart';
import '../../../../../domain/gym/entities/gym.dart';
import '../../../../../domain/gym/value_objects/operating_hours.dart';
import '../../../../providers/providers.dart';
import '../../../config/theme/theme.dart';
import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';

/// Browse Gyms Page - Displays a list of gyms with filtering options
/// Design: mobile-first revision from GYMBRO_Docs
class BrowseGymsPage extends ConsumerStatefulWidget {
  const BrowseGymsPage({super.key});

  @override
  ConsumerState<BrowseGymsPage> createState() => _BrowseGymsPageState();
}

class _BrowseGymsPageState extends ConsumerState<BrowseGymsPage> {
  String selectedFilter = 'All';
  final List<String> filters = ['All', 'Nearby', 'Featured', '24/7', 'Price: Low'];

  @override
  void initState() {
    super.initState();
    // Load gyms when page is first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeLocation();
    });
  }

  Future<void> _initializeLocation() async {
    if (!mounted) return;
    final locationService = ref.read(locationServiceProvider);
    final location = await locationService.getCurrentLocation();
    if (!mounted) return;
    if (location != null) {
      ref.read(selectedLocationProvider.notifier).state = location;
    }
    // Load gyms with or without location
    if (mounted) {
      ref.read(gymBrowseNotifierProvider.notifier).loadGyms(
            location: location,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final gymState = ref.watch(gymBrowseNotifierProvider);

    return Scaffold(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundSecondary,
      appBar: _buildAppBar(context, isDark),
      body: Column(
        children: [
          _buildLocationSelector(isDark),
          _buildFilterChips(isDark),
          Expanded(
            child: _buildContent(gymState, isDark),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(GymBrowseState state, bool isDark) {
    return switch (state) {
      GymBrowseInitial() => const Center(child: Text('Initializing...')),
      GymBrowseLoading() => const Center(child: CircularProgressIndicator()),
      GymBrowseError(message: final message) => _buildError(message, isDark),
      GymBrowseLoaded(gyms: final gyms) => _buildGymList(gyms, isDark),
    };
  }

  Widget _buildError(String message, bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: isDark ? DarkAppColors.error500 : AppColors.error500,
          ),
          SizedBox(height: AppSpacing.spacing4),
          Text(
            'Failed to load gyms',
            style: AppTypography.h6.copyWith(
              color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: AppSpacing.spacing2),
          Text(
            message,
            style: AppTypography.bodyMd.copyWith(
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.spacing4),
          AppButton(
            text: 'Retry',
            onPressed: () {
              ref.read(gymBrowseNotifierProvider.notifier).refresh();
            },
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDark) {
    return AppBar(
      backgroundColor:
          isDark ? DarkAppColors.backgroundPrimary : AppColors.backgroundPrimary,
      elevation: 0,
      leading: AppBackButton(
        onPressed: () => context.pop(),
      ),
      title: Text(
        'Browse Gyms',
        style: AppTypography.h5.copyWith(
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          onPressed: () {
            // TODO: Implement search functionality
          },
        ),
        IconButton(
          icon: const Icon(Icons.tune),
          color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
          onPressed: () {
            // TODO: Implement advanced filter functionality
          },
        ),
        SizedBox(width: AppSpacing.spacing2),
      ],
    );
  }

  Widget _buildLocationSelector(bool isDark) {
    final location = ref.watch(selectedLocationProvider);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.spacing4,
        vertical: AppSpacing.spacing3,
      ),
      child: InkWell(
        onTap: () async {
          final locationService = ref.read(locationServiceProvider);
          final newLocation = await locationService.getCurrentLocation();
          if (newLocation != null) {
            ref.read(selectedLocationProvider.notifier).state = newLocation;
            ref.read(gymBrowseNotifierProvider.notifier).updateLocation(newLocation);
          }
        },
        borderRadius: AppBorderRadius.md,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.spacing3,
            vertical: AppSpacing.spacing2,
          ),
          decoration: BoxDecoration(
            color: isDark
                ? DarkAppColors.surfaceElevated1
                : AppColors.backgroundTertiary,
            borderRadius: AppBorderRadius.md,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on,
                size: AppIconSizes.sm,
                color: AppColors.primary500,
              ),
              SizedBox(width: AppSpacing.spacing2),
              Text(
                location != null ? 'Current Location' : 'Set Location',
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: AppSpacing.spacing1),
              Icon(
                Icons.keyboard_arrow_down,
                size: AppIconSizes.sm,
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips(bool isDark) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing4),
        itemCount: filters.length,
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.spacing2),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;

          return FilterChip(
            label: Text(filter),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                selectedFilter = filter;
              });
              // Apply filter through notifier
              ref.read(gymBrowseNotifierProvider.notifier).applyFilter(filter);
            },
            backgroundColor: isDark
                ? DarkAppColors.surfaceElevated1
                : AppColors.backgroundPrimary,
            selectedColor: AppColors.primary500,
            labelStyle: AppTypography.labelMd.copyWith(
              color: isSelected
                  ? Colors.white
                  : (isDark ? DarkAppColors.textSecondary : AppColors.textSecondary),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.spacing3,
              vertical: AppSpacing.spacing2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: AppBorderRadius.md,
              side: BorderSide(
                color: isSelected
                    ? AppColors.primary500
                    : (isDark ? DarkAppColors.borderDefault : AppColors.borderDefault),
                width: 1,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGymList(List<Gym> gyms, bool isDark) {
    if (gyms.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center,
              size: 64,
              color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
            ),
            SizedBox(height: AppSpacing.spacing4),
            Text(
              'No gyms found',
              style: AppTypography.h6.copyWith(
                color: isDark ? DarkAppColors.textPrimary : AppColors.textPrimary,
              ),
            ),
            SizedBox(height: AppSpacing.spacing2),
            Text(
              'Try adjusting your filters or location',
              style: AppTypography.bodyMd.copyWith(
                color: isDark ? DarkAppColors.textSecondary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(gymBrowseNotifierProvider.notifier).refresh();
      },
      child: ListView.separated(
        padding: EdgeInsets.all(AppSpacing.spacing4),
        itemCount: gyms.length,
        separatorBuilder: (context, index) => SizedBox(height: AppSpacing.spacing4),
        itemBuilder: (context, index) {
          final gym = gyms[index];
          return BrowseGymCard(
            name: gym.name,
            imageUrl: gym.logoUrl ?? gym.coverPhotoUrl ?? '',
            rating: gym.rating ?? 0.0,
            distance: gym.distanceDisplay,
            priceLevel: gym.priceLevelDisplay,
            isOpen: gym.operatingHours.isNotEmpty
                ? OperatingHours.isGymCurrentlyOpen(gym.operatingHours)
                : (gym.isOpen ?? false),
            isFeatured: gym.priceLevel != null && gym.priceLevel! >= 3,
            isNew: false, // TODO: Add isNew logic
            amenities: gym.amenities,
            onTap: () {
              context.push('/gyms/${gym.id}/details');
            },
            onFavoriteToggle: () {
              // TODO: Toggle favorite status
            },
          );
        },
      ),
    );
  }
}
