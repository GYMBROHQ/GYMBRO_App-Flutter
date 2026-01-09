// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentMethodRepositoryHash() =>
    r'18b9e0b15d62d3f772091f86cf62b182fed0fbf8';

/// Provider for PaymentMethodRepository
///
/// Copied from [paymentMethodRepository].
@ProviderFor(paymentMethodRepository)
final paymentMethodRepositoryProvider =
    AutoDisposeProvider<PaymentMethodRepository>.internal(
      paymentMethodRepository,
      name: r'paymentMethodRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentMethodRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PaymentMethodRepositoryRef =
    AutoDisposeProviderRef<PaymentMethodRepository>;
String _$stripeServiceHash() => r'52f25decd5bbfb6036f578ca578a85b9d27497ac';

/// Provider for StripeService
///
/// Copied from [stripeService].
@ProviderFor(stripeService)
final stripeServiceProvider = AutoDisposeProvider<StripeService>.internal(
  stripeService,
  name: r'stripeServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stripeServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StripeServiceRef = AutoDisposeProviderRef<StripeService>;
String _$paymentMethodsHash() => r'04bff32ba455dd34faf2d45c95e3e81ccde1361c';

/// Notifier for managing payment methods
///
/// Copied from [PaymentMethods].
@ProviderFor(PaymentMethods)
final paymentMethodsProvider =
    AutoDisposeAsyncNotifierProvider<
      PaymentMethods,
      List<PaymentMethod>
    >.internal(
      PaymentMethods.new,
      name: r'paymentMethodsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$paymentMethodsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PaymentMethods = AutoDisposeAsyncNotifier<List<PaymentMethod>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
