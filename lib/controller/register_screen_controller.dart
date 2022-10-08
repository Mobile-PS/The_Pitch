import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/api/apis.dart';
import 'package:the_new_pitchapp/models/email_verification_response.dart';
import 'package:the_new_pitchapp/signup/employee_otp.dart';
import 'package:the_new_pitchapp/utility/common.dart';

import '../utility/widget_collection.dart';



class RegisterScreenController extends GetxController {

  EmailVerificationResponse? otpEmailResponse;
  bool loading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emaileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool agree = false;
  bool passwordInVisible = true;
  WidgetsCollection? _widgets;
  BuildContext? _context;

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  void toggleTnc() {
    if (agree) {
      agree = false;
    } else {
      agree = true;
    }
    update();
  }

  void togglePassword() {
    if (passwordInVisible) {
      passwordInVisible = false;
    } else {
      passwordInVisible = true;
    }
    update();
  }

  void init(BuildContext context){
    _widgets = WidgetsCollection(context);
    _context = context;
  }


  Future<EmailVerificationResponse> getRegDetails() async {

    _widgets?.startLoader();
    final response = await Apis().sendOtp(emaileController.text);

    printLog(response);

    if (response != null && response.succeeded!) {
      _widgets?.stopLoader();

      otpEmailResponse = response;
      Get.to(EmployeeOtp(name: nameController.text,lname: lastnameController.text,email: emaileController.text,
      password: passwordController.text));
      showSnackbar(response.message!);
    }else{
      _widgets?.stopLoader();

      showSnackbar(response!.message!);

    }

    update();
    return response;
  }


}
