import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/BottomNavigation/Home/following_tab.dart';
import 'package:the_new_pitchapp/CompanyBottomNavigation/Home/candidatefollowing_tab.dart';
import 'package:the_new_pitchapp/CompanyBottomNavigation/Home/companyfollowing_tab.dart';
import 'package:the_new_pitchapp/controller/video_screen_controller.dart';
import 'package:the_new_pitchapp/login/widget/progress_widget.dart';
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

class CompanyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CompanyHomeBody();
  }
}

class CompanyHomeBody extends StatefulWidget {
  @override
  _CompanyHomeBodyState createState() => _CompanyHomeBodyState();
}

class _CompanyHomeBodyState extends State<CompanyHomeBody> {


  final con = Get.put(VideoScreenController());

  @override
  void initState() {

    con.getCandidate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = [
      Tab(text: 'Employers/Jobs'),
      Tab(text: 'Candidates'),
    ];
    return GetBuilder<VideoScreenController>(builder: (_)
    {
      return
        con.loading ?
        Scaffold(
            backgroundColor: const Color.fromRGBO(243, 246, 247, 1),
            body: Container(
              color: Colors.white,
              child: const Center(child: ProgressBarWidget()),
            )) :
        DefaultTabController(
          length: tabs.length,
          child: Stack(
            children: <Widget>[
              TabBarView(
                children: <Widget>[
                  CompanyFollowingTabPage(con.Eployerdata!, false),
                  CandidateFollowingTabPage(con.candidatedata!, true),
                ],
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Stack(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelStyle: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                        indicator: BoxDecoration(color: transparentColor),
                        tabs: tabs,
                      ),
                      /* Positioned.directional(
                    textDirection: Directionality.of(context),
                    top: 14,
                    start: 84,
                    child: CircleAvatar(
                      backgroundColor: mainColor,
                      radius: 3,
                    ),
                  ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
    });
  }
}
