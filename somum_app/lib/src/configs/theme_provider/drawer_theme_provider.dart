import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class DrawerThemeProvider extends AbstractedThemeProvider<DrawerThemeData> {
  static const _theme = DrawerThemeData(
    elevation: 1,
    endShape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        bottomStart: Radius.circular(16),
        topStart: Radius.circular(16),
      ),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        bottomEnd: Radius.circular(16),
        topEnd: Radius.circular(16),
      ),
    ),
    width: 360,
  );

  DrawerThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  DrawerThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      scrimColor: colorScheme.scrim.withOpacity(0.32),
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
