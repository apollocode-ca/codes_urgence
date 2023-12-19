import 'package:somum/src/configs/beamer_delegates/main_delegate.dart';
import 'package:somum/src/configs/theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TopAppBuilder extends StatelessWidget {
  final _delegate = mainDelegate;

  TopAppBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10nProvider = L10nProvider.providerOf(context);
    final topLevelScope = TopLevelInheritedWidget.of(context);

    return MaterialApp.router(
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: _delegate,
      ),
      debugShowCheckedModeBanner: false,
      locale: l10nProvider.currentLocale,
      localizationsDelegates: l10nProvider.localizationsDelegates,
      routerDelegate: _delegate,
      routeInformationParser: BeamerParser(),
      supportedLocales: l10nProvider.supportedLocales,
      builder: (context, child) {
        FigmaManager.initialize(context);

        if (kIsWeb) {
          l10nProvider.addDescriptionMetadataFrom(context);
          l10nProvider.addTitleMetadataFrom(context);
        }

        if (child == null) {
          return const SizedBox.shrink();
        }

        final brightness = MediaQuery.platformBrightnessOf(context);
        final themeProvider = ThemeProvider();

        return Theme(
          data: themeProvider.getFrom(brightness),
          child: KeyboardListener(
            focusNode: topLevelScope.keyboardFocusNode,
            child: child,
          ),
        );
      },
    );
  }
}
