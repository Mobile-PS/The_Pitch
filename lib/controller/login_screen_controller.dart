import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/BottomNavigation/bottom_navigation.dart';
import 'package:the_new_pitchapp/CompanyBottomNavigation/bottom_navigation.dart';
import 'package:the_new_pitchapp/api/apis.dart';
import 'package:the_new_pitchapp/models/LoginResponse.dart';
import 'package:the_new_pitchapp/preferences/pref_repository.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/widget_collection.dart';





class LoginScreenController extends GetxController {


  TextEditingController usertxtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController usertxtController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

   bool loading = false;

  bool checkBox = false;
  final _prefRepo = PrefRepository();
  WidgetsCollection? _widgets;
  BuildContext? _context;

  bool togggle = true;

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  void toogleCheckbox() {
    checkBox = !checkBox;
    update();
  }

  void tooglePassword(){
    togggle = !togggle;
    update();
  }

  void init(BuildContext context){
    _widgets = WidgetsCollection(context);
    _context = context;
  }


  Future<dynamic> getLogin(String type) async {
  //  toggleLoading();
    _widgets?.startLoader();
    final response = await Apis().Login(usertxtController.text,passwordController.text,type);

    printLog(response);

    if (response != null) {
    //  pref.clearPreferences();

      _prefRepo.saveLoginData(response);
      _widgets?.stopLoader();

      Get.to(BottomNavigation(),arguments: [response.data!.profileStageId!]);
      //showSnackbar('S');
     // Get.to(ReferalScreen());

    }
    else{

      _widgets?.stopLoader();

      showSnackbar('Fail');

    }

    update();
  }

  Future<dynamic> getLogin1(String type) async {
    //  toggleLoading();
    _widgets?.startLoader();
    final response = await Apis().Login(usertxtController1.text,passwordController1.text,type);

    printLog(response);

    if (response != null) {
      //  pref.clearPreferences();

      _prefRepo.saveLoginData(response);
      _widgets?.stopLoader();

      Get.to(CompanyBottomNavigation(),arguments: [response.data!.profileStageId!]);
      //showSnackbar('S');
      // Get.to(ReferalScreen());

    }
    else{

      _widgets?.stopLoader();

      showSnackbar('Fail');

    }

    update();
  }




}
