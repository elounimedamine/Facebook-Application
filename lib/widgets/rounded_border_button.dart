import 'package:flutter/material.dart';


class RoundedBorderButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final Function btnClick;
  const RoundedBorderButton(this.label,
      {Key? key, this.icon, required this.btnClick})
      : super(key: key);

  @override
  _RoundedBorderButtonState createState() => _RoundedBorderButtonState();
}

class _RoundedBorderButtonState extends State<RoundedBorderButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(64)),
        border: Border.all(color: Colors.blue, width: .7),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(64)),
        onTap: () {
          widget.btnClick;
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: widget.icon != null ? true : false,
                child: Icon(
                  widget.icon,
                  color: Colors.blue.shade600,
                  size: 22,
                ),
              ),
              Visibility(
                visible: widget.label.isEmpty ? false : true,
                replacement: const SizedBox.shrink(),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
