import 'package:somum/src/configs/beamer_delegates/code_delegate.dart';
import 'package:somum/src/layouts/code/widgets/navigation_bar_widget.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

/// Layout pour les pages du dashboard.
class CodeLayout extends StatelessWidget {
  final _delegate = tubDelegate();

  CodeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollConfiguration = ScrollConfiguration.of(context);

    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: scrollConfiguration.copyWith(
            scrollbars: false,
          ),
          child: BeamLayout(
            delegate: _delegate,
            helper: FigmaManager.instance.helper,
            scrollablePaths: const [
              '/code/floors',
              '/code/rooms',
              '/code/scenes',
            ],
          ),
        ),
        bottomNavigationBar: TubNavigationBar(
          delegate: _delegate,
        ),
      ),
    );
  }
}
