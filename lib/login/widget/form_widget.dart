import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/BottomNavigation/bottom_navigation.dart';
import 'package:the_new_pitchapp/CompanyBottomNavigation/bottom_navigation.dart';
import 'package:the_new_pitchapp/controller/login_screen_controller.dart';
import 'package:the_new_pitchapp/forget_password/forget_password.dart';
import 'package:the_new_pitchapp/signup/signup.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';
import 'package:the_new_pitchapp/login/widget/textform_widget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {

  final con = Get.put(LoginScreenController());
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {

    con.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginScreenController>(builder: (_)
    {
      return SingleChildScrollView(
        child:  Form(
          key: _formkey,
          autovalidateMode: AutovalidateMode.disabled,
          child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),

            Container(
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: con.usertxtController,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Email Address',
                      hintText: 'Email Address',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide(
                          color: buttonColor,
                          width: 1.0,
                        ),
                      ),

                    ))),

            SizedBox(height: 30,),
        Container(
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: TextFormField(
                obscureText: con.togggle,
                controller: con.passwordController,
                textAlign: TextAlign.center,
                autovalidateMode:
                AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'Password',
                  hintText: 'Password',
                  suffixText: '*',
                  suffixStyle: TextStyle(
                    color: Colors.red,
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(
                          con.togggle
                        ? Icons.visibility_off
                        : Icons.visibility,
                          //change icon based on boolean value
                          color: Colors.grey
                      ),
                      onPressed: () {
                         con.tooglePassword();
                      }),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.normal,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    borderSide: BorderSide(
                      color: buttonColor,
                      width: 1.0,
                    ),
                  ),

                ))),

            SizedBox(height: 5,),
            SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.vpn_key, color: buttonColor,),
                    SizedBox(width: 5,),
                    GestureDetector(onTap: () {
                      Get.to(ForgotPassword());
                    }, child:
                    Text('Forget Password?', style: TextStyle(
                      color: buttonColor,
                      fontWeight: FontWeight.normal,
                    ),))
                  ],)),

            SizedBox(height: 20,),

            DefaultButton(width: MediaQuery
                .of(context)
                .size
                .width / 2, height: 50, text: 'Log In', press: () {
              if(_formkey.currentState!.validate()) {
                con.init(context);
                con.getLogin('candidate');
              }
             // Get.to(BottomNavigation());
            }
            ),
            SizedBox(height: 30,),

            Divider(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 15,),
            GestureDetector(onTap: () {
              Get.to(Signup());
            }, child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),),
                SizedBox(width: 5,),
                Text('Sign up', style: TextStyle(
                  color: buttonColor,
                  fontWeight: FontWeight.bold,
                ),)
              ],))
          ],
        )),
      );
    });
  }
}
