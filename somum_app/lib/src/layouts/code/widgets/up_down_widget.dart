import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:flutter/material.dart';

class UpDownWidget extends StatefulWidget {
  final int value;
  final int max;
  final int min;
  final int step;
  final String unit;
  final Function(int value) onChanged;
  const UpDownWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.step = 5,
    this.max = 100,
    this.min = 0,
    this.unit = "%",
  });

  @override
  State<UpDownWidget> createState() => _UpDownWidgetState();
}

class _UpDownWidgetState extends State<UpDownWidget> {
  late int _value = widget.value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              onPressed: () {
                if (_value <= widget.min) return;
                setState(() {
                  _value -= widget.step;
                  widget.onChanged(_value);
                });
              },
            ),
            Text(L10nProvider.of(context).function_attribute_down),
          ],
        ),
        Container(
            width: 75,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Text('$_value ${widget.unit}')),
        Column(
          children: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_up),
              onPressed: () {
                if (_value >= widget.max) return;
                setState(() {
                  _value += widget.step;
                  widget.onChanged(_value);
                });
              },
            ),
            Text(L10nProvider.of(context).function_attribute_up),
          ],
        ),
      ],
    );
  }
}
