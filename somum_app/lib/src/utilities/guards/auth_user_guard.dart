import 'package:somum/src/configs/services.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum_utilities/somum_utilities.dart';
import 'package:beamer/beamer.dart' hide NotFound;
import 'package:flutter/material.dart';

class AuthUserGuard extends StatelessWidget {
  final Widget body;
  final Widget loading;
  final Widget notFound;
  final String pathToLogin;

  const AuthUserGuard({
    super.key,
    required this.body,
    required this.pathToLogin,
    this.loading = const LoadingScreen(),
    this.notFound = const NotFound(),
  });

  Widget _goToLogin(BuildContext context) {
    Future.delayed(
      Duration.zero,
      () {
        context.beamToReplacementNamed(pathToLogin);
      },
    );
    return const LoadingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Guard<User>(
      body: body,
      future: services.user.findById('me'),
      localStoreKey: 'auth_user',
      onDataNotFound: () => _goToLogin(context),
      onDataLoading: () => loading,
    );
  }
}
