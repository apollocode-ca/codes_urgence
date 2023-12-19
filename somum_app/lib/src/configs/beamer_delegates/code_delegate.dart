import 'package:beamer/beamer.dart';
import 'package:somum/src/layouts/code/pages/tub_home_page.dart';
import 'package:somum/src/layouts/code/pages/tub_scenes_page.dart';
import 'package:somum/src/layouts/code/pages/tub_settings_page.dart';
import 'package:flutter/material.dart';

/// Dashboard tub delegate.
BeamerDelegate tubDelegate() {
  return BeamerDelegate(
    initialPath: '/code/:code/floors',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/code/:code/floors': (context, state, data) {
          return const BeamPage(
            key: ValueKey('code-floors'),
            type: BeamPageType.fadeTransition,
            child: CodeFloorsPage(),
          );
        },
        '/code/:code/scenes': (context, state, data) {
          return const BeamPage(
            key: ValueKey('code-scenes'),
            type: BeamPageType.fadeTransition,
            child: CodeScenesPage(),
          );
        },
        '/code/:code/rooms': (context, state, data) {
          return const BeamPage(
            key: ValueKey('code-rooms'),
            type: BeamPageType.fadeTransition,
            child: CodeRoomsPage(),
          );
        },
      },
    ).call,
  );
}
