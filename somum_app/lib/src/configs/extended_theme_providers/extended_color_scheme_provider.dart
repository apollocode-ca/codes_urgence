import 'dart:ui';

import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';

class ExtendedColorSchemeProvider extends ExtendedColorSchemeProviderInterface {
  final _dark = const ExtendedColorScheme(
    surfaceTintColor: Color(0xFF9428B6),
  );

  final _light = const ExtendedColorScheme(
    surfaceTintColor: Color(0xFFF0B0FF),
  );

  @override
  ExtendedColorScheme getFrom(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return _dark;
    }

    return _light;
  }
}
