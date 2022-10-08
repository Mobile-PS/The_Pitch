import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_new_pitchapp/BottomNavigation/bottom_navigation.dart';
import 'package:the_new_pitchapp/CompanyBottomNavigation/bottom_navigation.dart';
import 'package:the_new_pitchapp/User_Profile/user_profile_screen.dart';
import 'package:the_new_pitchapp/company_profile/company_profile_screen.dart';
import 'package:the_new_pitchapp/splash_screen/splash_screen.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      title: constString.the_pitch,
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }

  ThemeData lightTheme() {
    var baseTheme = ThemeData.light();
    baseTheme.textTheme.apply(fontFamily: 'NunitoSans');
    baseTheme.copyWith(
        scaffoldBackgroundColor: primary,
        colorScheme: baseTheme.colorScheme.copyWith(
          primary: primary,
          secondary: primary,
          onSecondary: primary,
        ));

    return baseTheme;
  }
}
