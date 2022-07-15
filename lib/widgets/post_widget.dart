import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: const [
          UserMetaData(),
          SizedBox(height: 14),
          PostBody(),
        ],
      ),
    );
  }
}

class UserMetaData extends StatelessWidget {
  const UserMetaData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          foregroundImage:
              NetworkImage("https://randomuser.me/api/portraits/men/79.jpg"),
        ),
        const SizedBox(width: 12),
        Column(
          children: [
            const Text(
              'full name',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Row(
              children: const [
                Text(
                  'Just Now *',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.grey),
                ),
                SizedBox(width: 3),
                Icon(CupertinoIcons.globe, size: 12),
              ],
            )
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.ellipsis)),
      ],
    );
  }
}

class PostBody extends StatelessWidget {
  const PostBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Flexible(
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
        ),
        const SizedBox(height: 14),
        Container(
          color: Colors.grey.shade200,
          height: 250,
        )
      ],
    );
  }
}
