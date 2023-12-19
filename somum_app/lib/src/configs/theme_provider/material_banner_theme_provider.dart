import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class MaterialBannerThemeProvider
    extends AbstractedThemeProvider<MaterialBannerThemeData> {
  static const _theme = MaterialBannerThemeData(
    elevation: 1,
  );

  final TextThemeProvider textThemeProvider;

  MaterialBannerThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  MaterialBannerThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final helper = FigmaManager.instance.helper;

    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      contentTextStyle: textThemeProvider.body?.copyWith(
        color: colorScheme.onSurface,
      ),
      dividerColor: colorScheme.outline,
      leadingPadding: EdgeInsetsDirectional.only(
        end: helper.isLarge() ? 24 : 16,
      ),
      padding: EdgeInsetsDirectional.only(
        bottom: 8,
        end: 8,
        start: helper.isLarge() ? 24 : 16,
        top: 10,
      ),
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
