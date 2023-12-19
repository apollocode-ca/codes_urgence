import 'package:somum/src/utilities/enums.dart';
import 'package:flutter/material.dart';

class FunctionIconWidget extends StatelessWidget {
  final CodeType type;
  const FunctionIconWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Image(
      width: 55,
      height: 55,
      image: AssetImage('assets/icons/${type.name}.png'),
    );
  }
}
