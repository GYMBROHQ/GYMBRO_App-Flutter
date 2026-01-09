// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$planRepositoryHash() => r'e308c0b18793d5cee30403628ec77857c12b1b73';

/// Provider for PlanRepository
///
/// Copied from [planRepository].
@ProviderFor(planRepository)
final planRepositoryProvider = AutoDisposeProvider<PlanRepository>.internal(
  planRepository,
  name: r'planRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$planRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlanRepositoryRef = AutoDisposeProviderRef<PlanRepository>;
String _$gymPlansHash() => r'85950d655b09a19fd88b24a9335b5453f282c56f';

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

abstract class _$GymPlans
    extends BuildlessAutoDisposeAsyncNotifier<List<Plan>> {
  late final String gymId;

  FutureOr<List<Plan>> build(String gymId);
}

/// Notifier for managing gym plans
///
/// Copied from [GymPlans].
@ProviderFor(GymPlans)
const gymPlansProvider = GymPlansFamily();

/// Notifier for managing gym plans
///
/// Copied from [GymPlans].
class GymPlansFamily extends Family<AsyncValue<List<Plan>>> {
  /// Notifier for managing gym plans
  ///
  /// Copied from [GymPlans].
  const GymPlansFamily();

  /// Notifier for managing gym plans
  ///
  /// Copied from [GymPlans].
  GymPlansProvider call(String gymId) {
    return GymPlansProvider(gymId);
  }

  @override
  GymPlansProvider getProviderOverride(covariant GymPlansProvider provider) {
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
  String? get name => r'gymPlansProvider';
}

/// Notifier for managing gym plans
///
/// Copied from [GymPlans].
class GymPlansProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GymPlans, List<Plan>> {
  /// Notifier for managing gym plans
  ///
  /// Copied from [GymPlans].
  GymPlansProvider(String gymId)
    : this._internal(
        () => GymPlans()..gymId = gymId,
        from: gymPlansProvider,
        name: r'gymPlansProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$gymPlansHash,
        dependencies: GymPlansFamily._dependencies,
        allTransitiveDependencies: GymPlansFamily._allTransitiveDependencies,
        gymId: gymId,
      );

  GymPlansProvider._internal(
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
  FutureOr<List<Plan>> runNotifierBuild(covariant GymPlans notifier) {
    return notifier.build(gymId);
  }

  @override
  Override overrideWith(GymPlans Function() create) {
    return ProviderOverride(
      origin: this,
      override: GymPlansProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<GymPlans, List<Plan>>
  createElement() {
    return _GymPlansProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GymPlansProvider && other.gymId == gymId;
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
mixin GymPlansRef on AutoDisposeAsyncNotifierProviderRef<List<Plan>> {
  /// The parameter `gymId` of this provider.
  String get gymId;
}

class _GymPlansProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GymPlans, List<Plan>>
    with GymPlansRef {
  _GymPlansProviderElement(super.provider);

  @override
  String get gymId => (origin as GymPlansProvider).gymId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
