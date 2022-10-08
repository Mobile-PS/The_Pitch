import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/User_Profile/widget/personal_form_widget.dart';
import 'package:the_new_pitchapp/User_Profile/widget/professional_form_widget.dart';
import 'package:the_new_pitchapp/preferences/pref_repository.dart';
import 'package:the_new_pitchapp/signup/signup_form_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/constants.dart';

import 'widget/personal_uplod_form_widget.dart';

class UserProfileReviewScreen extends StatefulWidget {
  const UserProfileReviewScreen({
    Key? key
  }) : super(key: key);

  @override
  _UserProfileScreen createState() => _UserProfileScreen();
}

class _UserProfileScreen extends State<UserProfileReviewScreen> {
 // final userPreference = Get.put(UserPreferenceScreenController());
  late TabController _controller;
  IconData icon = Icons.arrow_forward_ios_rounded;
  var Key_Message = 'KEY1';
  final _prefRepo = PrefRepository();
   String pos = '0';

  @override
  void initState()  {

    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                FBroadcast.instance().broadcast(
                  /// message type
                  Key_Message,

                  /// data
                  value: 1,
                );
                Get.back();

              },
            ),


          ),
          body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                    Text('Profile Status',
                      // userPreference.pcount.toString() + '/' + '6',
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: buttonColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Nunito Sans'),
                    ),
                  ],),

                  SizedBox(height: 20,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

          Text('Your profile is Under Review',
                    // userPreference.pcount.toString() + '/' + '6',
                    style: const TextStyle(
                        fontSize: 18.0,
                        color: buttonColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito Sans'),
                  ),
                  ]),
                  SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child:
                      Center(child:
                  Text('Note: You will get notified through mail, \nonce your profile is verified by our team.',
                    // userPreference.pcount.toString() + '/' + '6',
                    style: const TextStyle(
                        fontSize: 16.0,
                        color: buttonColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Nunito Sans'),
                  ))),
                  ])
                ],
          )),
        );
  }
}
