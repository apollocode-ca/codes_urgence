import 'package:flutter/material.dart';

class TertiaryButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Size? size;
  const TertiaryButton(
      {super.key, required this.child, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size?>(size),
            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context)
                .colorScheme
                .tertiary
                .withOpacity((onPressed != null) ? 1 : 0.3)),
            foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context)
                .colorScheme
                .onTertiary
                .withOpacity((onPressed != null) ? 1 : 0.15))),
        child: child);
  }
}
