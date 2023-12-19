import 'package:somum/src/configs/extended_theme_providers/extended_color_scheme_provider.dart';
import 'package:somum/src/configs/theme_provider/action_icon_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/app_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/badge_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/date_picker_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/material_banner_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/bottom_app_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/bottom_navigation_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/bottom_sheet_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/button_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/card_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/checkbox_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/chip_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/color_scheme_provider.dart';
import 'package:somum/src/configs/theme_provider/data_table_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/dialog_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/divider_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/drawer_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/dropdown_menu_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/elevated_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/expansion_tile_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/filled_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/floating_action_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/icon_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/input_decoration_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/list_tile_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/menu_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/menu_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/menu_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/navigation_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/navigation_drawer_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/navigation_rail_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/outlined_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/popup_menu_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/progress_indicator_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/radio_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/scrollbar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/search_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/search_view_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/segmented_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/slider_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/snack_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/switch_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/tab_bar_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/text_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/text_selection_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/time_picker_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/toggle_buttons_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/tooltip_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ThemeProvider {
  final _colorSchemeProvider = ColorSchemeProvider();
  final _extendedColorSchemeProvider = ExtendedColorSchemeProvider();

  final _iconTheme = const IconThemeData(
    size: 24,
  );

  final _textThemeProvider = TextThemeProvider(
    baseStyle: const TextStyle(
      fontFamily: 'Poppins',
    ),
  );

  late final _actionIconThemeProvider = ActionIconThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    iconTheme: _iconTheme,
  );

  late final _appBarThemeProvider = AppBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _badgeThemeProvider = BadgeThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _bottomAppBarThemeProvider = BottomAppBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _bottomNavigationBarThemeProvider =
      BottomNavigationBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _bottomSheetThemeProvider = BottomSheetThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _buttonBarThemeProvider = ButtonBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _cardThemeProvider = CardThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _checkboxThemeProvider = CheckboxThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _chipThemeProvider = ChipThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _datePickerThemeProvider = DatePickerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _dataTableThemeProvider = DataTableThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _dialogThemeProvider = DialogThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _dividerThemeProvider = DividerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _drawerThemeProvider = DrawerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _dropdownMenuThemeProvider = DropdownMenuThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    inputDecorationThemeProvider: _inputDecorationThemeProvider,
  );

  late final _elevatedButtonThemeProvider = ElevatedButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _expansionTileThemeProvider = ExpansionTileThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _filledButtonThemeProvider = FilledButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _floatingActionButtonThemeProvider =
      FloatingActionButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _iconButtonThemeProvider = IconButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _inputDecorationThemeProvider = InputDecorationThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _listTileThemeProvider = ListTileThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _materialBannerThemeProvider = MaterialBannerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _menuBarThemeProvider = MenuBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _menuButtonThemeProvider = MenuButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _menuThemeProvider = MenuThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _navigationBarThemeProvider = NavigationBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _navigationDrawerThemeProvider = NavigationDrawerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _navigationRailThemeProvider = NavigationRailThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _outlinedButtonThemeProvider = OutlinedButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _popupMenuThemeProvider = PopupMenuThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _progressIndicatorThemeProvider = ProgressIndicatorThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _radioButtonThemeProvider = RadioButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _scrollbarThemeProvider = ScrollbarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _searchBarThemeProvider = SearchBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _searchViewThemeProvider = SearchViewThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    dividerThemeProvider: _dividerThemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _segmentedButtonThemeProvider = SegmentedButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _sliderThemeProvider = SliderThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _snackBarThemeProvider = SnackBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _switchThemeProvider = SwitchThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _tabBarThemeProvider = TabBarThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _textButtonThemeProvider = TextButtonThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _textSelectionThemeProvider = TextSelectionThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
  );

  late final _themeExtensionsProvider = ThemeExtensionsProvider(
    colorSchemeProvider: _colorSchemeProvider,
    dropdownMenuThemeProvider: _dropdownMenuThemeProvider,
    extendedColorSchemeProvider: _extendedColorSchemeProvider,
    iconButtonThemeProvider: _iconButtonThemeProvider,
    textButtonThemeProvider: _textButtonThemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _timePickerThemeProvider = TimePickerThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    iconTheme: _iconTheme,
    inputDecorationThemeProvider: _inputDecorationThemeProvider,
    textButtonThemeProvider: _textButtonThemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _toggleButtonsThemeProvider = ToggleButtonsThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  late final _tooltipThemeProvider = TooltipThemeProvider(
    colorSchemeProvider: _colorSchemeProvider,
    textThemeProvider: _textThemeProvider,
  );

  ThemeData getFrom(Brightness brightness) {
    final helper = FigmaManager.instance.helper;
    final colorScheme = _colorSchemeProvider.getFrom(brightness);

    return ThemeData(
      actionIconTheme: _actionIconThemeProvider.getFrom(brightness),
      appBarTheme: _appBarThemeProvider.getFrom(brightness),
      applyElevationOverlayColor: true,
      badgeTheme: _badgeThemeProvider.getFrom(brightness),
      bannerTheme: _materialBannerThemeProvider.getFrom(brightness),
      bottomAppBarTheme: _bottomAppBarThemeProvider.getFrom(brightness),
      bottomNavigationBarTheme: _bottomNavigationBarThemeProvider.getFrom(
        brightness,
      ),
      bottomSheetTheme: _bottomSheetThemeProvider.getFrom(brightness),
      brightness: brightness,
      buttonBarTheme: _buttonBarThemeProvider.getFrom(brightness),
      canvasColor: colorScheme.background,
      cardColor: colorScheme.surface,
      cardTheme: _cardThemeProvider.getFrom(brightness),
      checkboxTheme: _checkboxThemeProvider.getFrom(brightness),
      chipTheme: _chipThemeProvider.getFrom(brightness),
      colorScheme: colorScheme,
      cupertinoOverrideTheme: null,
      datePickerTheme: _datePickerThemeProvider.getFrom(brightness),
      dataTableTheme: _dataTableThemeProvider.getFrom(brightness),
      dialogBackgroundColor: colorScheme.surface,
      dialogTheme: _dialogThemeProvider.getFrom(brightness),
      disabledColor: colorScheme.onSurface.withOpacity(0.38),
      dividerColor: colorScheme.outline,
      dividerTheme: _dividerThemeProvider.getFrom(brightness),
      drawerTheme: _drawerThemeProvider.getFrom(brightness),
      dropdownMenuTheme: _dropdownMenuThemeProvider.getFrom(brightness),
      elevatedButtonTheme: _elevatedButtonThemeProvider.getFrom(brightness),
      expansionTileTheme: _expansionTileThemeProvider.getFrom(brightness),
      extensions: _themeExtensionsProvider.getFrom(brightness),
      filledButtonTheme: _filledButtonThemeProvider.getFrom(brightness),
      floatingActionButtonTheme: _floatingActionButtonThemeProvider.getFrom(
        brightness,
      ),
      focusColor: colorScheme.onPrimary.withOpacity(0.12),
      highlightColor: colorScheme.onPrimary.withOpacity(0.12),
      hintColor: colorScheme.onSurfaceVariant,
      hoverColor: colorScheme.onPrimary.withOpacity(0.08),
      iconButtonTheme: _iconButtonThemeProvider.getFrom(brightness),
      iconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurface,
      ),
      indicatorColor: colorScheme.primary,
      inputDecorationTheme: _inputDecorationThemeProvider.getFrom(brightness),
      listTileTheme: _listTileThemeProvider.getFrom(brightness),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      menuBarTheme: _menuBarThemeProvider.getFrom(brightness),
      menuButtonTheme: _menuButtonThemeProvider.getFrom(brightness),
      menuTheme: _menuThemeProvider.getFrom(brightness),
      navigationBarTheme: _navigationBarThemeProvider.getFrom(brightness),
      navigationDrawerTheme: _navigationDrawerThemeProvider.getFrom(brightness),
      navigationRailTheme: _navigationRailThemeProvider.getFrom(brightness),
      outlinedButtonTheme: _outlinedButtonThemeProvider.getFrom(brightness),
      pageTransitionsTheme: null,
      platform: null,
      popupMenuTheme: _popupMenuThemeProvider.getFrom(brightness),
      primaryColor: colorScheme.primary,
      primaryColorDark: _colorSchemeProvider.getDarkerPrimaryFrom(brightness),
      primaryColorLight: _colorSchemeProvider.getLighterPrimaryFrom(brightness),
      primaryIconTheme: _iconTheme.copyWith(
        color: colorScheme.onPrimary,
      ),
      primaryTextTheme: _textThemeProvider.theme.apply(
        bodyColor: colorScheme.onPrimary,
        decorationColor: colorScheme.onPrimary,
        displayColor: colorScheme.onPrimary,
      ),
      progressIndicatorTheme: _progressIndicatorThemeProvider.getFrom(
        brightness,
      ),
      radioTheme: _radioButtonThemeProvider.getFrom(brightness),
      scaffoldBackgroundColor: colorScheme.background,
      scrollbarTheme: _scrollbarThemeProvider.getFrom(brightness),
      secondaryHeaderColor: colorScheme.surface,
      searchBarTheme: _searchBarThemeProvider.getFrom(brightness),
      searchViewTheme: _searchViewThemeProvider.getFrom(brightness),
      segmentedButtonTheme: _segmentedButtonThemeProvider.getFrom(brightness),
      shadowColor: colorScheme.shadow,
      sliderTheme: _sliderThemeProvider.getFrom(brightness),
      snackBarTheme: _snackBarThemeProvider.getFrom(brightness),
      splashColor:
          helper.isLarge() ? null : colorScheme.primary.withOpacity(0.12),
      splashFactory: helper.isLarge() ? NoSplash.splashFactory : null,
      switchTheme: _switchThemeProvider.getFrom(brightness),
      tabBarTheme: _tabBarThemeProvider.getFrom(brightness),
      textButtonTheme: _textButtonThemeProvider.getFrom(brightness),
      textSelectionTheme: _textSelectionThemeProvider.getFrom(brightness),
      textTheme: _textThemeProvider.theme.apply(
        displayColor: colorScheme.onSurface,
        bodyColor: colorScheme.onSurface,
        decorationColor: colorScheme.onSurface,
      ),
      timePickerTheme: _timePickerThemeProvider.getFrom(brightness),
      toggleButtonsTheme: _toggleButtonsThemeProvider.getFrom(brightness),
      tooltipTheme: _tooltipThemeProvider.getFrom(brightness),
      typography: null,
      unselectedWidgetColor: colorScheme.onSurfaceVariant,
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
    );
  }
}
