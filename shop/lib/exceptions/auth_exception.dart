class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'Email already exists',
    'OPERATION_NOT_ALLOWED': 'Operation is not allowed',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Too many attempts, try again later',
    'EMAIL_NOT_FOUND': 'Email was not found',
    'INVALID_PASSWORD': 'Invalid password',
    'USER_DISABLED': 'User account was disabled',
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'An error occurred in the authentication process';
  }
}
