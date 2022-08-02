import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/pages/core/profile.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final List<String> _tabs = ['Home', 'Favorites'];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                enableFeedback: true,
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: CustomTab(
                  currentIndex: _currentIndex,
                  index: index,
                  tabTitle: _tabs[index],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12.0);
            },
            itemCount: _tabs.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}

class CustomTab extends StatefulWidget {
  final int currentIndex;
  final int index;
  final String tabTitle;

  const CustomTab(
      {Key? key,
      required this.currentIndex,
      required this.index,
      required this.tabTitle})
      : super(key: key);
  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, left: 4, right: 4),
      child: Column(
        children: [
          Text(
            widget.tabTitle,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: widget.currentIndex == widget.index
                  ? FontWeight.bold
                  : FontWeight.normal,
              color: widget.currentIndex == widget.index
                  ? Colors.blue
                  : Colors.grey[400],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Visibility(
            visible: true,
            replacement: const SizedBox.shrink(),
            child: Container(
              width: widget.currentIndex == widget.index ? 90 : .0001,
              height: 4.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
