import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final Function bookmarkPost;

  const PostWidget({Key? key, required this.bookmarkPost}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const UserMetaData(),
          const SizedBox(
            height: 14,
          ),
          const PostBody(),
          PostActions(
            bookmarkPost: bookmarkPost,
          )
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
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'full name',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: const [
                Text(
                  'just now • ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  CupertinoIcons.globe,
                  size: 16,
                )
              ],
            )
          ],
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.ellipsis))
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
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat nisl non orci ultrices bibendum. Morbi ac cursus ipsum, quis facilisis velit. Phasellus risus lacus, dapibus sit amet ornare eu, ")),
        const SizedBox(
          height: 14,
        ),
        Container(
          color: Colors.grey.shade200,
          height: 250,
        )
      ],
    );
  }
}

class PostActions extends StatefulWidget {
  final Function bookmarkPost;

  const PostActions({Key? key, required this.bookmarkPost}) : super(key: key);
  @override
  _PostActionsState createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      child: Row(
        children: [
          InkResponse(onTap: () {}, child: const Icon(CupertinoIcons.heart)),
          const SizedBox(
            width: 12,
          ),
          InkResponse(
              onTap: () {}, child: const Icon(CupertinoIcons.chat_bubble)),
          const SizedBox(
            width: 12,
          ),
          InkResponse(onTap: () {}, child: const Icon(CupertinoIcons.share_up)),
          const Spacer(),
          InkResponse(
              onTap: () {
                widget.bookmarkPost();
              },
              child: const Icon(CupertinoIcons.bookmark))
        ],
      ),
    );
  }
}
