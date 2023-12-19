import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:somum/src/configs/beamer_delegates/dashboard_delegate.dart';
import 'package:somum/src/configs/services.dart';
import 'package:somum/src/layouts/dashboard/widgets/universal_appbar.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:somum/src/widgets/buttons/custom_round_outlined_button.dart';
import 'package:somum/src/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

/// Layout pour les pages du dashboard.
class DashboardLayout extends StatelessWidget {
  final _delegate = dashboardDelegate();

  DashboardLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollConfiguration = ScrollConfiguration.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: universalAppBar(context),
        body: ScrollConfiguration(
          behavior: scrollConfiguration.copyWith(
            scrollbars: false,
          ),
          child: BeamLayout(
            delegate: _delegate,
            helper: FigmaManager.instance.helper,
            scrollablePaths: const ['/dashboard/home'],
          ),
        ),
      ),
    );
  }
}
