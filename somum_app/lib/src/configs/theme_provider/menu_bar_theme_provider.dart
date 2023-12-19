import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class MenuBarThemeProvider extends AbstractedThemeProvider<MenuBarThemeData> {
  static const _style = MenuStyle(
    alignment: AlignmentDirectional.bottomStart,
    elevation: MaterialStatePropertyAll(2),
    maximumSize: MaterialStatePropertyAll(
      Size(double.infinity, 64),
    ),
    minimumSize: MaterialStatePropertyAll(
      Size(double.infinity, 64),
    ),
    mouseCursor: MaterialStatePropertyAll(null),
    padding: MaterialStatePropertyAll(
      EdgeInsetsDirectional.symmetric(
        horizontal: 8,
      ),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(),
    ),
    side: MaterialStatePropertyAll(
      BorderSide.none,
    ),
    visualDensity: VisualDensity.standard,
  );

  MenuBarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  MenuBarThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return MenuBarThemeData(
      style: _style.copyWith(
        backgroundColor: MaterialStatePropertyAll(
          colorScheme.surface,
        ),
        shadowColor: MaterialStatePropertyAll(
          colorScheme.shadow,
        ),
        surfaceTintColor: MaterialStatePropertyAll(
          colorScheme.surfaceTint,
        ),
      ),
    );
  }
}
