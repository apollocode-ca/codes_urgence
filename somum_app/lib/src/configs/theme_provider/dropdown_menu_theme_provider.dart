import 'package:somum/src/configs/theme_provider/input_decoration_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class DropdownMenuThemeProvider extends DropdownMenuThemeProviderInterface {
  static const _menuStyle = MenuStyle(
    alignment: AlignmentDirectional.bottomStart,
    elevation: MaterialStatePropertyAll(2),
    mouseCursor: MaterialStateMouseCursor.clickable,
    padding: MaterialStatePropertyAll(
      EdgeInsetsDirectional.symmetric(
        vertical: 8,
      ),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(4),
        ),
      ),
    ),
    side: MaterialStatePropertyAll(
      BorderSide.none,
    ),
    visualDensity: VisualDensity.standard,
  );

  final InputDecorationThemeProvider inputDecorationThemeProvider;

  DropdownMenuThemeProvider({
    required super.colorSchemeProvider,
    required this.inputDecorationThemeProvider,
  });

  @override
  DropdownMenuThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final inputDecorationTheme = inputDecorationThemeProvider.getFrom(
      brightness,
    );

    return DropdownMenuThemeData(
      inputDecorationTheme: inputDecorationTheme,
      menuStyle: _menuStyle.copyWith(
        backgroundColor: MaterialStatePropertyAll(
          colorScheme.surface,
        ),
        maximumSize: MaterialStatePropertyAll(
          Size(
            inputDecorationTheme.constraints?.maxWidth ?? 280,
            double.infinity,
          ),
        ),
        minimumSize: MaterialStatePropertyAll(
          Size(
            inputDecorationTheme.constraints?.minWidth ?? 112,
            0,
          ),
        ),
        shadowColor: MaterialStatePropertyAll(
          colorScheme.shadow,
        ),
        surfaceTintColor: MaterialStatePropertyAll(
          colorScheme.surfaceTint,
        ),
      ),
      textStyle: inputDecorationTheme.labelStyle,
    );
  }
}
