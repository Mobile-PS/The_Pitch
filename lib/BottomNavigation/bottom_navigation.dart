import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/BottomNavigation/Home/bookmark_page.dart';
import 'package:the_new_pitchapp/BottomNavigation/Home/home_page.dart';
import 'package:the_new_pitchapp/User_Profile/user_profile_screen.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';


class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  var details = Get.arguments;
  String position  = '0';
  var Key_Message = 'KEY';

  final List<Widget> _children = [
    HomePage(),
    BookmarkPage(),
    HomePage(),
    UserProfileScreen()

    /*ExplorePage(),
    Container(),
    NotificationMessages(),
    MyProfilePage(),*/
  ];

  void onTap(int index) {
  /*  if (index == 2) {
     // Navigator.pushNamed(context, PageRoutes.addVideoPage);
    } else {*/
    if(details[0] == '0' ||details[0] == '1' || details[0] == '2' ) {
      printLog(details[0]);
      position = details[0];
      FBroadcast.instance().broadcast(
        /// message type
        Key_Message,

        /// data
        value: 1,
      );
    }
    else {
      setState(() {
        _currentIndex = index;
      });
    }
   // }
  }
  void onTap1() {
    /*  if (index == 2) {
     // Navigator.pushNamed(context, PageRoutes.addVideoPage);
    } else {*/

    setState(() {
      _currentIndex = 3;

    });

    print('tr');
      position = details[0];
      FBroadcast.instance().broadcast(
        /// message type
        Key_Message,

        /// data
        value: 1,
      );

    // }
  }

  @override
  void initState() {
    printLog(details[0]);
    var drt = details[0];
    printLog(drt);

    if(drt == '0' || drt == '1' || drt == '2' ) {

      onTap1();


    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _bottomBarItems = [
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/ic_explore.png')),
        activeIcon: ImageIcon(AssetImage('assets/icons/ic_exploreactive.png')),
        label: 'Explore',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/ic_filter.png')),
        activeIcon: ImageIcon(AssetImage('assets/icons/ic_filteractive.png')),
        label: 'Sortlist',
      ),
   /*   BottomNavigationBarItem(
        icon: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            decoration: BoxDecoration(
              borderRadius: radius,
              color: mainColor,
            ),
            child: Icon(Icons.add)),
        label: ' ',
      ),*/
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/icons_chat.png')),
        activeIcon:
            ImageIcon(AssetImage('assets/icons/icons_chatactive.png')),
        label: 'Chat',
      ),
      BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/ic_profile.png')),
        activeIcon: ImageIcon(AssetImage('assets/icons/ic_profileactive.png')),
        label: 'Profile',
      ),
    ];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _children[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: Colors.black,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              iconSize: 22.0,
              selectedItemColor: secondaryColor,
              selectedFontSize: 12,
              unselectedFontSize: 10,
              unselectedItemColor: secondaryColor,
              items: _bottomBarItems,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
