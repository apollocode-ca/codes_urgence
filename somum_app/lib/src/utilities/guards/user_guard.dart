import 'package:somum/src/configs/services.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum_utilities/somum_utilities.dart';
import 'package:flutter/material.dart';

class UserGuard extends StatelessWidget {
  final Widget body;
  final Widget loading;
  final Widget notFound;
  final String? userId;

  const UserGuard({
    super.key,
    required this.body,
    this.loading = const LoadingScreen(),
    this.notFound = const NotFound(),
    this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Guard<User>(
      body: body,
      future: services.user.findById(userId ?? 'me'),
      localStoreKey: 'user${userId != null ? '_$userId' : '_me'}',
      onDataNotFound: () => notFound,
      onDataLoading: () => loading,
    );
  }
}
