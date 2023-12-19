import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ListTileThemeProvider extends AbstractedThemeProvider<ListTileThemeData> {
  static const _theme = ListTileThemeData(
    contentPadding: EdgeInsetsDirectional.only(
      bottom: 8,
      end: 24,
      start: 16,
      top: 8,
    ),
    dense: false,
    enableFeedback: true,
    horizontalTitleGap: 16,
    minLeadingWidth: 24,
    minVerticalPadding: 0,
    mouseCursor: MaterialStateMouseCursor.clickable,
    shape: RoundedRectangleBorder(),
    style: ListTileStyle.list,
    titleAlignment: ListTileTitleAlignment.center,
    visualDensity: VisualDensity.standard,
  );

  final TextThemeProvider textThemeProvider;

  ListTileThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  ListTileThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final bodyLarge = textThemeProvider.theme.bodyLarge;
    final bodyMedium = textThemeProvider.theme.bodyMedium;
    final labelSmall = textThemeProvider.theme.labelSmall;

    return _theme.copyWith(
      iconColor: colorScheme.onSurfaceVariant,
      leadingAndTrailingTextStyle: labelSmall?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      selectedColor: colorScheme.primary,
      selectedTileColor: colorScheme.surface,
      subtitleTextStyle: bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      textColor: colorScheme.onSurface,
      tileColor: colorScheme.surface,
      titleTextStyle: bodyLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
