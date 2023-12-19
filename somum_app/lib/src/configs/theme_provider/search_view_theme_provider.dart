import 'package:somum/src/configs/theme_provider/divider_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class SearchViewThemeProvider
    extends AbstractedThemeProvider<SearchViewThemeData> {
  static const _theme = SearchViewThemeData(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(28),
      ),
    ),
    side: BorderSide.none,
  );

  final DividerThemeProvider dividerThemeProvider;
  final TextThemeProvider textThemeProvider;

  SearchViewThemeProvider({
    required super.colorSchemeProvider,
    required this.dividerThemeProvider,
    required this.textThemeProvider,
  });

  @override
  SearchViewThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final helper = FigmaManager.instance.helper;
    final dividerTheme = dividerThemeProvider.getFrom(brightness);
    final bodyLarge = textThemeProvider.theme.bodyLarge;

    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      constraints: BoxConstraints(
        minHeight: 240,
        minWidth: 360,
        maxHeight: helper.mediaSize.height * 2 / 3,
        maxWidth: 720,
      ),
      dividerColor: dividerTheme.color,
      headerHintStyle: bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      headerTextStyle: bodyLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
