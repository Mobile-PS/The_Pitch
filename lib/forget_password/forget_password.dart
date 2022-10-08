import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/forget_password/widget/forget_textform_widget.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,

        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Image.asset(
                  'assets/images/shape.png',
                ),
              ),
              Text(
                "FORGOT PASSWORD",
                style: TextStyle(
                    color: Color.fromRGBO(65, 64, 66, 1),
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    fontFamily: 'Nunito Sans'),
              ),
              SizedBox(
                height: 15,
              ),
              ForgotTextformWidget(
                hintText: 'Email address',
              ),
              SizedBox(
                height: 15,
              ),
              DefaultButton(width: MediaQuery.of(context).size.width/2,height: 50,text: 'Send OTP',press:(){}
              ),
            ],
          ),
        ),
      )
    ])));
  }
}
