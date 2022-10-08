import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/login/login.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
        Container(
      width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/homebg.png'),
                fit: BoxFit.fill,
              ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              constImage.splashLogo,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Image.asset(
                constImage.splashText,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            constString.the_find,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 18.0,
                fontFamily: 'Nunito Sans'),
          ),
        ],
      ),
    )
        ],)
    );
  }

  @override
  void initState() {
   Future.delayed(const Duration(seconds: 4), () {
      Get.off(Login());
    });
  }
}
