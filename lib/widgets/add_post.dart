import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/utils/temp_data.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            foregroundImage: NetworkImage(TempData.userAvatarURL),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(64)),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(top: 15, bottom: 13, left: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(64)),
                  border: Border.all(color: Colors.black87, width: .7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "What's on your mind?",
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
