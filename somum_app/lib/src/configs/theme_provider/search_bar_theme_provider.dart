import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class SearchBarThemeProvider
    extends AbstractedThemeProvider<SearchBarThemeData> {
  static const _theme = SearchBarThemeData(
    constraints: BoxConstraints(
      minHeight: 56,
      minWidth: 360,
      maxHeight: 56,
      maxWidth: 720,
    ),
    elevation: MaterialStatePropertyAll(3),
    overlayColor: MaterialStatePropertyAll(
      Colors.transparent,
    ),
    padding: MaterialStatePropertyAll(
      EdgeInsetsDirectional.symmetric(
        horizontal: 16,
      ),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(28),
        ),
      ),
    ),
    side: MaterialStatePropertyAll(
      BorderSide.none,
    ),
  );

  final TextThemeProvider textThemeProvider;

  SearchBarThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  SearchBarThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final bodyLarge = textThemeProvider.theme.bodyLarge;
    return _theme.copyWith(
      backgroundColor: MaterialStatePropertyAll(
        colorScheme.surface,
      ),
      hintStyle: MaterialStatePropertyAll(
        bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      shadowColor: MaterialStatePropertyAll(
        colorScheme.shadow,
      ),
      surfaceTintColor: MaterialStatePropertyAll(
        colorScheme.surfaceTint,
      ),
      textStyle: MaterialStatePropertyAll(
        bodyLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
