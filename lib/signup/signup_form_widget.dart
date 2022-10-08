import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/controller/register_screen_controller.dart';
import 'package:the_new_pitchapp/login/login.dart';
import 'package:the_new_pitchapp/signup/signup_textform_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';
import 'package:the_new_pitchapp/login/widget/textform_widget.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({Key? key}) : super(key: key);

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  final con = Get.put(RegisterScreenController());
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    con.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterScreenController>(builder: (_)
    {
      return SingleChildScrollView(
        child: Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
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
                        controller: con.nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'First Name',
                          hintText: 'First Name',
                          suffixText: '*',
                          suffixStyle: TextStyle(
                            color: Colors.red,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
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
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
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
                        controller: con.lastnameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Last Name',
                          hintText: 'Last Name',
                          suffixText: '*',
                          suffixStyle: TextStyle(
                            color: Colors.red,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
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
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
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
                        controller: con.emaileController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Email Address';
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
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
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
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                        obscureText: con.passwordInVisible,
                        controller: con.passwordController,
                        textAlign: TextAlign.center,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                  con.passwordInVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  //change icon based on boolean value
                                  color: Colors.grey),
                              onPressed: () {
                                con.togglePassword();
                              }),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
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
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        side: BorderSide(
                          color: buttonColor,
                          // Give your checkbox border a custom width
                          width: 1.5,
                        ),
                        value: con.agree,
                        onChanged: (value) {
                          con.toggleTnc();
                        },
                      ),
                      Text(
                        'I have read and agree Terms & Conditions',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultButton(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    height: 50,
                    text: 'Register',
                    press: () {
                      if (_formkey.currentState!.validate()) {
                        if (con.agree) {
                          con.getRegDetails();
                        } else {
                          showSnackbar("please accept Terms and condition");
                        }
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(Login());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: buttonColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
              ],
            )),
      );
    });
  }
}
