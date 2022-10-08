import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_new_pitchapp/User_Profile/widget/personal_textform_widget.dart';
import 'package:the_new_pitchapp/controller/profile_screen_controller.dart';
import 'package:the_new_pitchapp/login/login.dart';
import 'package:the_new_pitchapp/models/city_response.dart';
import 'package:the_new_pitchapp/models/country_response.dart';
import 'package:the_new_pitchapp/models/state_response.dart';
import 'package:the_new_pitchapp/signup/signup_textform_widget.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/constants.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';
import 'package:the_new_pitchapp/login/widget/textform_widget.dart';

class PersonalFormWidget extends StatefulWidget {
  const PersonalFormWidget({Key? key}) : super(key: key);

  @override
  State<PersonalFormWidget> createState() => _PersonalFormWidgetState();
}

class _PersonalFormWidgetState extends State<PersonalFormWidget> {

  final profileCtrl = Get.put(ProfileScreenController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {

    profileCtrl.init(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(builder: (_)
    {
      return SingleChildScrollView(
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.disabled,
          child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
        Container(
            width: MediaQuery.of(context).size.width / 1.2,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                controller: profileCtrl.controllerFirstName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return constString.errorField;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: 'First Name',
                  suffixText: '*',
                  suffixStyle: TextStyle(
                    color: Colors.red,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

            SizedBox(height: 20,),
            Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: profileCtrl.controllerLastName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Last Name',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

            SizedBox(height: 20,),
            Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: profileCtrl.emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Email Address',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

            SizedBox(height: 20,),
            Container(
                width: MediaQuery.of(context).size.width / 1.2,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    controller: profileCtrl.mobiletxtController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Mobile Number',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),

                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

            SizedBox(height: 20,),
            Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    controller: profileCtrl.addresstxtController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Address',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

            SizedBox(height: 20,),
            Container(
                width: MediaQuery.of(context).size.width / 1.2,
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
                    controller: profileCtrl.zipcodetxtController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.blueAccent,
                        onPressed: () {
                          profileCtrl.getZip(int.parse(profileCtrl.zipcodetxtController.text));

                        },
                      ),
                      fillColor: Colors.white,
                      labelText: 'Zip Code',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
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

            SizedBox(height: 15,),
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Country',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 2,),
                    Text(
                      '*',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ],)),
            SizedBox(height: 5,),
            Container(width: MediaQuery
                .of(context)
                .size
                .width / 1.2,
              height: 50.0,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      "Country",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          fontFamily: 'Nunito Sans'),
                    ),
                    value: profileCtrl.selectedCountry,
                    isDense: true,
                    onChanged: (newValue) {
                      profileCtrl.updateCountry(newValue!);
                      print(newValue);
                    },
                    items: profileCtrl.countryList.map((CountryData data) {
                      return DropdownMenuItem<String>(
                        value: data.name,
                        child: Text(
                          data.name!,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                        ),
                      );
                    }).toList(),
                  ),),
            ),
            SizedBox(height: 15,),
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'State',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 2,),
                    Text(
                      '*',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ],)),
            SizedBox(height: 5,),
            Container(width: MediaQuery
                .of(context)
                .size
                .width / 1.2,
              height: 50.0,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey)),
              child: DropdownButtonHideUnderline(
                  child:  DropdownButton<String>(
                    hint: Text(
                      "State",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          fontFamily: 'Nunito Sans'),
                    ),
                    value: profileCtrl.selectedState,
                    isDense: true,
                    onChanged: (newValue) {
                      profileCtrl.updateState(newValue!);
                      print(newValue);

                    },
                    items: profileCtrl.stateList.map((StateData value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(
                          value.name!,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                        ),
                      );
                    }).toList(),
                  ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'City',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 2,),
                    Text(
                      '*',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red),
                    ),
                  ],)),
            SizedBox(height: 5,),
            Container(width: MediaQuery
                .of(context)
                .size
                .width / 1.2,
              height: 50.0,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.grey)),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text(
                      "City",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                          fontFamily: 'Nunito Sans'),
                    ),
                    value: profileCtrl.selectedCity,
                    isDense: true,
                    onChanged: (newValue) {
                      profileCtrl.updateCity(newValue!);
                      print(newValue);
                    },
                    items: profileCtrl.cityList.map((CityData value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(
                          value.name!,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                        ),
                      );
                    }).toList(),
                  ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Align(
                  alignment: Alignment.center,
                  child:
                  Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: profileCtrl.selectedFile != null ?
                            FileImage(profileCtrl.selectedFile!):
                            profileCtrl.profileURL != null? NetworkImage(profileCtrl.profileURL!):
                            AssetImage("assets/images/avatar.png") as ImageProvider,
                          )))),

              SizedBox(width: 10,),
              FlatButton(
                minWidth: 100.0,
                onPressed: () {

                  final ImagePicker _picker = ImagePicker();
                  showImageSelectionDialog(context, () async {
                    final XFile? photo = await _picker.pickImage(
                        source: ImageSource.gallery,imageQuality: 50
                    );
                    if (photo != null) {

                      File cropped = File(photo.path);
                      if (cropped != null) {
                        profileCtrl.updatePhoto(cropped);
                        // _controller.updateTopViewImage(cropped);
                      }
                    }
                  }, () async {
                    final XFile? photo = await _picker.pickImage(
                        source: ImageSource.camera,
                        imageQuality: 50
                    );
                    if (photo != null) {

                      File cropped = File(photo.path);
                      if (cropped != null) {
                        profileCtrl.updatePhoto(cropped);

                        //_controller.updateTopViewImage(cropped);
                      }
                    }
                  });

                  // Get.to(EmployeeProfileScreen());
                },
                child: Text(
                  "Upload Image",
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
              )
            ]),
            SizedBox(height: 20,),

            DefaultButton(width: MediaQuery
                .of(context)
                .size
                .width / 2, height: 50, text: 'Save', press: () {

              if(formkey.currentState!.validate()) {
                profileCtrl.uploadImageToAzure();
              }
            }
            ),
            SizedBox(height: 70,),

          ],
        )),
      );
    });
  }
}
