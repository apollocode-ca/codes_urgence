import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ButtonBarThemeProvider
    extends AbstractedThemeProvider<ButtonBarThemeData> {
  ButtonBarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ButtonBarThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return const ButtonBarThemeData(
      alignment: MainAxisAlignment.center,
      buttonAlignedDropdown: true,
      buttonHeight: 40,
      buttonMinWidth: 64,
      buttonPadding: EdgeInsetsDirectional.symmetric(
        horizontal: 24,
      ),
      buttonTextTheme: ButtonTextTheme.primary,
      layoutBehavior: ButtonBarLayoutBehavior.padded,
      mainAxisSize: MainAxisSize.min,
      overflowDirection: VerticalDirection.down,
    );
  }
}
