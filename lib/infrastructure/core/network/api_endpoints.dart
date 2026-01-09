/// API endpoint constants
class ApiEndpoints {
  ApiEndpoints._();

  /// Base URL for the API - should be configured per environment
  static const String baseUrl = 'http://192.168.1.252:4000';

  /// Auth endpoints
  static const String authBase = '/app/auth';
  static const String register = '$authBase/register';
  static const String login = '$authBase/login';
  static const String logout = '$authBase/logout';
  static const String logoutAll = '$authBase/logout/all';
  static const String refresh = '$authBase/refresh';
  static const String me = '$authBase/me';
  static const String sessions = '$authBase/sessions';

  /// MFA endpoints
  static const String mfaSetupInitiate = '$authBase/mfa/setup/initiate';
  static const String mfaSetupComplete = '$authBase/mfa/setup/complete';
  static const String mfaVerify = '$authBase/mfa/verify';
  static const String mfaDisable = '$authBase/mfa/disable';

  /// Password reset endpoints
  static const String passwordRequestReset = '$authBase/password/request-reset';
  static const String passwordReset = '$authBase/password/reset';

  /// User profile endpoints
  static const String usersBase = '/users';
  static const String profile = '$usersBase/profile';

  /// Gym endpoints
  static const String gymsBase = '/gyms';
  static const String browseGyms = gymsBase;
  static String gymDetails(String id) => '$gymsBase/$id';
  static String gymPlans(String gymId) => '$gymsBase/$gymId/plans';

  /// Subscription endpoints
  static const String subscriptionsBase = '/subscriptions';
  static const String subscriptions = subscriptionsBase;
  static String subscriptionDetails(String id) => '$subscriptionsBase/$id';
  static String cancelSubscription(String id) => '$subscriptionsBase/$id/cancel';
  static String renewSubscription(String id) => '$subscriptionsBase/$id/renew';
  static String pauseSubscription(String id) => '$subscriptionsBase/$id/pause';
  static String resumeSubscription(String id) => '$subscriptionsBase/$id/resume';
  static const String subscriptionHistory = '$subscriptionsBase/history';

  /// Payment method endpoints
  static const String paymentMethodsBase = '/payment-methods';
  static const String paymentMethods = paymentMethodsBase;
  static const String setupIntent = '$paymentMethodsBase/setup-intent';
  static String removePaymentMethod(String id) => '$paymentMethodsBase/$id';
  static String setDefaultPaymentMethod(String id) => '$paymentMethodsBase/$id/default';

  /// Access control endpoints
  static const String accessBase = '/access';
  static const String generateQR = '$accessBase/qr/generate';
  static const String accessLogs = '$accessBase/log';
  static String applyPromoCode(String subscriptionId) => '$subscriptionsBase/$subscriptionId/promo';

  /// Review endpoints
  static String gymReviews(String gymId) => '/app/gyms/$gymId/reviews';
  static String myGymReview(String gymId) => '/app/gyms/$gymId/reviews/mine';
}
