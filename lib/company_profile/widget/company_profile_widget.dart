import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:the_new_pitchapp/User_Profile/widget/personal_textform_widget.dart';
import 'package:the_new_pitchapp/company_profile/widget/company_textform_widget.dart';
import 'package:the_new_pitchapp/controller/company_profile_controller.dart';
import 'package:the_new_pitchapp/login/login.dart';
import 'package:the_new_pitchapp/models/IndustryDataModel.dart';
import 'package:the_new_pitchapp/signup/signup_textform_widget.dart';
import 'package:the_new_pitchapp/utility/color_constants.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/constants.dart';
import 'package:the_new_pitchapp/utility/widget/default_button.dart';
import 'package:the_new_pitchapp/login/widget/textform_widget.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text ;

class ComapnyProfileWidget extends StatefulWidget {
  const ComapnyProfileWidget({Key? key}) : super(key: key);

  @override
  State<ComapnyProfileWidget> createState() => _ComapnyProfileWidgetState();
}

class _ComapnyProfileWidgetState extends State<ComapnyProfileWidget> {
  QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  List<String> _dynamicChips = ['Health', 'Food', 'Nature','Health', 'Food', 'Nature'];

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
      return SingleChildScrollView(
        child:Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.disabled,
          child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15,),
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
                    controller: profileCtrl.companyNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Company Name',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'General Business Information',
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
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey)),
                height: 250.0,
                child: Column(
                  children: [
                    QuillToolbar.basic(controller: profileCtrl.controller,
                        showImageButton: false,
                        showVideoButton: false),
                    Divider(height: 1.0, color: Colors.grey,),
                    Expanded(
                      child: Container(
                        child: QuillEditor(
                          controller: profileCtrl.controller,
                          scrollController: ScrollController(),
                          scrollable: true,
                          autoFocus: false,
                          readOnly: false,
                          placeholder: 'You can write about year of experience, achievements thus far.  ',
                          expands: false,
                          padding: EdgeInsets.all(2.0),
                          focusNode: _focusNode,

                          // true for view only mode
                        ),
                      ),
                    )
                  ],
                )
            ),
            SizedBox(height: 20,),
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
                    controller: profileCtrl.websitetxtController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Company Website',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
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
                    controller: profileCtrl.contacttxtController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Company Contact',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: profileCtrl.emailtxtController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Company Email',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
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

            SizedBox(height: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                height: 50.0,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 0.5)

                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Icon(Icons.search, size: 18),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child:
                      TypeAheadField(
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: profileCtrl.industrycontroller,
                          cursorColor: ColorConstants.kAppcolor,
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Industries',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0,
                                fontFamily: 'Nunito Sans'),
                          ),
                        ),
                        suggestionsCallback: (pattern) {
                          profileCtrl.getIndustrydata("1.0");
                          return profileCtrl.industryList;
                        },
                        itemBuilder: (context, IndData suggestion) {
                          return Container(
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(2),
                            child: SubstringHighlight(
                              text: suggestion.name!,
                              term: profileCtrl.industrycontroller.text,
                              textStyle: const TextStyle(
                                color: Colors.black54,
                              ),
                              textStyleHighlight: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        onSuggestionSelected: (IndData suggestion) {
                          profileCtrl.updateIndustry(suggestion);
                          profileCtrl.industrycontroller.clear();
                          hideKeyBoard();
                        },
                      ),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: const Color.fromRGBO(200, 200, 200, 1),
                      child: IconButton(
                        onPressed: () {
                          // profileCtrl.skillcontroller.clear();
                          SystemChannels.textInput.invokeMethod(
                              'TextInput.hide');
                        },
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                child:
                Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: List<Widget>.generate(
                        profileCtrl.selectedIndustryList.length, (int index) {
                      return Chip(
                        label: Text(profileCtrl.selectedIndustryList[index]
                            .name!),
                        onDeleted: () {
                          profileCtrl.removeSkill(index);
                        },
                      );
                    })
                )),
            SizedBox(height: 20,),
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
                    keyboardType: TextInputType.url,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: profileCtrl.facebiiktxtController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Facebook Url',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                    keyboardType: TextInputType.url,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: profileCtrl.twittertxtController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Twitter Url',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 1.2,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                    keyboardType: TextInputType.url,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: profileCtrl.linkdintxtController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return constString.errorField;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: 'Linkedin Url',
                      suffixText: '*',
                      suffixStyle: TextStyle(
                        color: Colors.red,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle:
                      TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
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

              if(formkey.currentState!.validate()){
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
