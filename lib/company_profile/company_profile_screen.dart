import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/company_profile/widget/address_company_widget.dart';
import 'package:the_new_pitchapp/company_profile/widget/company_profile_widget.dart';
import 'package:the_new_pitchapp/company_profile/widget/company_uplod_form_widget.dart';
import 'package:the_new_pitchapp/preferences/pref_repository.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/constants.dart';


class CompanyProfileScreen extends StatefulWidget {

  const CompanyProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _UCompanyProfileScreen createState() => _UCompanyProfileScreen();
}

class _UCompanyProfileScreen extends State<CompanyProfileScreen>
    with SingleTickerProviderStateMixin {
 // final userPreference = Get.put(UserPreferenceScreenController());
  late TabController _controller;
  IconData icon = Icons.arrow_forward_ios_rounded;
  final _prefRepo = PrefRepository();
  var Key_Message = 'KEY';
  String pos = '0';



  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: 3, vsync: this);

    FBroadcast.instance().register(Key_Message, (value, callback) {
      // get data
      var data = value;

      print('-------');
      print(data);

      _controller.animateTo(value);

    });

    check();

    _controller.addListener(() {

      setState(() {
        pos = _controller.index.toString();
      });
      printLog("Selected Index: " + _controller.index.toString());
    });
    super.initState();

  }

  Future<void> check() async {
    final profileResponse = await _prefRepo.getLoginUserData();
    _controller.animateTo(int.parse(profileResponse!.data!.profileStageId!));

  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            bottom: TabBar(
              labelColor: Colors.grey,
              indicatorColor: buttonColor,
              isScrollable: true,
              controller: _controller,
              tabs: [
                Tab(
                  child: Text(
                    constString.companytab1,
                    style: const TextStyle(color: buttonColor),
                  ),
                ),
                Tab(
                  child: Text(
                    constString.companytab2,
                    style: const TextStyle(color: buttonColor),
                  ),
                ),
                Tab(
                  child: Text(
                    constString.companytab3,
                    style: const TextStyle(color: buttonColor),
                  ),
                ),

              ],
            ),
            title: Text(pos+'/3',
             // userPreference.pcount.toString() + '/' + '6',
              style: const TextStyle(
                  fontSize: 18.0,
                  color: buttonColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito Sans'),
            ),
          ),
          body: Stack(children: [
            TabBarView(
              controller: _controller,
              children: const [
                ComapnyProfileWidget(),
                AddressComapnyWidget(),
                CompanyUplodFormWidget(),

              ],
            ),

          ]),
        ));
  }
}
