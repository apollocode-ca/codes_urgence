import 'package:somum/src/apollocode_app.dart';
import 'package:somum/src/configs/services.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum_utilities/somum_utilities.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

void main() async {
  Beamer.setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStoreManager.initialize({
    User: User.fromMap,
  });

  await initializeServices();

  runApp(
    const somumApp(),
  );
}
