import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/models/post.dart';
import 'package:summer_cump_project_2022/services/auth_services.dart';

AuthServices _authServices = AuthServices();

class PostWidget extends StatelessWidget {
  final Function bookmarkPost;
  final Post post;

  const PostWidget({
    Key? key,
    required this.bookmarkPost,
    required this.post,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          FutureBuilder<DocumentSnapshot>(
              future: _authServices.getUserData(post.author),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return UserMetaData(
                    avatar: snapshot.data!["avatar_url"],
                    username: snapshot.data!["fullname"],
                    addedAt: post.addedAt,
                    privacy: post.privacy,
                  );
                } else {
                  return const Text('Loading....');
                }
              }),
          const SizedBox(
            height: 14,
          ),
          PostBody(
            text: post.text!,
            mediaURL: post.media!,
          ),
          PostActions(
            bookmarkPost: bookmarkPost,
          )
        ],
      ),
    );
  }
}

class UserMetaData extends StatelessWidget {
  final String avatar;
  final String username;
  final String addedAt;
  final String privacy;

  const UserMetaData(
      {Key? key,
      required this.avatar,
      required this.username,
      required this.privacy,
      required this.addedAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          foregroundImage: NetworkImage(avatar),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // ignore: unnecessary_brace_in_string_interps, unnecessary_string_interpolations
              '${username}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  // ignore: unnecessary_brace_in_string_interps
                  '${addedAt} • ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Icon(
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
  final String text;
  final String mediaURL;

  const PostBody({Key? key, required this.text, required this.mediaURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                child: Text(
              text,
            )),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        // ignore: unnecessary_null_comparison
        mediaURL.isEmpty || mediaURL == null
            ? Container(
                color: Colors.grey.shade200,
                height: 250,
              )
            : const SizedBox.shrink(),
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
