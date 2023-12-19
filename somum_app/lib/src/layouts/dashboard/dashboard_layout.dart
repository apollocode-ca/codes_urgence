import 'package:beamer/beamer.dart';
import 'package:somum/src/configs/beamer_delegates/dashboard_delegate.dart';
import 'package:somum/src/configs/services.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
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
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 80,
          backgroundColor: Colors.transparent,
          toolbarHeight: 85,
          title: CustomRoundOutlinedButton(
            size: const Size(48, 65),
            child: const Icon(Icons.logout),
            // onPressed: () => services.auth.disconnectUser(() =>
            //     Beamer.of(context, root: true)
            //         .beamToReplacementNamed("/auth/home")),
            onPressed: () => Beamer.of(context, root: true)
                .beamToReplacementNamed("/auth/home"),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(12),
              child: LogoWidget(),
            )
          ],
          centerTitle: false,
        ),
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
