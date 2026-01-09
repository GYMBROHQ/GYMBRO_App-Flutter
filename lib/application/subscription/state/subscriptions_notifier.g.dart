// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriptions_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subscriptionRepositoryHash() =>
    r'1c5ec5ab9f0c3c29fc9ecac3fb6bcf4d1a1ee20f';

/// Provider for SubscriptionRepository
///
/// Copied from [subscriptionRepository].
@ProviderFor(subscriptionRepository)
final subscriptionRepositoryProvider =
    AutoDisposeProvider<SubscriptionRepository>.internal(
      subscriptionRepository,
      name: r'subscriptionRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$subscriptionRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SubscriptionRepositoryRef =
    AutoDisposeProviderRef<SubscriptionRepository>;
String _$subscriptionByIdHash() => r'1a5962372f6e0acfcb5242c8424277187702718c';

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

/// Provider for fetching a single subscription by ID
///
/// Copied from [subscriptionById].
@ProviderFor(subscriptionById)
const subscriptionByIdProvider = SubscriptionByIdFamily();

/// Provider for fetching a single subscription by ID
///
/// Copied from [subscriptionById].
class SubscriptionByIdFamily extends Family<AsyncValue<Subscription>> {
  /// Provider for fetching a single subscription by ID
  ///
  /// Copied from [subscriptionById].
  const SubscriptionByIdFamily();

  /// Provider for fetching a single subscription by ID
  ///
  /// Copied from [subscriptionById].
  SubscriptionByIdProvider call(String subscriptionId) {
    return SubscriptionByIdProvider(subscriptionId);
  }

  @override
  SubscriptionByIdProvider getProviderOverride(
    covariant SubscriptionByIdProvider provider,
  ) {
    return call(provider.subscriptionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subscriptionByIdProvider';
}

/// Provider for fetching a single subscription by ID
///
/// Copied from [subscriptionById].
class SubscriptionByIdProvider extends AutoDisposeFutureProvider<Subscription> {
  /// Provider for fetching a single subscription by ID
  ///
  /// Copied from [subscriptionById].
  SubscriptionByIdProvider(String subscriptionId)
    : this._internal(
        (ref) => subscriptionById(ref as SubscriptionByIdRef, subscriptionId),
        from: subscriptionByIdProvider,
        name: r'subscriptionByIdProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$subscriptionByIdHash,
        dependencies: SubscriptionByIdFamily._dependencies,
        allTransitiveDependencies:
            SubscriptionByIdFamily._allTransitiveDependencies,
        subscriptionId: subscriptionId,
      );

  SubscriptionByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subscriptionId,
  }) : super.internal();

  final String subscriptionId;

  @override
  Override overrideWith(
    FutureOr<Subscription> Function(SubscriptionByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubscriptionByIdProvider._internal(
        (ref) => create(ref as SubscriptionByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subscriptionId: subscriptionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Subscription> createElement() {
    return _SubscriptionByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubscriptionByIdProvider &&
        other.subscriptionId == subscriptionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subscriptionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubscriptionByIdRef on AutoDisposeFutureProviderRef<Subscription> {
  /// The parameter `subscriptionId` of this provider.
  String get subscriptionId;
}

class _SubscriptionByIdProviderElement
    extends AutoDisposeFutureProviderElement<Subscription>
    with SubscriptionByIdRef {
  _SubscriptionByIdProviderElement(super.provider);

  @override
  String get subscriptionId =>
      (origin as SubscriptionByIdProvider).subscriptionId;
}

String _$userSubscriptionsHash() => r'f9d13a3dcb5baa543975bcb1a093d03a0df7e47b';

abstract class _$UserSubscriptions
    extends BuildlessAutoDisposeAsyncNotifier<List<Subscription>> {
  late final bool activeOnly;

  FutureOr<List<Subscription>> build({bool activeOnly = false});
}

/// Notifier for managing user subscriptions
///
/// Copied from [UserSubscriptions].
@ProviderFor(UserSubscriptions)
const userSubscriptionsProvider = UserSubscriptionsFamily();

/// Notifier for managing user subscriptions
///
/// Copied from [UserSubscriptions].
class UserSubscriptionsFamily extends Family<AsyncValue<List<Subscription>>> {
  /// Notifier for managing user subscriptions
  ///
  /// Copied from [UserSubscriptions].
  const UserSubscriptionsFamily();

  /// Notifier for managing user subscriptions
  ///
  /// Copied from [UserSubscriptions].
  UserSubscriptionsProvider call({bool activeOnly = false}) {
    return UserSubscriptionsProvider(activeOnly: activeOnly);
  }

  @override
  UserSubscriptionsProvider getProviderOverride(
    covariant UserSubscriptionsProvider provider,
  ) {
    return call(activeOnly: provider.activeOnly);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userSubscriptionsProvider';
}

/// Notifier for managing user subscriptions
///
/// Copied from [UserSubscriptions].
class UserSubscriptionsProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          UserSubscriptions,
          List<Subscription>
        > {
  /// Notifier for managing user subscriptions
  ///
  /// Copied from [UserSubscriptions].
  UserSubscriptionsProvider({bool activeOnly = false})
    : this._internal(
        () => UserSubscriptions()..activeOnly = activeOnly,
        from: userSubscriptionsProvider,
        name: r'userSubscriptionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userSubscriptionsHash,
        dependencies: UserSubscriptionsFamily._dependencies,
        allTransitiveDependencies:
            UserSubscriptionsFamily._allTransitiveDependencies,
        activeOnly: activeOnly,
      );

  UserSubscriptionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.activeOnly,
  }) : super.internal();

  final bool activeOnly;

  @override
  FutureOr<List<Subscription>> runNotifierBuild(
    covariant UserSubscriptions notifier,
  ) {
    return notifier.build(activeOnly: activeOnly);
  }

  @override
  Override overrideWith(UserSubscriptions Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserSubscriptionsProvider._internal(
        () => create()..activeOnly = activeOnly,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        activeOnly: activeOnly,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserSubscriptions, List<Subscription>>
  createElement() {
    return _UserSubscriptionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserSubscriptionsProvider && other.activeOnly == activeOnly;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, activeOnly.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserSubscriptionsRef
    on AutoDisposeAsyncNotifierProviderRef<List<Subscription>> {
  /// The parameter `activeOnly` of this provider.
  bool get activeOnly;
}

class _UserSubscriptionsProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          UserSubscriptions,
          List<Subscription>
        >
    with UserSubscriptionsRef {
  _UserSubscriptionsProviderElement(super.provider);

  @override
  bool get activeOnly => (origin as UserSubscriptionsProvider).activeOnly;
}

String _$subscriptionHistoryHash() =>
    r'e2e463e1e691a46477c48e22ff8ba2a934b7655d';

abstract class _$SubscriptionHistory
    extends BuildlessAutoDisposeAsyncNotifier<SubscriptionHistoryResult> {
  late final int page;
  late final int limit;

  FutureOr<SubscriptionHistoryResult> build({int page = 1, int limit = 20});
}

/// Notifier for subscription history
///
/// Copied from [SubscriptionHistory].
@ProviderFor(SubscriptionHistory)
const subscriptionHistoryProvider = SubscriptionHistoryFamily();

/// Notifier for subscription history
///
/// Copied from [SubscriptionHistory].
class SubscriptionHistoryFamily
    extends Family<AsyncValue<SubscriptionHistoryResult>> {
  /// Notifier for subscription history
  ///
  /// Copied from [SubscriptionHistory].
  const SubscriptionHistoryFamily();

  /// Notifier for subscription history
  ///
  /// Copied from [SubscriptionHistory].
  SubscriptionHistoryProvider call({int page = 1, int limit = 20}) {
    return SubscriptionHistoryProvider(page: page, limit: limit);
  }

  @override
  SubscriptionHistoryProvider getProviderOverride(
    covariant SubscriptionHistoryProvider provider,
  ) {
    return call(page: provider.page, limit: provider.limit);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subscriptionHistoryProvider';
}

/// Notifier for subscription history
///
/// Copied from [SubscriptionHistory].
class SubscriptionHistoryProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          SubscriptionHistory,
          SubscriptionHistoryResult
        > {
  /// Notifier for subscription history
  ///
  /// Copied from [SubscriptionHistory].
  SubscriptionHistoryProvider({int page = 1, int limit = 20})
    : this._internal(
        () => SubscriptionHistory()
          ..page = page
          ..limit = limit,
        from: subscriptionHistoryProvider,
        name: r'subscriptionHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$subscriptionHistoryHash,
        dependencies: SubscriptionHistoryFamily._dependencies,
        allTransitiveDependencies:
            SubscriptionHistoryFamily._allTransitiveDependencies,
        page: page,
        limit: limit,
      );

  SubscriptionHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.limit,
  }) : super.internal();

  final int page;
  final int limit;

  @override
  FutureOr<SubscriptionHistoryResult> runNotifierBuild(
    covariant SubscriptionHistory notifier,
  ) {
    return notifier.build(page: page, limit: limit);
  }

  @override
  Override overrideWith(SubscriptionHistory Function() create) {
    return ProviderOverride(
      origin: this,
      override: SubscriptionHistoryProvider._internal(
        () => create()
          ..page = page
          ..limit = limit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    SubscriptionHistory,
    SubscriptionHistoryResult
  >
  createElement() {
    return _SubscriptionHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubscriptionHistoryProvider &&
        other.page == page &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SubscriptionHistoryRef
    on AutoDisposeAsyncNotifierProviderRef<SubscriptionHistoryResult> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _SubscriptionHistoryProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          SubscriptionHistory,
          SubscriptionHistoryResult
        >
    with SubscriptionHistoryRef {
  _SubscriptionHistoryProviderElement(super.provider);

  @override
  int get page => (origin as SubscriptionHistoryProvider).page;
  @override
  int get limit => (origin as SubscriptionHistoryProvider).limit;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
