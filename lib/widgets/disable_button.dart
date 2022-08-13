import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisabledButton extends StatefulWidget {
  final bool isDisabled;
  final Function onClick;

  const DisabledButton(
      {Key? key, required this.isDisabled, required this.onClick})
      : super(key: key);

  @override
  State<DisabledButton> createState() => _DisabledButtonState();
}

class _DisabledButtonState extends State<DisabledButton> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: CupertinoButton(
        onPressed: () {
          widget.isDisabled ? null : widget.onClick();
        },
        color: widget.isDisabled ? Colors.grey : Colors.blue,
        child: const Text('post'),
      ),
    );
  }
}
