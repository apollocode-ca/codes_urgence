import 'package:flutter/material.dart';

class EmptyErrorContainerWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const EmptyErrorContainerWidget(
      {super.key, required this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        margin: margin ?? const EdgeInsets.only(top: 35),
        padding: padding ?? const EdgeInsets.all(14),
        width: constraints.maxWidth,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.errorContainer,
            border: Border.all(
                color: Theme.of(context).colorScheme.errorContainer,
                width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: child,
      );
    });
  }
}
