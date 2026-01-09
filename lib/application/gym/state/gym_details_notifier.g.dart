// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gym_details_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gymRepositoryHash() => r'373c6e0bb0b6e525b29cefb4f8fd2ecd3cc3283a';

/// Provider for GymRepository
///
/// Copied from [gymRepository].
@ProviderFor(gymRepository)
final gymRepositoryProvider = AutoDisposeProvider<GymRepositoryPort>.internal(
  gymRepository,
  name: r'gymRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gymRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GymRepositoryRef = AutoDisposeProviderRef<GymRepositoryPort>;
String _$gymDetailsHash() => r'ed6776c0e7e361044ced79855b6f3313055dab45';

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

abstract class _$GymDetails extends BuildlessAutoDisposeAsyncNotifier<Gym?> {
  late final String gymId;

  FutureOr<Gym?> build(String gymId);
}

/// Notifier for managing gym details
///
/// Copied from [GymDetails].
@ProviderFor(GymDetails)
const gymDetailsProvider = GymDetailsFamily();

/// Notifier for managing gym details
///
/// Copied from [GymDetails].
class GymDetailsFamily extends Family<AsyncValue<Gym?>> {
  /// Notifier for managing gym details
  ///
  /// Copied from [GymDetails].
  const GymDetailsFamily();

  /// Notifier for managing gym details
  ///
  /// Copied from [GymDetails].
  GymDetailsProvider call(String gymId) {
    return GymDetailsProvider(gymId);
  }

  @override
  GymDetailsProvider getProviderOverride(
    covariant GymDetailsProvider provider,
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
  String? get name => r'gymDetailsProvider';
}

/// Notifier for managing gym details
///
/// Copied from [GymDetails].
class GymDetailsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GymDetails, Gym?> {
  /// Notifier for managing gym details
  ///
  /// Copied from [GymDetails].
  GymDetailsProvider(String gymId)
    : this._internal(
        () => GymDetails()..gymId = gymId,
        from: gymDetailsProvider,
        name: r'gymDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$gymDetailsHash,
        dependencies: GymDetailsFamily._dependencies,
        allTransitiveDependencies: GymDetailsFamily._allTransitiveDependencies,
        gymId: gymId,
      );

  GymDetailsProvider._internal(
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
  FutureOr<Gym?> runNotifierBuild(covariant GymDetails notifier) {
    return notifier.build(gymId);
  }

  @override
  Override overrideWith(GymDetails Function() create) {
    return ProviderOverride(
      origin: this,
      override: GymDetailsProvider._internal(
        () => create()..gymId = gymId,
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
  AutoDisposeAsyncNotifierProviderElement<GymDetails, Gym?> createElement() {
    return _GymDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GymDetailsProvider && other.gymId == gymId;
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
mixin GymDetailsRef on AutoDisposeAsyncNotifierProviderRef<Gym?> {
  /// The parameter `gymId` of this provider.
  String get gymId;
}

class _GymDetailsProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GymDetails, Gym?>
    with GymDetailsRef {
  _GymDetailsProviderElement(super.provider);

  @override
  String get gymId => (origin as GymDetailsProvider).gymId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
