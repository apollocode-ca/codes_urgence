import 'package:somum/src/top_app_builder.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

// TODO: replace with the name of the app.
// TODO: replace the name of this file.
// TODO: replace the name of the project in the pubspec.yaml.
// TODO: replace the description of the project in the pubspec.yaml.
// TODO: replace icons and favicon in the web folder for web project.
// TODO: replace the name, the short name and the description in the manifest.json.
class somumApp extends StatelessWidget {
  const somumApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TopLevelInheritedWidget(
      l10n: L10nProvider(
        child: TopAppBuilder(),
      ),
    );
  }
}
