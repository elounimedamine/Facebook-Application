import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/utils/temp_data.dart';

TextEditingController _postCtrl = TextEditingController();

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Column(children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                foregroundImage: NetworkImage(TempData.userAvatarURL),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: TextField(
                  controller: _postCtrl,
                  //readOnly: true,
                  decoration: const InputDecoration(
                      hintText: "What's on your mind?",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.black87),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.black87),
                      )),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
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
                            color: Colors.black87, size: 30),
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
      ),
    );
  }
}
