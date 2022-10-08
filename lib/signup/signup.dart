

import 'package:flutter/material.dart';
import 'package:the_new_pitchapp/login/widget/form_widget.dart';
import 'package:the_new_pitchapp/login/widget/textform_widget.dart';
import 'package:the_new_pitchapp/signup/signup_form_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/constants.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup> with SingleTickerProviderStateMixin {
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
                    Text(constString.regcandidateemail,style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),)
                  ],),
              ],
              ),
            ),
            Expanded(child:
            Container(
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

                  SignupFormWidget(),
                  SignupFormWidget(),

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