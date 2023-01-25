import 'package:local_auth/local_auth.dart';

class AppLockHelper {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> hasEnrolledBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    if (availableBiometrics.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final bool authenticated = await _auth.authenticate(
      localizedReason: 'Please authenticate to Continue.',
      options: const AuthenticationOptions(biometricOnly: true),
    );
    return authenticated;
  }
}
