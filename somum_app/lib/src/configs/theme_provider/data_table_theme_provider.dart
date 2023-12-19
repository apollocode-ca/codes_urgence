import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class DataTableThemeProvider
    extends AbstractedThemeProvider<DataTableThemeData> {
  // For now, the copyWith method is broken. To patch this, we simply have to
  // not use the copyWith method and directly use the constructor instead.
  // I filled in an issue : https://github.com/flutter/flutter/issues/126676
  // The issue has been fixed, waiting for this PR to be included in the next
  // (probably minor) version: https://github.com/flutter/flutter/pull/126943
  // static const _theme = DataTableThemeData(
  //   checkboxHorizontalMargin: 16,
  //   columnSpacing: 32,
  //   dataRowMaxHeight: 52,
  //   dataRowMinHeight: 52,
  //   dividerThickness: 1,
  //   headingRowColor: MaterialStatePropertyAll(null),
  //   headingRowHeight: 56,
  //   horizontalMargin: 16,
  // );

  final TextThemeProvider textThemeProvider;

  DataTableThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  DataTableThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return DataTableThemeData(
      checkboxHorizontalMargin: 16,
      columnSpacing: 32,
      dataRowColor: MaterialStateProperty.resolveWith((states) {
        var opacity = getOverlayOpacity(states);

        if (states.contains(MaterialState.selected)) {
          opacity += 0.16;

          return colorScheme.primary.withOpacity(opacity);
        }

        if (opacity > 0) {
          return colorScheme.onSurfaceVariant.withOpacity(opacity);
        }

        return null;
      }),
      dataRowCursor: MaterialStateMouseCursor.clickable,
      dataRowMaxHeight: 52,
      dataRowMinHeight: 52,
      dataTextStyle: textThemeProvider.theme.bodyMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.outline,
          width: 1,
        ),
        borderRadius: const BorderRadiusDirectional.all(
          Radius.circular(4),
        ),
        color: colorScheme.surface,
      ),
      dividerThickness: 1,
      headingCellCursor: const MaterialStatePropertyAll(
        SystemMouseCursors.basic,
      ),
      headingRowColor: const MaterialStatePropertyAll(null),
      headingRowHeight: 56,
      headingTextStyle: textThemeProvider.theme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.6),
        fontWeight: FontWeight.w500,
      ),
      horizontalMargin: 16,
    );
  }
}
