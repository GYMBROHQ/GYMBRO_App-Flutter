// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gymActiveSubscriptionHash() =>
    r'8c6af1c8b5f01b9d49ea114a0b399b66022d86a8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider for fetching user's active subscription for a specific gym
///
/// Copied from [gymActiveSubscription].
@ProviderFor(gymActiveSubscription)
const gymActiveSubscriptionProvider = GymActiveSubscriptionFamily();

/// Provider for fetching user's active subscription for a specific gym
///
/// Copied from [gymActiveSubscription].
class GymActiveSubscriptionFamily extends Family<AsyncValue<Subscription?>> {
  /// Provider for fetching user's active subscription for a specific gym
  ///
  /// Copied from [gymActiveSubscription].
  const GymActiveSubscriptionFamily();

  /// Provider for fetching user's active subscription for a specific gym
  ///
  /// Copied from [gymActiveSubscription].
  GymActiveSubscriptionProvider call(String gymId) {
    return GymActiveSubscriptionProvider(gymId);
  }

  @override
  GymActiveSubscriptionProvider getProviderOverride(
    covariant GymActiveSubscriptionProvider provider,
  ) {
    return call(provider.gymId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gymActiveSubscriptionProvider';
}

/// Provider for fetching user's active subscription for a specific gym
///
/// Copied from [gymActiveSubscription].
class GymActiveSubscriptionProvider
    extends AutoDisposeFutureProvider<Subscription?> {
  /// Provider for fetching user's active subscription for a specific gym
  ///
  /// Copied from [gymActiveSubscription].
  GymActiveSubscriptionProvider(String gymId)
    : this._internal(
        (ref) => gymActiveSubscription(ref as GymActiveSubscriptionRef, gymId),
        from: gymActiveSubscriptionProvider,
        name: r'gymActiveSubscriptionProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$gymActiveSubscriptionHash,
        dependencies: GymActiveSubscriptionFamily._dependencies,
        allTransitiveDependencies:
            GymActiveSubscriptionFamily._allTransitiveDependencies,
        gymId: gymId,
      );

  GymActiveSubscriptionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gymId,
  }) : super.internal();

  final String gymId;

  @override
  Override overrideWith(
    FutureOr<Subscription?> Function(GymActiveSubscriptionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GymActiveSubscriptionProvider._internal(
        (ref) => create(ref as GymActiveSubscriptionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gymId: gymId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Subscription?> createElement() {
    return _GymActiveSubscriptionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GymActiveSubscriptionProvider && other.gymId == gymId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gymId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GymActiveSubscriptionRef on AutoDisposeFutureProviderRef<Subscription?> {
  /// The parameter `gymId` of this provider.
  String get gymId;
}

class _GymActiveSubscriptionProviderElement
    extends AutoDisposeFutureProviderElement<Subscription?>
    with GymActiveSubscriptionRef {
  _GymActiveSubscriptionProviderElement(super.provider);

  @override
  String get gymId => (origin as GymActiveSubscriptionProvider).gymId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
