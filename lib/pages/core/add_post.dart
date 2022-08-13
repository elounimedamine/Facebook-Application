import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:summer_cump_project_2022/models/post.dart';
import 'package:summer_cump_project_2022/services/auth_services.dart';
import 'package:summer_cump_project_2022/services/post_services.dart';
import 'package:summer_cump_project_2022/widgets/disable_button.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

TextEditingController _postTextController = TextEditingController();
PostServices _postServices = PostServices();
AuthServices _authServices = AuthServices();
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(18),
            child: FutureBuilder<DocumentSnapshot>(
                future:
                    _authServices.getUserData(_firebaseAuth.currentUser!.uid),
                builder: (context, snapshot) {
                  return Row(
                    children: [
                      IconButton(
                          splashRadius: 18,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(CupertinoIcons.chevron_back)),
                      const SizedBox(
                        width: 16,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CircleAvatar(
                        radius: 18,
                        foregroundImage:
                            NetworkImage(snapshot.data!["avatar_url"]),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        '${snapshot.data!["fullname"]}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  );
                }),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: TextField(
              controller: _postTextController,
              maxLines: 6,
              textAlign: TextAlign.start,
            ),
          ),
          DisabledButton(
              isDisabled: false,
              onClick: () {
                Post newPost = Post(
                  addedAt: DateTime.now().toString(),
                  author: _firebaseAuth.currentUser!.uid,
                  text: _postTextController.text,
                  privacy: 'public',
                  //liked: [],
                );
                _postServices.addPost(newPost);
              }),
        ],
      )),
    );
  }
}

bool disableButton() {
  return false;
}
