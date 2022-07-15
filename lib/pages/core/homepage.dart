import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/widgets/add_post.dart';
import 'package:summer_cump_project_2022/widgets/custom_header.dart';
import 'package:summer_cump_project_2022/widgets/home_tabs.dart';
import 'package:summer_cump_project_2022/widgets/post_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          //Header
          const Header(),
          //CustomTabs
          const HomeTabs(),
          //Add post
          const AddPost(),
          //Stories view
          //Posts list
          ListView.builder(
              itemCount: 17,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const PostWidget();
              })
        ]),
      )),
    );
  }
}
