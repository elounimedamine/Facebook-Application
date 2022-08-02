import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  final List _stories = ['hei', 'verden', 'fra', 'oslo', 'norge'];
  @override
  void initState() {
    _stories.insert(0, '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                CupertinoIcons.play_fill,
                color: Colors.black87,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Stories",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: _stories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildAddStory();
                  } else {
                    return Story(
                      i: _stories[index],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class Story extends StatefulWidget {
  final String i;
  const Story({Key? key, required this.i}) : super(key: key);

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      height: 110,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.grey.shade200,
      ),
      child: Center(
        child: Text(widget.i.toString()),
      ),
    );
  }
}

Widget _buildAddStory() {
  return Container(
    margin: const EdgeInsets.only(right: 6),
    height: 110,
    width: 90,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      color: Colors.grey.shade200,
    ),
    child: Center(
      child: InkResponse(
        onTap: () {},
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey.shade300,
          child: const Icon(
            CupertinoIcons.add,
            size: 20,
            color: Colors.black87,
          ),
        ),
      ),
    ),
  );
}
