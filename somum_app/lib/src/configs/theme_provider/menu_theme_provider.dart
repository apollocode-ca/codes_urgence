import 'package:somum/src/configs/theme_provider/menu_button_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class MenuThemeProvider extends AbstractedThemeProvider<MenuThemeData> {
  static const _style = MenuStyle(
    alignment: AlignmentDirectional(
      1,
      -1 - 8 * 2 / MenuButtonThemeProvider.height,
    ),
    elevation: MaterialStatePropertyAll(2),
    minimumSize: MaterialStatePropertyAll(
      Size(112, 0),
    ),
    maximumSize: MaterialStatePropertyAll(
      Size(280, double.infinity),
    ),
    padding: MaterialStatePropertyAll(
      EdgeInsetsDirectional.symmetric(
        vertical: 8,
      ),
    ),
    side: MaterialStatePropertyAll(
      BorderSide.none,
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(4),
        ),
      ),
    ),
    visualDensity: VisualDensity.standard,
  );

  MenuThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  MenuThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return MenuThemeData(
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
