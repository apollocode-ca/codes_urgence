import 'package:flutter/material.dart';

class Secondarybutton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Size? size;
  const Secondarybutton(
      {super.key, required this.child, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size?>(size),
            shadowColor: MaterialStateProperty.all<Color>(
                Colors.transparent),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary),
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.onSecondary)),
        child: child);
  }
}
