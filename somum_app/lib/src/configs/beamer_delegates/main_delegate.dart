import 'package:somum/src/layouts/dashboard/dashboard_layout.dart';
import 'package:somum/src/layouts/code/code_layout.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

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
        return BeamPage(
          key: const ValueKey('code'),
          type: BeamPageType.fadeTransition,
          child: CodeLayout(),
        );
      },
    },
  ).call,
);
