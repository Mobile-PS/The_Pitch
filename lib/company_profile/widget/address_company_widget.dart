import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:the_new_pitchapp/User_Profile/widget/personal_textform_widget.dart';
import 'package:the_new_pitchapp/company_profile/widget/add_address_widget.dart';
import 'package:the_new_pitchapp/company_profile/widget/address_card_widget.dart';
import 'package:the_new_pitchapp/company_profile/widget/company_textform_widget.dart';
import 'package:the_new_pitchapp/login/login.dart';
import 'package:the_new_pitchapp/signup/signup_textform_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/constants.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';
import 'package:the_new_pitchapp/login/widget/textform_widget.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text ;

class AddressComapnyWidget extends StatefulWidget {
  const AddressComapnyWidget({Key? key}) : super(key: key);

  @override
  State<AddressComapnyWidget> createState() => _AddressComapnyWidget();
}

class _AddressComapnyWidget extends State<AddressComapnyWidget> {
  QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  List<String> _dynamicChips = ['Health', 'Food', 'Nature','Health', 'Food', 'Nature'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(padding: EdgeInsets.only(bottom: 50),
        child:FloatingActionButton(
        onPressed: () {
          Get.to(AddAddressWidget());
        },
        child: Icon(Icons.add, color: Colors.white, size: 29,),
        backgroundColor: buttonColor,
        tooltip: 'Capture Picture',
        elevation: 5,
        splashColor: Colors.grey,
      )),
     body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
               // filterSearchResults(value);
              },
             // controller: editingController,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)))),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return AddressCardWidget();
              },
            ),
          ),

        ]
      ),
    ));
  }
}
