import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/models/post.dart';
import 'package:summer_cump_project_2022/services/post_services.dart';
import 'package:summer_cump_project_2022/widgets/add_post.dart';
import 'package:summer_cump_project_2022/widgets/custom_header.dart';
import 'package:summer_cump_project_2022/widgets/home_tabs.dart';
import 'package:summer_cump_project_2022/widgets/post_widget.dart';
import 'package:summer_cump_project_2022/widgets/stories.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

PostServices _postServices = PostServices();

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const HomeTabs(),
            const AddPost(),
            const Stories(),
            StreamBuilder<QuerySnapshot>(
                stream: _postServices.fetchAllPosts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => Container(
                              height: 10,
                              color: Colors.grey.shade300,
                            ),
                        itemBuilder: (context, index) {
                          Post p = Post(
                            author: snapshot.data!.docs[index]["author"],
                            text: snapshot.data!.docs[index]["text"],
                            media: '${snapshot.data!.docs[index]["media"]}',
                            privacy: snapshot.data!.docs[index]["privacy"],
                            addedAt: snapshot.data!.docs[index]["added_at"],
                            //liked: snapshot.data!.docs[index]["liked"],
                          );
                          return PostWidget(
                            post: p,
                            bookmarkPost: () {},
                          );
                        });
                  } else {
                    return const Text('loading');
                  }
                })
          ],
        ),
      )),
    );
  }
}
