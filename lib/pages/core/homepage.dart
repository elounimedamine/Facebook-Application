import 'package:flutter/material.dart';
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
            ListView.separated(
                itemCount: 17,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => Container(
                      height: 10,
                      color: Colors.grey.shade300,
                    ),
                itemBuilder: (context, index) {
                  return PostWidget(
                    bookmarkPost: () {},
                  );
                })
          ],
        ),
      )),
    );
  }
}
