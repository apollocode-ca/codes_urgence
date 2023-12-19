import 'package:somum/src/configs/beamer_delegates/code_delegate.dart';
import 'package:somum/src/layouts/dashboard/widgets/code_widget.dart';
import 'package:somum/src/layouts/dashboard/widgets/universal_appbar.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';
import 'package:somum_utilities/somum_utilities.dart';

/// Layout pour les pages du dashboard.
class CodeLayout extends StatelessWidget {
  final _delegate = tubDelegate();

  CodeLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollConfiguration = ScrollConfiguration.of(context);
    final code = Guard.of<CodeTypeModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: universalAppBar(context),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: [
              SizedBox(
                height: constraints.maxHeight,
                width: constraints.maxWidth * 0.80,
                child: ScrollConfiguration(
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
              ),
              Column(
                children: [
                  CodeWidget(code: code.type),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
