import 'package:somum/src/layouts/dashboard/dashboard_layout.dart';
import 'package:somum/src/layouts/code/code_layout.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:somum/src/utilities/guards/code_guard.dart';
import 'package:somum_utilities/somum_utilities.dart';

final mainDelegate = BeamerDelegate(
  initialPath: '/dashboard/home',
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/dashboard/*': (context, state, data) {
        return BeamPage(
          key: const ValueKey('dashboard'),
          type: BeamPageType.fadeTransition,
          child: DashboardLayout(),
        );
      },
      '/code/:code/*': (context, state, data) {
        var code = state.pathParameters['code'].toString();
        return BeamPage(
          key: const ValueKey('code'),
          type: BeamPageType.fadeTransition,
          child: CodeGuard(
            code: CodeType.values[int.parse(code)],
            body: CodeLayout(),
          ),
        );
      },
    },
  ).call,
);
