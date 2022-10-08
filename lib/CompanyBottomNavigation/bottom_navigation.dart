import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/BottomNavigation/Home/bookmark_page.dart';
import 'package:the_new_pitchapp/BottomNavigation/Home/home_page.dart';
import 'package:the_new_pitchapp/CompanyBottomNavigation/Home/bookmark_page.dart';
import 'package:the_new_pitchapp/CompanyBottomNavigation/Home/companyhome_page.dart';
import 'package:the_new_pitchapp/User_Profile/user_profile_screen.dart';
import 'package:the_new_pitchapp/company_profile/company_profile_screen.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';


class CompanyBottomNavigation extends StatefulWidget {
  @override
  _CompanyBottomNavigationState createState() => _CompanyBottomNavigationState();
}

class _CompanyBottomNavigationState extends State<CompanyBottomNavigation> {
  int _currentIndex = 0;
  var details = Get.arguments;
  var Key_Message = 'KEY1';

  final List<Widget> _children = [
    CompanyHomePage(),
    ComapnyBookmarkPage(),
    HomePage(),
    CompanyProfileScreen()

    /*ExplorePage(),
    Container(),
    NotificationMessages(),
    MyProfilePage(),*/
  ];

  void onTap(int index) {
    /*if (index == 2) {
     // Navigator.pushNamed(context, PageRoutes.addVideoPage);
    } else {*/
    if(details[0] == '0' ||details[0] == '1' || details[0] == '2' ) {
      printLog(details[0]);
    }
    else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void initState() {
    if(details[0] == '0' ||details[0] == '1' || details[0] == '2' ) {

      setState(() {
        _currentIndex = 3;
      });
    }

    FBroadcast.instance().register(Key_Message, (value, callback) {
      // get data
      var data = value;

      print('-------');
      print(data);

      setState(() {
        _currentIndex = 0;
      });
    });

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
