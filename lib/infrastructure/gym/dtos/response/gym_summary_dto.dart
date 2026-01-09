class GymSummaryDto {
  final String id;
  final String name;
  final String description;
  final String? logoUrl;
  final String? coverPhotoUrl;
  final List<String> photos;
  final GymAddressDto address;
  final GymCoordinatesDto? coordinates;
  final List<OperatingHoursDto> operatingHours;
  final double? rating;
  final int reviewCount;
  final List<String> amenities;
  final String status;
  final int? priceLevel;
  final double? distance;
  final String? distanceUnit;
  final bool? isOpen;

  const GymSummaryDto({
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

  factory GymSummaryDto.fromJson(Map<String, dynamic> json) {
    return GymSummaryDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      logoUrl: json['logoUrl'] as String?,
      coverPhotoUrl: json['coverPhotoUrl'] as String?,
      photos: (json['photos'] as List<dynamic>?)?.cast<String>() ?? [],
      address: GymAddressDto.fromJson(json['address'] as Map<String, dynamic>),
      coordinates: json['coordinates'] != null
          ? GymCoordinatesDto.fromJson(json['coordinates'] as Map<String, dynamic>)
          : null,
      operatingHours: (json['operatingHours'] as List<dynamic>?)
              ?.map((e) => OperatingHoursDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      reviewCount: json['reviewCount'] as int? ?? 0,
      amenities: (json['amenities'] as List<dynamic>?)
              ?.map((e) => e is String ? e : (e as Map<String, dynamic>)['name'] as String)
              .toList() ??
          [],
      status: json['status'] as String,
      priceLevel: json['priceLevel'] as int?,
      distance: json['distance'] != null ? (json['distance'] as num).toDouble() : null,
      distanceUnit: json['distanceUnit'] as String?,
      isOpen: json['isOpen'] as bool?,
    );
  }
}

class OperatingHoursDto {
  final int dayOfWeek;
  final String dayName;
  final bool isOpen;
  final String? openTime;
  final String? closeTime;

  const OperatingHoursDto({
    required this.dayOfWeek,
    required this.dayName,
    required this.isOpen,
    this.openTime,
    this.closeTime,
  });

  factory OperatingHoursDto.fromJson(Map<String, dynamic> json) {
    return OperatingHoursDto(
      dayOfWeek: json['dayOfWeek'] as int,
      dayName: json['dayName'] as String,
      isOpen: json['isOpen'] as bool? ?? false,
      openTime: json['openTime'] as String?,
      closeTime: json['closeTime'] as String?,
    );
  }
}

class GymAddressDto {
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  const GymAddressDto({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  factory GymAddressDto.fromJson(Map<String, dynamic> json) {
    return GymAddressDto(
      street: json['street'] as String? ?? '',
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      postalCode: json['postalCode'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );
  }
}

class GymCoordinatesDto {
  final double latitude;
  final double longitude;

  const GymCoordinatesDto({
    required this.latitude,
    required this.longitude,
  });

  factory GymCoordinatesDto.fromJson(Map<String, dynamic> json) {
    return GymCoordinatesDto(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}
