import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class InputDecorationThemeProvider
    extends AbstractedThemeProvider<InputDecorationTheme> {
  static const _borderSide = BorderSide(
    width: 1,
  );

  static const _focusedBorderSide = BorderSide(
    width: 2,
  );

  static const _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4),
    ),
    gapPadding: 4,
  );

  static const _theme = InputDecorationTheme(
    alignLabelWithHint: true,
    constraints: BoxConstraints(
      maxHeight: double.infinity,
      maxWidth: double.infinity,
      minHeight: 56,
      minWidth: 0,
    ),
    contentPadding: EdgeInsetsDirectional.symmetric(
      horizontal: 16,
      vertical: 16,
    ),
    errorMaxLines: 1,
    filled: false,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    helperMaxLines: 1,
    isCollapsed: true,
    isDense: false,
  );

  final TextThemeProvider textThemeProvider;

  InputDecorationThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  InputDecorationTheme copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final bodySmall = textThemeProvider.theme.bodySmall ?? const TextStyle();
    final bodyLarge = textThemeProvider.theme.bodyLarge ?? const TextStyle();

    return _theme.copyWith(
      activeIndicatorBorder: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return _borderSide.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.focused)) {
            return _focusedBorderSide.copyWith(
              color: colorScheme.error,
            );
          }

          if (states.contains(MaterialState.hovered)) {
            return _borderSide.copyWith(
              color: colorScheme.onErrorContainer,
            );
          }

          return _borderSide.copyWith(
            color: colorScheme.error,
          );
        }

        if (states.contains(MaterialState.focused)) {
          return _focusedBorderSide.copyWith(
            color: colorScheme.primary,
          );
        }

        if (states.contains(MaterialState.hovered)) {
          return _borderSide.copyWith(
            color: colorScheme.onSurface,
          );
        }

        return _borderSide.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      border: MaterialStateOutlineInputBorder.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return _inputBorder.copyWith(
            borderSide: _borderSide.copyWith(
              color: colorScheme.onSurface.withOpacity(0.12),
            ),
          );
        }

        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.focused)) {
            return _inputBorder.copyWith(
              borderSide: _focusedBorderSide.copyWith(
                color: colorScheme.error,
              ),
            );
          }

          if (states.contains(MaterialState.hovered)) {
            return _inputBorder.copyWith(
              borderSide: _borderSide.copyWith(
                color: colorScheme.onErrorContainer,
              ),
            );
          }

          return _inputBorder.copyWith(
            borderSide: _borderSide.copyWith(
              color: colorScheme.error,
            ),
          );
        }

        if (states.contains(MaterialState.focused)) {
          return _inputBorder.copyWith(
            borderSide: _focusedBorderSide.copyWith(
              color: colorScheme.primary,
            ),
          );
        }

        if (states.contains(MaterialState.hovered)) {
          return _inputBorder.copyWith(
            borderSide: _borderSide.copyWith(
              color: colorScheme.onSurface,
            ),
          );
        }

        return _inputBorder.copyWith(
          borderSide: _borderSide.copyWith(
            color: colorScheme.outline,
          ),
        );
      }),
      counterStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return bodySmall.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        return bodySmall.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      errorStyle: bodySmall.copyWith(
        color: colorScheme.error,
      ),
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.04);
        }

        return colorScheme.surfaceVariant;
      }),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return bodyLarge.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.focused)) {
            return bodyLarge.copyWith(
              color: colorScheme.error,
            );
          }

          if (states.contains(MaterialState.hovered)) {
            return bodyLarge.copyWith(
              color: colorScheme.onErrorContainer,
            );
          }

          return bodyLarge.copyWith(
            color: colorScheme.error,
          );
        }

        if (states.contains(MaterialState.focused)) {
          return bodyLarge.copyWith(
            color: colorScheme.primary,
          );
        }

        if (states.contains(MaterialState.hovered)) {
          return bodyLarge.copyWith(
            color: colorScheme.onSurface,
          );
        }

        return bodyLarge.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      helperStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return bodySmall.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        return bodySmall.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      hintStyle: textThemeProvider.theme.bodyLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      hoverColor: Colors.transparent,
      iconColor: colorScheme.onSurfaceVariant,
      labelStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return bodyLarge.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.hovered)) {
            return bodyLarge.copyWith(
              color: colorScheme.onErrorContainer,
            );
          }

          return bodyLarge.copyWith(
            color: colorScheme.error,
          );
        }

        if (states.contains(MaterialState.hovered)) {
          return bodyLarge.copyWith(
            color: colorScheme.onSurface,
          );
        }

        return bodyLarge.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      prefixIconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }

        return colorScheme.onSurfaceVariant;
      }),
      prefixStyle: bodyLarge.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      suffixIconColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }

        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.focused)) {
            return colorScheme.error;
          }

          if (states.contains(MaterialState.hovered)) {
            return colorScheme.onErrorContainer;
          }

          return colorScheme.error;
        }

        return colorScheme.onSurfaceVariant;
      }),
      suffixStyle: bodyLarge.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
