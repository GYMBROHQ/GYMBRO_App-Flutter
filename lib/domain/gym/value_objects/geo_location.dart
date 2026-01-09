/// Value object representing a geographic location
class GeoLocation {
  final double latitude;
  final double longitude;
  final double? radiusKm;

  const GeoLocation({
    required this.latitude,
    required this.longitude,
    this.radiusKm,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoLocation &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          radiusKm == other.radiusKm;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ radiusKm.hashCode;

  @override
  String toString() => 'GeoLocation(lat: $latitude, lng: $longitude, radius: ${radiusKm ?? "N/A"}km)';
}
