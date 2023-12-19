import 'package:beamer/beamer.dart';
import 'package:somum/src/layouts/dashboard/pages/dashboard_codes_list_page.dart';
import 'package:flutter/material.dart';

/// Dashboard flow delegate.
BeamerDelegate dashboardDelegate() {
  return BeamerDelegate(
    initialPath: '/dashboard/list',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/dashboard/list': (context, state, data) {
          return const BeamPage(
            key: ValueKey('dashboard-home'),
            type: BeamPageType.fadeTransition,
            child: DashboardCodesListPage(),
          );
        },
      },
    ).call,
  );
}
