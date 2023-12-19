import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ExpansionTileThemeProvider
    extends AbstractedThemeProvider<ExpansionTileThemeData> {
  static const _theme = ExpansionTileThemeData(
    childrenPadding: EdgeInsetsDirectional.only(
      bottom: 8,
      end: 24,
      start: 16,
      top: 0,
    ),
    clipBehavior: Clip.antiAlias,
    collapsedShape: RoundedRectangleBorder(),
    expandedAlignment: AlignmentDirectional.centerStart,
    shape: RoundedRectangleBorder(),
    tilePadding: EdgeInsetsDirectional.only(
      bottom: 8,
      end: 24,
      start: 16,
      top: 8,
    ),
  );

  ExpansionTileThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ExpansionTileThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      collapsedBackgroundColor: colorScheme.surface,
      collapsedIconColor: colorScheme.onSurfaceVariant,
      collapsedTextColor: colorScheme.onSurface,
      iconColor: colorScheme.onSurfaceVariant,
      textColor: colorScheme.onSurface,
    );
  }
}
