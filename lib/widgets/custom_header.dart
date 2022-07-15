import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 22, bottom: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Facebook',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 27),
          ),
          const Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.black87,
                )),
          ),
          const SizedBox(width: 6),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.black87,
                )),
          ),
        ],
      ),
    );
  }
}
