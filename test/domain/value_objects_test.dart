import 'package:flutter_test/flutter_test.dart';
import 'package:gymbro/domain/auth/exceptions/domain_exceptions.dart';
import 'package:gymbro/domain/auth/value_objects/email.dart';
import 'package:gymbro/domain/auth/value_objects/password.dart';
import 'package:gymbro/domain/auth/value_objects/totp_code.dart';
import 'package:gymbro/domain/gym/value_objects/gym_filters.dart';
import 'package:gymbro/domain/gym/value_objects/operating_hours.dart';

void main() {
  group('Email', () {
    test('normalizes valid addresses before storing them', () {
      final email = Email.create('  MEMBER@Example.COM ');

      expect(email.value, 'member@example.com');
      expect(email.toString(), 'member@example.com');
    });

    test('rejects addresses without a valid domain suffix', () {
      expect(
        () => Email.create('member@example'),
        throwsA(isA<InvalidEmailException>()),
      );
      expect(Email.isValid('member@example'), isFalse);
    });
  });

  group('Password', () {
    test('accepts a password meeting every minimum requirement', () {
      final password = Password.create('SecurePass1');

      expect(password.value, 'SecurePass1');
      expect(password.strength, PasswordStrength.medium);
      expect(Password.isValid('SecurePass1'), isTrue);
    });

    test('reports each unmet requirement for a short password', () {
      expect(Password.getFailedRequirements('short'), <String>[
        'Must be at least 8 characters',
        'Must contain an uppercase letter',
        'Must contain a number',
      ]);
      expect(
        () => Password.create('short'),
        throwsA(isA<InvalidPasswordException>()),
      );
    });
  });

  group('TotpCode', () {
    test('trims and preserves a valid six-digit code', () {
      final code = TotpCode.create(' 012345 ');

      expect(code.value, '012345');
      expect(TotpCode.isValid('012345'), isTrue);
    });

    test('rejects codes with non-numeric characters or the wrong length', () {
      expect(TotpCode.isValid('12345'), isFalse);
      expect(TotpCode.isValid('12345a'), isFalse);
      expect(
        () => TotpCode.create('12345a'),
        throwsA(isA<InvalidTotpCodeException>()),
      );
    });
  });

  test('nearby gym filters carry their intended radius and can be copied', () {
    final nearby = GymFilters.nearby();

    expect(nearby.selectedFilter, 'Nearby');
    expect(nearby.maxRadius, 5.0);
    expect(
      nearby.copyWith(maxRadius: 2.5),
      const GymFilters(selectedFilter: 'Nearby', maxRadius: 2.5),
    );
  });

  test('operating hours format times and enforce the closing boundary', () {
    final hours = OperatingHours(
      dayOfWeek: 1,
      dayName: 'Monday',
      isOpen: true,
      openTime: '06:05',
      closeTime: '22:00',
    );

    expect(hours.formattedHours, '6:05 AM - 10:00 PM');
    expect(hours.isCurrentlyOpen(DateTime(2025, 1, 6, 6, 5)), isTrue);
    expect(hours.isCurrentlyOpen(DateTime(2025, 1, 6, 22)), isFalse);
  });
}
