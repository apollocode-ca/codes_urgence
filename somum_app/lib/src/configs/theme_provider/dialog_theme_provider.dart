import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class DialogThemeProvider extends AbstractedThemeProvider<DialogTheme> {
  static const _theme = DialogTheme(
    actionsPadding: EdgeInsetsDirectional.all(24),
    alignment: AlignmentDirectional.center,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(12),
      ),
    ),
  );

  final TextThemeProvider textThemeProvider;

  DialogThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  DialogTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      contentTextStyle: textThemeProvider.theme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      iconColor: colorScheme.secondary,
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
      titleTextStyle: textThemeProvider.theme.titleSmall?.copyWith(
        color: colorScheme.primary,
      ),
    );
  }
}
