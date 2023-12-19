import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class TabBarThemeProvider extends AbstractedThemeProvider<TabBarTheme> {
  static const _theme = TabBarTheme(
    indicatorSize: TabBarIndicatorSize.label,
    labelPadding: EdgeInsetsDirectional.symmetric(
      horizontal: 16,
    ),
    mouseCursor: MaterialStateMouseCursor.clickable,
  );

  final TextThemeProvider textThemeProvider;

  TabBarThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  TabBarTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    final helper = FigmaManager.instance.helper;

    return _theme.copyWith(
      dividerColor: colorScheme.surfaceVariant,
      indicator: UnderlineTabIndicator(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(3),
          topRight: Radius.circular(3),
        ),
        borderSide: BorderSide(
          color: colorScheme.primary,
          width: 3,
        ),
        insets: const EdgeInsetsDirectional.only(
          bottom: 1,
          end: 1,
          start: 1,
        ),
      ),
      indicatorColor: colorScheme.primary,
      labelColor: colorScheme.primary,
      labelStyle: textThemeProvider.theme.titleSmall?.copyWith(
        color: colorScheme.primary,
      ),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        final opacity = getOverlayOpacity(states);

        if (opacity > 0) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary.withOpacity(opacity);
          }

          return colorScheme.onSurface.withOpacity(opacity);
        }

        return null;
      }),
      splashFactory: helper.isLarge() ? NoSplash.splashFactory : null,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      unselectedLabelStyle: textThemeProvider.theme.titleSmall?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
