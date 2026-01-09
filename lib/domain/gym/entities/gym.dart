import '../value_objects/gym_address.dart';
import '../value_objects/gym_coordinates.dart';
import '../value_objects/operating_hours.dart';

/// Gym entity representing a gym in the system
class Gym {
  final String id;
  final String name;
  final String description;
  final String? logoUrl;
  final String? coverPhotoUrl;
  final List<String> photos;
  final GymAddress address;
  final GymCoordinates? coordinates;
  final List<OperatingHours> operatingHours;
  final double? rating;
  final int reviewCount;
  final List<String> amenities;
  final String status;
  final int? priceLevel;
  final double? distance;
  final String? distanceUnit;
  final bool? isOpen;

  const Gym({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.reviewCount,
    required this.amenities,
    required this.status,
    this.logoUrl,
    this.coverPhotoUrl,
    this.photos = const [],
    this.coordinates,
    this.operatingHours = const [],
    this.rating,
    this.priceLevel,
    this.distance,
    this.distanceUnit,
    this.isOpen,
  });

  /// Format distance for display
  String get distanceDisplay {
    if (distance == null) return '—';

    if (distanceUnit == 'km') {
      if (distance! < 1) {
        return '${(distance! * 1000).round()} m';
      } else if (distance! > 100) {
        return '${distance!.round()} km';
      } else {
        return '${distance!.toStringAsFixed(1)} km';
      }
    }

    return '${distance!.toStringAsFixed(1)} $distanceUnit';
  }

  /// Get price level display (e.g., "$", "$$", "$$$", "$$$$")
  String get priceLevelDisplay {
    if (priceLevel == null) return '—';
    return '\$' * priceLevel!;
  }

  Gym copyWith({
    String? id,
    String? name,
    String? description,
    String? logoUrl,
    String? coverPhotoUrl,
    List<String>? photos,
    GymAddress? address,
    GymCoordinates? coordinates,
    List<OperatingHours>? operatingHours,
    double? rating,
    int? reviewCount,
    List<String>? amenities,
    String? status,
    int? priceLevel,
    double? distance,
    String? distanceUnit,
    bool? isOpen,
  }) {
    return Gym(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logoUrl: logoUrl ?? this.logoUrl,
      coverPhotoUrl: coverPhotoUrl ?? this.coverPhotoUrl,
      photos: photos ?? this.photos,
      address: address ?? this.address,
      coordinates: coordinates ?? this.coordinates,
      operatingHours: operatingHours ?? this.operatingHours,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      amenities: amenities ?? this.amenities,
      status: status ?? this.status,
      priceLevel: priceLevel ?? this.priceLevel,
      distance: distance ?? this.distance,
      distanceUnit: distanceUnit ?? this.distanceUnit,
      isOpen: isOpen ?? this.isOpen,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Gym && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Gym(id: $id, name: $name)';
}
