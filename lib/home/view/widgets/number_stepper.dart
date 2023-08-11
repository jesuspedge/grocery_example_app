import 'package:flutter/material.dart';

class NumberStepper extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final int step;
  final Function(int) onChanged;

  const NumberStepper(
      {Key? key,
      required this.initialValue,
      required this.minValue,
      required this.maxValue,
      required this.step,
      required this.onChanged})
      : super(key: key);

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  int _currentValue = 0;

  @override
  void initState() {
    _currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                if (_currentValue > widget.minValue) {
                  _currentValue -= widget.step;
                }
              });

              widget.onChanged(_currentValue);
            },
            child: const Icon(Icons.remove)),
        Text(
          _currentValue.toString(),
          style: const TextStyle(fontSize: 18),
        ),
        GestureDetector(
            onTap: () {
              setState(() {
                if (_currentValue < widget.maxValue) {
                  _currentValue += widget.step;
                }
              });

              widget.onChanged(_currentValue);
            },
            child: const Icon(Icons.add)),
      ],
    );
  }
}
