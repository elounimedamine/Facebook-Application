import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/pages/core/profile.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  List<String> _tabs = ['Home', 'Favorites', 'Recent'];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 36.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.separated(
            // InkResponse(
            //   onTap(){
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
            //   },
            //   radius: 20,
            //   child: const Icon(
            //     CupertinoIcons.line_horizontal_3,
            //     size: 24,
            //     color: Colors.black87,
            //   ),
            // ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: CustomTab(
                    currentIndex: _currentIndex,
                    index: index,
                    tabtitle: _tabs[index]),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 6.0);
            },
            itemCount: _tabs.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
          ),
          const Spacer(),
          InkResponse(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              radius: 20,
              child: const Icon(
                CupertinoIcons.line_horizontal_3,
                size: 24,
                color: Colors.black87,
              )),
        ],
        // children: [
        //   ListView.separated(
        //     itemBuilder: (context, index) {
        //       return InkWell(
        //         onTap: () {
        //           setState(() {
        //             _currentIndex = index;
        //           });
        //         },
        //         child: CustomTab(
        //             currentIndex: _currentIndex,
        //             index: index,
        //             tabtitle: _tabs[index]),
        //       );
        //     },
        //     separatorBuilder: (context, index) {
        //       return const SizedBox(width: 6.0);
        //     },
        //     itemCount: _tabs.length,
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     physics: const NeverScrollableScrollPhysics(),
        //   ),
        // const Spacer(),
        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       CupertinoIcons.slider_horizontal_3,
        //       color: Colors.black87,
        //     )),
        // ],
      ),
    );
  }
}

class CustomTab extends StatefulWidget {
  final int currentIndex;
  final int index;
  final String tabtitle;

  const CustomTab(
      {Key? key,
      required this.currentIndex,
      required this.index,
      required this.tabtitle})
      : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.tabtitle,
          style: TextStyle(
              fontSize: 18.0,
              color: widget.currentIndex == widget.index
                  ? Colors.blue
                  : Colors.grey[400]),
        ),
        const SizedBox(height: 8.0),
        Container(
          width: 80.0,
          height: 4.0,
          color: widget.currentIndex == widget.index
              ? Colors.blue
              : Colors.transparent,
        ),
      ],
    );
  }
}
