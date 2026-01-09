// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accessRepositoryHash() => r'dbfedd6b2b87a8e53fdbf3b80bd277fd4defe1b1';

/// Provider for AccessRepository
///
/// Copied from [accessRepository].
@ProviderFor(accessRepository)
final accessRepositoryProvider = AutoDisposeProvider<AccessRepository>.internal(
  accessRepository,
  name: r'accessRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accessRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AccessRepositoryRef = AutoDisposeProviderRef<AccessRepository>;
String _$qRCodeGeneratorHash() => r'7ab08b0dd5ce592f6bd504f3040ee6fdc749206d';

/// Notifier for managing QR code generation with countdown timer
///
/// Copied from [QRCodeGenerator].
@ProviderFor(QRCodeGenerator)
final qRCodeGeneratorProvider =
    AutoDisposeNotifierProvider<QRCodeGenerator, QRCodeState>.internal(
      QRCodeGenerator.new,
      name: r'qRCodeGeneratorProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$qRCodeGeneratorHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$QRCodeGenerator = AutoDisposeNotifier<QRCodeState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
