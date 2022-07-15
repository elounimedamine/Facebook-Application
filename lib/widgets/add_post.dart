import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController _postCtrl = TextEditingController();

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Column(children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 22,
              foregroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/men/67.jpg"),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                controller: _postCtrl,
                decoration: const InputDecoration(hintText: "Add Post"),
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 28,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(CupertinoIcons.video_camera,
                          color: Colors.black87, size: 32),
                      SizedBox(width: 6),
                      Text('Live'),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(CupertinoIcons.photo,
                          color: Colors.black87, size: 22),
                      SizedBox(width: 6),
                      Text('Photo'),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(CupertinoIcons.chat_bubble_fill,
                          color: Colors.black87, size: 22),
                      SizedBox(width: 6),
                      Text('Discuss'),
                    ],
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
