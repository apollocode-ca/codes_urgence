import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class PopupMenuThemeProvider
    extends AbstractedThemeProvider<PopupMenuThemeData> {
  static const _theme = PopupMenuThemeData(
    elevation: 2,
    enableFeedback: true,
    mouseCursor: MaterialStateMouseCursor.clickable,
    position: PopupMenuPosition.under,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(4),
      ),
    ),
  );

  final TextThemeProvider textThemeProvider;

  PopupMenuThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  PopupMenuThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final labelLarge = textThemeProvider.theme.labelLarge;
    return _theme.copyWith(
      color: colorScheme.surface,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return labelLarge?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        return labelLarge?.copyWith(
          color: colorScheme.onSurface,
        );
      }),
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
      textStyle: labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
