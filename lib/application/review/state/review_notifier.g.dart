// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewRepositoryHash() => r'3988e7af900f66a85041babd32fa14146b593d73';

/// Provider for ReviewRepository
///
/// Copied from [reviewRepository].
@ProviderFor(reviewRepository)
final reviewRepositoryProvider = AutoDisposeProvider<ReviewRepository>.internal(
  reviewRepository,
  name: r'reviewRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reviewRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReviewRepositoryRef = AutoDisposeProviderRef<ReviewRepository>;
String _$gymReviewsHash() => r'bcd760b6804c56953f23e4767355d26095f5e355';

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

abstract class _$GymReviews
    extends BuildlessAutoDisposeAsyncNotifier<ReviewListResult> {
  late final String gymId;

  FutureOr<ReviewListResult> build(String gymId);
}

/// Notifier for managing gym reviews list
///
/// Copied from [GymReviews].
@ProviderFor(GymReviews)
const gymReviewsProvider = GymReviewsFamily();

/// Notifier for managing gym reviews list
///
/// Copied from [GymReviews].
class GymReviewsFamily extends Family<AsyncValue<ReviewListResult>> {
  /// Notifier for managing gym reviews list
  ///
  /// Copied from [GymReviews].
  const GymReviewsFamily();

  /// Notifier for managing gym reviews list
  ///
  /// Copied from [GymReviews].
  GymReviewsProvider call(String gymId) {
    return GymReviewsProvider(gymId);
  }

  @override
  GymReviewsProvider getProviderOverride(
    covariant GymReviewsProvider provider,
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
  String? get name => r'gymReviewsProvider';
}

/// Notifier for managing gym reviews list
///
/// Copied from [GymReviews].
class GymReviewsProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GymReviews, ReviewListResult> {
  /// Notifier for managing gym reviews list
  ///
  /// Copied from [GymReviews].
  GymReviewsProvider(String gymId)
    : this._internal(
        () => GymReviews()..gymId = gymId,
        from: gymReviewsProvider,
        name: r'gymReviewsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$gymReviewsHash,
        dependencies: GymReviewsFamily._dependencies,
        allTransitiveDependencies: GymReviewsFamily._allTransitiveDependencies,
        gymId: gymId,
      );

  GymReviewsProvider._internal(
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
  FutureOr<ReviewListResult> runNotifierBuild(covariant GymReviews notifier) {
    return notifier.build(gymId);
  }

  @override
  Override overrideWith(GymReviews Function() create) {
    return ProviderOverride(
      origin: this,
      override: GymReviewsProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<GymReviews, ReviewListResult>
  createElement() {
    return _GymReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GymReviewsProvider && other.gymId == gymId;
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
mixin GymReviewsRef on AutoDisposeAsyncNotifierProviderRef<ReviewListResult> {
  /// The parameter `gymId` of this provider.
  String get gymId;
}

class _GymReviewsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<GymReviews, ReviewListResult>
    with GymReviewsRef {
  _GymReviewsProviderElement(super.provider);

  @override
  String get gymId => (origin as GymReviewsProvider).gymId;
}

String _$userReviewForGymHash() => r'3d0de1d193a7d888b66581f7ddb4f6b959c5ca52';

abstract class _$UserReviewForGym
    extends BuildlessAutoDisposeAsyncNotifier<Review?> {
  late final String gymId;

  FutureOr<Review?> build(String gymId);
}

/// Notifier for managing user's review for a gym
///
/// Copied from [UserReviewForGym].
@ProviderFor(UserReviewForGym)
const userReviewForGymProvider = UserReviewForGymFamily();

/// Notifier for managing user's review for a gym
///
/// Copied from [UserReviewForGym].
class UserReviewForGymFamily extends Family<AsyncValue<Review?>> {
  /// Notifier for managing user's review for a gym
  ///
  /// Copied from [UserReviewForGym].
  const UserReviewForGymFamily();

  /// Notifier for managing user's review for a gym
  ///
  /// Copied from [UserReviewForGym].
  UserReviewForGymProvider call(String gymId) {
    return UserReviewForGymProvider(gymId);
  }

  @override
  UserReviewForGymProvider getProviderOverride(
    covariant UserReviewForGymProvider provider,
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
  String? get name => r'userReviewForGymProvider';
}

/// Notifier for managing user's review for a gym
///
/// Copied from [UserReviewForGym].
class UserReviewForGymProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserReviewForGym, Review?> {
  /// Notifier for managing user's review for a gym
  ///
  /// Copied from [UserReviewForGym].
  UserReviewForGymProvider(String gymId)
    : this._internal(
        () => UserReviewForGym()..gymId = gymId,
        from: userReviewForGymProvider,
        name: r'userReviewForGymProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userReviewForGymHash,
        dependencies: UserReviewForGymFamily._dependencies,
        allTransitiveDependencies:
            UserReviewForGymFamily._allTransitiveDependencies,
        gymId: gymId,
      );

  UserReviewForGymProvider._internal(
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
  FutureOr<Review?> runNotifierBuild(covariant UserReviewForGym notifier) {
    return notifier.build(gymId);
  }

  @override
  Override overrideWith(UserReviewForGym Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserReviewForGymProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<UserReviewForGym, Review?>
  createElement() {
    return _UserReviewForGymProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserReviewForGymProvider && other.gymId == gymId;
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
mixin UserReviewForGymRef on AutoDisposeAsyncNotifierProviderRef<Review?> {
  /// The parameter `gymId` of this provider.
  String get gymId;
}

class _UserReviewForGymProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserReviewForGym, Review?>
    with UserReviewForGymRef {
  _UserReviewForGymProviderElement(super.provider);

  @override
  String get gymId => (origin as UserReviewForGymProvider).gymId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
