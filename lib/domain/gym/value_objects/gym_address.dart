/// Value object representing a gym's physical address
class GymAddress {
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;

  const GymAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GymAddress &&
          runtimeType == other.runtimeType &&
          street == other.street &&
          city == other.city &&
          state == other.state &&
          postalCode == other.postalCode &&
          country == other.country;

  @override
  int get hashCode =>
      street.hashCode ^
      city.hashCode ^
      state.hashCode ^
      postalCode.hashCode ^
      country.hashCode;

  @override
  String toString() => '$street, $city, $state $postalCode, $country';
}
