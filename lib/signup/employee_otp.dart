import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/controller/otp_screen_controller.dart';
import 'package:the_new_pitchapp/login/login.dart';


class EmployeeOtp extends StatefulWidget {
  final String name, lname, email, password;

  const EmployeeOtp({Key? key, required this.name, required this.lname, required this.email, required this.password})
      : super(key: key);

  @override
  _EmployeeOtp createState() => _EmployeeOtp();
}

class _EmployeeOtp extends State<EmployeeOtp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpScreenController>(
        init: OtpScreenController(widget.email,widget.name,widget.lname,widget.password),
        builder: (otpCtrl)
    {
      return Scaffold(
          body: SingleChildScrollView(
              child: Stack(children: <Widget>[
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 4,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 1.5,
                              child: Image.asset(
                                'assets/images/shape.png',
                              ),
                            ),
                            Text(
                              "VERIFY EMAIL",
                              style: TextStyle(
                                  color: Color.fromRGBO(65, 64, 66, 1),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                  fontFamily: 'Nunito Sans'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.0,
                                  fontFamily: 'Nunito Sans'),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Enter OTP',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                              controller: otpCtrl.otptxtController,
                              validator: (value) {
                                if (value!
                                    .trim()
                                    .isEmpty) {
                                  return "Otp is Required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            otpCtrl.loading == true
                                ? const CircularProgressIndicator()
                                : Column(
                              children: [
                                SizedBox(
                                    height: 62,
                                    child: GestureDetector(
                                        onTap: () {
                                          //  Get.to(EmployeeProfileScreen());
                                        },
                                        child: FlatButton(
                                          minWidth: double.infinity,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              otpCtrl.VerifyOtp(
                                                  otpCtrl.otptxtController.text,
                                                  widget.email);
                                            }
                                            // Get.to(EmployeeProfileScreen());
                                          },
                                          child: Text(
                                            "Verify Email",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16.0),
                                          ),
                                          color: Color.fromRGBO(
                                              105, 38, 215, 0.8),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                14.0), // <-- Radius
                                          ),
                                        ))),
                                SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Get.to(Login());
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Text(
                                          "Already a user?",
                                          style: TextStyle(
                                              color:
                                              Color.fromRGBO(86, 0, 196, 0.9),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
                                              fontFamily: 'Nunito Sans'),
                                        ),
                                        Text(
                                          "Login now",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14.0,
                                              fontFamily: 'Nunito Sans'),
                                        ),
                                      ],
                                    )),
                              ],
                            )
                          ],
                        ),
                      )),
                )
              ])));
    });
  }
}
