import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef L10nProviderAbstraction = L10nProviderInterface<AppLocalizations>;

class L10nProvider extends L10nProviderAbstraction {
  static L10nProvider providerOf(BuildContext context) {
    return L10nProviderAbstraction.providerOf<L10nProvider>(context);
  }

  static AppLocalizations of(BuildContext context) {
    return L10nProviderAbstraction.of<AppLocalizations>(context);
  }

  const L10nProvider({
    required super.child,
    super.key,
  });

  @override
  List<LocalizationsDelegate> get localizationsDelegates {
    return AppLocalizations.localizationsDelegates;
  }

  @override
  List<Locale> get supportedLocales {
    return AppLocalizations.supportedLocales;
  }

  @override
  String getMetaDescriptionFrom(BuildContext context) {
    // TODO: Replace with the description to show in the metadata. It will be
    // TODO: used by searching engines (like Google) to describe the website.
    // TODO: PS: just remove the override of the method if metadata is useless.
    return L10nProvider.of(context).metadata_description;
  }

  @override
  String getMetaTitleFrom(BuildContext context) {
    // TODO: Replace with the title to show in the metadata.
    // TODO: PS: just remove the override of the method if metadata is useless.
    return L10nProvider.of(context).metadata_title;
  }
}
