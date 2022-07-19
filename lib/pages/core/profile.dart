import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/widgets/rounded_border_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.chevron_back)),
              const SizedBox(width: 6),
              const Text(
                'Home Page',
                style: TextStyle(color: Colors.black87, fontSize: 13),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          const CircleAvatar(
            radius: 64,
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Jane Doe',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedBorderButton(
                'Follow',
                btnClick: () {
                  //...
                },
              ),
              const SizedBox(width: 12),
              RoundedBorderButton(
                '',
                icon: CupertinoIcons.chat_bubble_2,
                btnClick: () {
                  //...
                },
              )
            ],
          )
        ]),
      )),
    );
  }
}
