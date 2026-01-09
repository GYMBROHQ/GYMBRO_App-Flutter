/// Filter options for browsing gyms
class GymFilters {
  final String? selectedFilter; // 'All', 'Nearby', 'Featured', '24/7', 'Price: Low'
  final double? maxRadius; // km
  final bool? isOpenNow;
  final int? maxPriceLevel; // 1-4
  final bool? featuredOnly;

  const GymFilters({
    this.selectedFilter,
    this.maxRadius,
    this.isOpenNow,
    this.maxPriceLevel,
    this.featuredOnly,
  });

  /// Create filters with "All" selected (no filters applied)
  factory GymFilters.all() => const GymFilters(selectedFilter: 'All');

  /// Create filters for nearby gyms (within 5km)
  factory GymFilters.nearby() => const GymFilters(
        selectedFilter: 'Nearby',
        maxRadius: 5.0,
      );

  /// Create filters for featured gyms only
  factory GymFilters.featured() => const GymFilters(
        selectedFilter: 'Featured',
        featuredOnly: true,
      );

  /// Create filters for 24/7 gyms only
  factory GymFilters.open247() => const GymFilters(
        selectedFilter: '24/7',
        isOpenNow: true,
      );

  /// Create filters for budget-friendly gyms (price level <= 2)
  factory GymFilters.priceLow() => const GymFilters(
        selectedFilter: 'Price: Low',
        maxPriceLevel: 2,
      );

  GymFilters copyWith({
    String? selectedFilter,
    double? maxRadius,
    bool? isOpenNow,
    int? maxPriceLevel,
    bool? featuredOnly,
  }) {
    return GymFilters(
      selectedFilter: selectedFilter ?? this.selectedFilter,
      maxRadius: maxRadius ?? this.maxRadius,
      isOpenNow: isOpenNow ?? this.isOpenNow,
      maxPriceLevel: maxPriceLevel ?? this.maxPriceLevel,
      featuredOnly: featuredOnly ?? this.featuredOnly,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GymFilters &&
          runtimeType == other.runtimeType &&
          selectedFilter == other.selectedFilter &&
          maxRadius == other.maxRadius &&
          isOpenNow == other.isOpenNow &&
          maxPriceLevel == other.maxPriceLevel &&
          featuredOnly == other.featuredOnly;

  @override
  int get hashCode =>
      selectedFilter.hashCode ^
      maxRadius.hashCode ^
      isOpenNow.hashCode ^
      maxPriceLevel.hashCode ^
      featuredOnly.hashCode;
}
