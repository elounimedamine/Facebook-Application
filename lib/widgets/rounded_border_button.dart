import 'package:flutter/material.dart';

class RoundedBorderButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final Function btnClick;
  const RoundedBorderButton(this.label,
      {Key? key, this.icon, required this.btnClick})
      : super(key: key);

  @override
  State<RoundedBorderButton> createState() => _RoundedBorderButtonStateState();
}

class _RoundedBorderButtonStateState extends State<RoundedBorderButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.btnClick;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(64)),
          color: Colors.blue.withOpacity(.2),
        ),
        child: Row(
          children: [
            Visibility(
              visible: widget.icon != null ? true : false,
              child: Icon(widget.icon, color: Colors.blue.shade600, size: 22),
            ),
            Visibility(
              visible: widget.label.isEmpty ? false : true,
              child: Text('${widget.label} ',
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
