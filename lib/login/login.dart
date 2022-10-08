

import 'package:flutter/material.dart';
import 'package:the_new_pitchapp/login/widget/form_widget.dart';
import 'package:the_new_pitchapp/login/widget/form_widget1.dart';
import 'package:the_new_pitchapp/login/widget/textform_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              child: Column(children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.asset(constImage.loginLogo,height: 40,width: 40,),
                  SizedBox(width: 10,),
                  Text(constString.the_pitch,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),)
                ],),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(constString.logincandidateemail,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),)
                  ],),
              ],
              ),
             // color: backgroundColor,
            ),
            Expanded(child:
            Container(
             // color: backgroundColor,
              /*  decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),*/
            child:Column(children: [
            TabBar(
              indicatorColor: buttonColor,
              labelColor: buttonColor,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset(constImage.iconProfile,height: 24,width: 24,),
                    SizedBox(width: 5,),
                    Text(
                      constString.candidate,
                      style:
                      TextStyle(color: buttonColor),
                    )
                  ],)
                ),
                Tab(

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(constImage.iconGroup,height: 24,width: 24,),
                      SizedBox(width: 5,),
                      Text(
                        constString.employer,
                        style:
                        TextStyle(color: buttonColor),
                      ),
                    ],)

                ),

              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [

                  FormWidget(),
                  FormWidget1(),

                ],
                controller: _tabController,
              ),
            ),
    ],)))
          ],
        ),
      )),
    );
  }
}