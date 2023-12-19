import 'package:auth0_flutter/auth0_flutter.dart';

class Auth0AuthenticationService {
  final String auth0Domain;
  final String auth0ClientId;
  String? _refreshToken;
  late final auth0 = Auth0(auth0Domain, auth0ClientId);

  Auth0AuthenticationService({
    required this.auth0Domain,
    required this.auth0ClientId,
  }) {
    auth0.credentialsManager.credentials().then((credentials) {
      _refreshToken = credentials.refreshToken;
    });
  }

  Future<bool> init() async {
    return true;
  }

  String? get refreshToken => null;

  Future<String?> get token async =>
      (await auth0.credentialsManager.credentials()).idToken;

  Future confirmPasswordReset(String code, String password) async {}

  Future disconnectUser([void Function()? redirect]) async {}

  Future<bool> isAuth() async {
    return await auth0.credentialsManager.hasValidCredentials();
  }

  Future<String> registerUser(String email, String newPassword,
      {String? displayName}) async {
    throw UnimplementedError();
  }

  Future sendPasswordResetEmail(String email) async {}

  Future<String?> login() async {
    final credentials = await auth0.webAuthentication().login();
    await auth0.credentialsManager.storeCredentials(credentials);
    return null;
  }
}
