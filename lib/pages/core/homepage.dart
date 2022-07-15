import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:summer_cump_project_2022/widgets/custom_header.dart';
import 'package:summer_cump_project_2022/widgets/home_tabs.dart';

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
        child: Column(children: const [
          //Header
          Header(),
          //CustomTabs
          HomeTabs(),
          //Add post
          //Stories view
          //Posts list
        ]),
      )),
    );
  }
}
