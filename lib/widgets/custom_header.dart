import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:summer_cump_project_2022/pages/core/profile.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 18, bottom: 28.0),
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
                  CupertinoIcons.bell_solid,
                  color: Colors.black87,
                  size: 18,
                )),
          ),
          const SizedBox(
            width: 12,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.chat_bubble_fill,
                  color: Colors.black87,
                  size: 18,
                )),
          ),
          const SizedBox(
            width: 12,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue.shade50,
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                icon: const Icon(
                  CupertinoIcons.person_solid,
                  color: Colors.blue,
                  size: 18,
                )),
          )
        ],
      ),
    );
  }
}
