import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/api/apis.dart';
import 'package:the_new_pitchapp/login/login.dart';
import 'package:the_new_pitchapp/models/email_verification_response.dart';
import 'package:the_new_pitchapp/utility/common.dart';



class OtpScreenController extends GetxController {

  EmailVerificationResponse? otpEmailResponse;
  EmailVerificationResponse? sendRegResponse;

  bool loading = false;
  TextEditingController otptxtController = TextEditingController();
  String? email,name,lname,password;

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }


  OtpScreenController(this.email,this.name,this.lname,this.password);

  Future<EmailVerificationResponse> VerifyOtp(String otp,String email) async {
    toggleLoading();
    final response = await Apis().verifyOtp(otp,email);

    printLog(response);

    if (response != null && response.succeeded!) {
      otpEmailResponse = response;
     // showSnackbar(response.message);
      SendRegData(name!,lname!,email,password!,password!,1);
    }
    else{
      toggleLoading();
      update();
      showSnackbar(response!.message!);
    }

   // toggleLoading();
    return response;
  }


  Future<EmailVerificationResponse> SendRegData(String fanme,String lname,String email,String password, String confirmpassword,int type) async {
   // toggleLoading();
    final response = await Apis().sendRegData(fanme,lname,email,password,confirmpassword,type);

    printLog(response);

    if (response != null && response.succeeded!) {
      sendRegResponse = response;
      Get.offAll(Login());
      showSnackbar(response.message!);
    }
    else{
      showSnackbar(response!.message!);
    }

    toggleLoading();
    update();
    return response;
  }

}
