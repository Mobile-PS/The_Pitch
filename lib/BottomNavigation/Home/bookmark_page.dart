import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_new_pitchapp/BottomNavigation/Home/bookmark_tab.dart';
import 'package:the_new_pitchapp/BottomNavigation/Home/following_tab.dart';
import 'package:the_new_pitchapp/utility/colors.dart';


List<String> videos1 = [
  'assets/videos/3.mp4',
  'assets/videos/1.mp4',
  'assets/videos/2.mp4',
];

List<String> videos2 = [
  'assets/videos/4.mp4',
  'assets/videos/5.mp4',
  'assets/videos/6.mp4',
];

List<String> imagesInDisc1 = [
  'assets/user/user1.png',
  'assets/user/user2.png',
  'assets/user/user3.png',
];

List<String> imagesInDisc2 = [
  'assets/user/user4.png',
  'assets/user/user3.png',
  'assets/user/user1.png',
];

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookmarkBody();
  }
}

class BookmarkBody extends StatefulWidget {
  @override
  _BookmarkBodyState createState() => _BookmarkBodyState();
}

class _BookmarkBodyState extends State<BookmarkBody> {
  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      /*Tab(text: 'Employers/Jobs'),
      Tab(text: 'Candidates'),*/
    ];
    return BookMarkTabPage(videos1, imagesInDisc1, false);

    /*return DefaultTabController(
      length: tabs.length,
      child: Stack(
        children: <Widget>[
          TabBarView(
            children: <Widget>[
              BookMarkTabPage(videos1, imagesInDisc1, false),
              FollowingTabPage(videos2, imagesInDisc2, true),
            ],
          ),
        *//*  SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  TabBar(
                    isScrollable: true,
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                    indicator: BoxDecoration(color: transparentColor),
                    tabs: tabs,
                  ),
                 *//**//* Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 14,
                    start: 84,
                    child: CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 3,
                    ),
                  ),*//**//*
                ],
              ),
            ),
          ),*//*
        ],
      ),
    );*/
  }
}
