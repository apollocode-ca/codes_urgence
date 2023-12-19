import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum_utilities/somum_utilities.dart';
import 'package:flutter/material.dart';

class CodeGuard extends StatelessWidget {
  final CodeType code;
  final Widget body;

  const CodeGuard({
    super.key,
    required this.body,
    required this.code,
  });

  Future<CodeTypeModel> _getModel() async {
    return CodeTypeModel(type: code);
  }

  @override
  Widget build(BuildContext context) {
    return Guard<CodeTypeModel>(
      body: body,
      future: _getModel(),
    );
  }
}
