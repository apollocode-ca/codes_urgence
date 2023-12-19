import 'package:somum/src/utilities/enums.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:flutter/material.dart';

extension CodeTypesExtension on CodeType {
  String l10Name(BuildContext context) {
    switch (this) {
      case CodeType.silver:
        return L10nProvider.of(context).code_type_silver;
      case CodeType.blue:
        return L10nProvider.of(context).code_type_blue;
      case CodeType.grey:
        return L10nProvider.of(context).code_type_grey;
      case CodeType.mauve:
        return L10nProvider.of(context).code_type_mauve;
      case CodeType.orange:
        return L10nProvider.of(context).code_type_orange;
      case CodeType.red:
        return L10nProvider.of(context).code_type_red;
      case CodeType.white:
        return L10nProvider.of(context).code_type_white;
      case CodeType.brown:
        return L10nProvider.of(context).code_type_brown;
      case CodeType.yellow:
        return L10nProvider.of(context).code_type_yellow;
      case CodeType.black:
        return L10nProvider.of(context).code_type_black;
      case CodeType.pink:
        return L10nProvider.of(context).code_type_pink;
      case CodeType.green:
        return L10nProvider.of(context).code_type_green;
      default:
        return 'unknown';
    }
  }

  String l10Description(BuildContext context) {
    switch (this) {
      case CodeType.silver:
        return L10nProvider.of(context).code_type_silver_description;
      case CodeType.blue:
        return L10nProvider.of(context).code_type_blue_description;
      case CodeType.grey:
        return L10nProvider.of(context).code_type_grey_description;
      case CodeType.mauve:
        return L10nProvider.of(context).code_type_mauve_description;
      case CodeType.orange:
        return L10nProvider.of(context).code_type_orange_description;
      case CodeType.red:
        return L10nProvider.of(context).code_type_red_description;
      case CodeType.white:
        return L10nProvider.of(context).code_type_white_description;
      case CodeType.brown:
        return L10nProvider.of(context).code_type_brown_description;
      case CodeType.yellow:
        return L10nProvider.of(context).code_type_yellow_description;
      case CodeType.black:
        return L10nProvider.of(context).code_type_black_description;
      case CodeType.pink:
        return L10nProvider.of(context).code_type_pink_description;
      case CodeType.green:
        return L10nProvider.of(context).code_type_green_description;
      default:
        return 'unknown';
    }
  }
}
