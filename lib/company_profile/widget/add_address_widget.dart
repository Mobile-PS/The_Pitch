import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_new_pitchapp/company_profile/widget/company_textform_widget.dart';
import 'package:the_new_pitchapp/controller/company_profile_controller.dart';
import 'package:the_new_pitchapp/login/login.dart';
import 'package:the_new_pitchapp/signup/signup_textform_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/constants.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';

class AddAddressWidget extends StatefulWidget {
  const AddAddressWidget({Key? key}) : super(key: key);

  @override
  State<AddAddressWidget> createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget> {
  final FocusNode _focusNode = FocusNode();
  List<String> _dynamicChips = [
    'Health',
    'Food',
    'Nature',
    'Health',
    'Food',
    'Nature'
  ];

  final profileCtrl = Get.put(CompanyProfileScreenController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    profileCtrl.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<CompanyProfileScreenController>(builder: (_)
    {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text('Add Address', style: TextStyle(color: Colors.black)),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                    child: Form(
                        key: formkey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    controller:
                                    profileCtrl.companyAddressTitleController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return constString.errorField;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelText: 'Title',
                                      suffixText: '*',
                                      suffixStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                        borderSide: BorderSide(
                                          color: buttonColor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    controller: profileCtrl
                                        .companyAddressController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return constString.errorField;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelText: 'Address',
                                      suffixText: '*',
                                      suffixStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                        borderSide: BorderSide(
                                          color: buttonColor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    keyboardType: TextInputType.number,
                                    controller: profileCtrl
                                        .companyZipController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return constString.errorField;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelText: 'Zip Code',
                                      suffixText: '*',
                                      suffixStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                        borderSide: BorderSide(
                                          color: buttonColor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: profileCtrl.countryList1,
                                  label: "Country",
                                  hint: "Country",
                                  enabled: true,
                                  showSearchBox: true,
                                  showClearButton: true,
                                  onChanged: (value) {
                                    if (value != null) {
                                      profileCtrl.updateCountry(value);
                                    }
                                  },
                                )),
                            SizedBox(height: 20),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: profileCtrl.stateList1,
                                  label: "State",
                                  hint: "State",
                                  enabled: true,
                                  showSearchBox: true,
                                  showClearButton: true,
                                  onChanged: (value) {
                                    if (value != null) {
                                      profileCtrl.updateState(value);
                                    }
                                  },
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  showSelectedItems: true,
                                  items: profileCtrl.cityList1,
                                  label: "City",
                                  hint: "City",
                                  enabled: true,
                                  showSearchBox: true,
                                  showClearButton: true,
                                  onChanged: (value) {
                                    if (value != null) {
                                      profileCtrl.updateCity(value);
                                    }
                                  },
                                )),
                            SizedBox(height: 20),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    controller:
                                    profileCtrl.companyConatctPersonController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return constString.errorField;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelText: 'Contact Person',
                                      suffixText: '*',
                                      suffixStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                        borderSide: BorderSide(
                                          color: buttonColor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    controller: profileCtrl
                                        .companyEmailController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return constString.errorField;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelText: 'Contact Email',
                                      suffixText: '*',
                                      suffixStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                        borderSide: BorderSide(
                                          color: buttonColor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1.2,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    controller: profileCtrl
                                        .companyMobileController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return constString.errorField;
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      labelText: 'Mobile Number',
                                      suffixText: '*',
                                      suffixStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                      labelStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            14.0),
                                        borderSide: BorderSide(
                                          color: buttonColor,
                                          width: 1.0,
                                        ),
                                      ),
                                    ))),
                            SizedBox(
                              height: 20,
                            ),
                            DefaultButton(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2,
                                height: 50,
                                text: 'Save',
                                press: () {
                                  if(formkey.currentState!.validate()) {
                                    profileCtrl.SaveStage2();
                                  }
                                }),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ))),
              )));
    });
  }
}
