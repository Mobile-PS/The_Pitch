import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/BottomNavigation/bottom_navigation.dart';
import 'package:the_new_pitchapp/api/apis.dart';
import 'package:the_new_pitchapp/models/CandidateModel.dart';
import 'package:the_new_pitchapp/models/EmployerModel.dart';
import 'package:the_new_pitchapp/models/LoginResponse.dart';
import 'package:the_new_pitchapp/preferences/pref_repository.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/widget_collection.dart';





class VideoScreenController extends GetxController {


  List<CData>? candidatedata = [];
  List<EData>? Eployerdata = [];


  TextEditingController usertxtController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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


  Future<dynamic> getCandidate() async {
    toggleLoading();
   // _widgets?.startLoader();

    final profileResponse = await _prefRepo.getLoginUserData();

    final response = await Apis().GetCandidate(profileResponse!.data!.jwToken!);

    printLog(response);

    if (response != null) {
    //  pref.clearPreferences();

     // _widgets?.stopLoader();
      candidatedata = response.data;

      getEmployer();
     // Get.to(BottomNavigation());
      //showSnackbar('S');
     // Get.to(ReferalScreen());


    }
    else{

      toggleLoading();
      //_widgets?.stopLoader();

      showSnackbar('Fail');

    }

    update();
  }


  Future<dynamic> getEmployer() async {
    //  toggleLoading();
    // _widgets?.startLoader();

    final profileResponse = await _prefRepo.getLoginUserData();

    final response = await Apis().GetEmployer(profileResponse!.data!.jwToken!);

    printLog(response);

    if (response != null) {
      //  pref.clearPreferences();

      // _widgets?.stopLoader();
      Eployerdata = response.data;

      //showSnackbar('S');
      // Get.to(ReferalScreen());
      toggleLoading();

    }
    else{

      toggleLoading();
      //_widgets?.stopLoader();

      showSnackbar('Fail');

    }

    update();
  }

}
