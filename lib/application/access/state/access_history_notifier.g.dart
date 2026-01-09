// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_history_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accessHistoryHash() => r'4c126b2651f7ccec7ec4f74af9e4ba71d8acbd62';

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

abstract class _$AccessHistory
    extends BuildlessAutoDisposeAsyncNotifier<AccessLogsResult> {
  late final String gymId;
  late final String? subscriptionId;
  late final int page;
  late final int limit;

  FutureOr<AccessLogsResult> build({
    required String gymId,
    String? subscriptionId,
    int page = 1,
    int limit = 20,
  });
}

/// Notifier for access history (logs) for a specific subscription
///
/// Copied from [AccessHistory].
@ProviderFor(AccessHistory)
const accessHistoryProvider = AccessHistoryFamily();

/// Notifier for access history (logs) for a specific subscription
///
/// Copied from [AccessHistory].
class AccessHistoryFamily extends Family<AsyncValue<AccessLogsResult>> {
  /// Notifier for access history (logs) for a specific subscription
  ///
  /// Copied from [AccessHistory].
  const AccessHistoryFamily();

  /// Notifier for access history (logs) for a specific subscription
  ///
  /// Copied from [AccessHistory].
  AccessHistoryProvider call({
    required String gymId,
    String? subscriptionId,
    int page = 1,
    int limit = 20,
  }) {
    return AccessHistoryProvider(
      gymId: gymId,
      subscriptionId: subscriptionId,
      page: page,
      limit: limit,
    );
  }

  @override
  AccessHistoryProvider getProviderOverride(
    covariant AccessHistoryProvider provider,
  ) {
    return call(
      gymId: provider.gymId,
      subscriptionId: provider.subscriptionId,
      page: provider.page,
      limit: provider.limit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'accessHistoryProvider';
}

/// Notifier for access history (logs) for a specific subscription
///
/// Copied from [AccessHistory].
class AccessHistoryProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<AccessHistory, AccessLogsResult> {
  /// Notifier for access history (logs) for a specific subscription
  ///
  /// Copied from [AccessHistory].
  AccessHistoryProvider({
    required String gymId,
    String? subscriptionId,
    int page = 1,
    int limit = 20,
  }) : this._internal(
         () => AccessHistory()
           ..gymId = gymId
           ..subscriptionId = subscriptionId
           ..page = page
           ..limit = limit,
         from: accessHistoryProvider,
         name: r'accessHistoryProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$accessHistoryHash,
         dependencies: AccessHistoryFamily._dependencies,
         allTransitiveDependencies:
             AccessHistoryFamily._allTransitiveDependencies,
         gymId: gymId,
         subscriptionId: subscriptionId,
         page: page,
         limit: limit,
       );

  AccessHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gymId,
    required this.subscriptionId,
    required this.page,
    required this.limit,
  }) : super.internal();

  final String gymId;
  final String? subscriptionId;
  final int page;
  final int limit;

  @override
  FutureOr<AccessLogsResult> runNotifierBuild(
    covariant AccessHistory notifier,
  ) {
    return notifier.build(
      gymId: gymId,
      subscriptionId: subscriptionId,
      page: page,
      limit: limit,
    );
  }

  @override
  Override overrideWith(AccessHistory Function() create) {
    return ProviderOverride(
      origin: this,
      override: AccessHistoryProvider._internal(
        () => create()
          ..gymId = gymId
          ..subscriptionId = subscriptionId
          ..page = page
          ..limit = limit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gymId: gymId,
        subscriptionId: subscriptionId,
        page: page,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AccessHistory, AccessLogsResult>
  createElement() {
    return _AccessHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccessHistoryProvider &&
        other.gymId == gymId &&
        other.subscriptionId == subscriptionId &&
        other.page == page &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gymId.hashCode);
    hash = _SystemHash.combine(hash, subscriptionId.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AccessHistoryRef
    on AutoDisposeAsyncNotifierProviderRef<AccessLogsResult> {
  /// The parameter `gymId` of this provider.
  String get gymId;

  /// The parameter `subscriptionId` of this provider.
  String? get subscriptionId;

  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _AccessHistoryProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<AccessHistory, AccessLogsResult>
    with AccessHistoryRef {
  _AccessHistoryProviderElement(super.provider);

  @override
  String get gymId => (origin as AccessHistoryProvider).gymId;
  @override
  String? get subscriptionId =>
      (origin as AccessHistoryProvider).subscriptionId;
  @override
  int get page => (origin as AccessHistoryProvider).page;
  @override
  int get limit => (origin as AccessHistoryProvider).limit;
}

String _$allAccessHistoryHash() => r'255288055d7aea209d94de583c69bca86f2f0b71';

abstract class _$AllAccessHistory
    extends BuildlessAutoDisposeAsyncNotifier<AccessLogsResult> {
  late final int page;
  late final int limit;

  FutureOr<AccessLogsResult> build({int page = 1, int limit = 20});
}

/// Notifier for all access history (logs) across all user subscriptions
///
/// Copied from [AllAccessHistory].
@ProviderFor(AllAccessHistory)
const allAccessHistoryProvider = AllAccessHistoryFamily();

/// Notifier for all access history (logs) across all user subscriptions
///
/// Copied from [AllAccessHistory].
class AllAccessHistoryFamily extends Family<AsyncValue<AccessLogsResult>> {
  /// Notifier for all access history (logs) across all user subscriptions
  ///
  /// Copied from [AllAccessHistory].
  const AllAccessHistoryFamily();

  /// Notifier for all access history (logs) across all user subscriptions
  ///
  /// Copied from [AllAccessHistory].
  AllAccessHistoryProvider call({int page = 1, int limit = 20}) {
    return AllAccessHistoryProvider(page: page, limit: limit);
  }

  @override
  AllAccessHistoryProvider getProviderOverride(
    covariant AllAccessHistoryProvider provider,
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
  String? get name => r'allAccessHistoryProvider';
}

/// Notifier for all access history (logs) across all user subscriptions
///
/// Copied from [AllAccessHistory].
class AllAccessHistoryProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          AllAccessHistory,
          AccessLogsResult
        > {
  /// Notifier for all access history (logs) across all user subscriptions
  ///
  /// Copied from [AllAccessHistory].
  AllAccessHistoryProvider({int page = 1, int limit = 20})
    : this._internal(
        () => AllAccessHistory()
          ..page = page
          ..limit = limit,
        from: allAccessHistoryProvider,
        name: r'allAccessHistoryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$allAccessHistoryHash,
        dependencies: AllAccessHistoryFamily._dependencies,
        allTransitiveDependencies:
            AllAccessHistoryFamily._allTransitiveDependencies,
        page: page,
        limit: limit,
      );

  AllAccessHistoryProvider._internal(
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
  FutureOr<AccessLogsResult> runNotifierBuild(
    covariant AllAccessHistory notifier,
  ) {
    return notifier.build(page: page, limit: limit);
  }

  @override
  Override overrideWith(AllAccessHistory Function() create) {
    return ProviderOverride(
      origin: this,
      override: AllAccessHistoryProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AllAccessHistory, AccessLogsResult>
  createElement() {
    return _AllAccessHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllAccessHistoryProvider &&
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
mixin AllAccessHistoryRef
    on AutoDisposeAsyncNotifierProviderRef<AccessLogsResult> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _AllAccessHistoryProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          AllAccessHistory,
          AccessLogsResult
        >
    with AllAccessHistoryRef {
  _AllAccessHistoryProviderElement(super.provider);

  @override
  int get page => (origin as AllAccessHistoryProvider).page;
  @override
  int get limit => (origin as AllAccessHistoryProvider).limit;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
