import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/User_Profile/profile_review_screen.dart';
import 'package:the_new_pitchapp/User_Profile/widget/personal_form_widget.dart';
import 'package:the_new_pitchapp/User_Profile/widget/professional_form_widget.dart';
import 'package:the_new_pitchapp/controller/profile_screen_controller.dart';
import 'package:the_new_pitchapp/preferences/pref_repository.dart';
import 'package:the_new_pitchapp/signup/signup_form_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/constants.dart';

import 'widget/personal_uplod_form_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({
    Key? key
  }) : super(key: key);

  @override
  _UserProfileScreen createState() => _UserProfileScreen();
}

class _UserProfileScreen extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
 // final userPreference = Get.put(UserPreferenceScreenController());
  late TabController _controller;
  IconData icon = Icons.arrow_forward_ios_rounded;
  var Key_Message = 'KEY';
  final _prefRepo = PrefRepository();
   String pos = '0';
  final profileCtrl = Get.put(ProfileScreenController());


  @override
  void initState()  {

    _controller = TabController(length: 3, vsync: this);

   // _controller.animateTo(2);


    FBroadcast.instance().register(Key_Message, (value, callback) {
      // get data
      var data = value;

      print('-------');
      print(data);

      _controller.animateTo(value);

    });

    check();

    _controller.addListener(() {

      setState(() {
        pos = _controller.index.toString();
      });
      printLog("Selected Index: " + _controller.index.toString());
    });
    super.initState();

  }

  Future<void> check() async {
    final profileResponse = await _prefRepo.getLoginUserData();
    _controller.animateTo(int.parse(profileResponse!.data!.profileStageId!));

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_)
    {
     return profileCtrl.profileScreenResponse?.data?.reviewStatusId == 2?
         const UserProfileReviewScreen():
       DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              bottom: TabBar(
                labelColor: Colors.grey,
                indicatorColor: buttonColor,
                isScrollable: true,
                controller: _controller,
                tabs: [
                  Tab(
                    child: Text(
                      constString.usertab1,
                      style: const TextStyle(color: buttonColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      constString.usertab2,
                      style: const TextStyle(color: buttonColor),
                    ),
                  ),
                  Tab(
                    child: Text(
                      constString.usertab3,
                      style: const TextStyle(color: buttonColor),
                    ),
                  ),

                ],
              ),
              title: Text(pos + '/3',
                // userPreference.pcount.toString() + '/' + '6',
                style: const TextStyle(
                    fontSize: 18.0,
                    color: buttonColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito Sans'),
              ),
            ),
            body: Stack(children: [
              TabBarView(
                controller: _controller,
                children: const [
                  PersonalFormWidget(),
                  ProfessionalFormWidget(),
                  PersonalUplodFormWidget(),

                ],
              ),

            ]),
          ));
    });
  }
}
