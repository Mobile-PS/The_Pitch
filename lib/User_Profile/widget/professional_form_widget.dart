import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text ;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:the_new_pitchapp/User_Profile/widget/professional_textform_widget.dart';
import 'package:the_new_pitchapp/controller/profile_screen_controller.dart';
import 'package:the_new_pitchapp/models/IndustryDataModel.dart';
import 'package:the_new_pitchapp/models/getemptype_response.dart';
import 'package:the_new_pitchapp/models/skill_response.dart';
import 'package:the_new_pitchapp/utility/color_constants.dart';
import 'package:the_new_pitchapp/utility/colors.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/const_string.dart';
import 'package:the_new_pitchapp/utility/constants.dart';

import 'package:the_new_pitchapp/utility/widget/default_button.dart';

class ProfessionalFormWidget extends StatefulWidget {
   const ProfessionalFormWidget({Key? key}) : super(key: key);

  @override
  State<ProfessionalFormWidget> createState() => _ProfessionalFormWidgetState();
}

class _ProfessionalFormWidgetState extends State<ProfessionalFormWidget> {

  final FocusNode _focusNode = FocusNode();


  List<String> _dynamicChips = ['Health', 'Food', 'Nature','Health', 'Food', 'Nature'];

  final profileCtrl = Get.put(ProfileScreenController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {

    profileCtrl.init(context);

    profileCtrl.getEmpTypedata('1.0');
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
                        controller: profileCtrl.jobtitlecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return constString.errorField;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Job Title',
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
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: profileCtrl.experiencecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return constString.errorField;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Experience (in Year)',
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
                          'Employee Type',
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
                        "Employee Type",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                      value: profileCtrl.selectedEmptype,
                      isDense: true,
                      onChanged: (newValue) {
                        profileCtrl.updateEmpType(newValue!);
                        // print(currentSelectedValue);
                      },
                      items: profileCtrl.emptypeList.map((
                          EmploymentTypes value) {
                        return DropdownMenuItem<String>(
                          value: value.type,
                          child: Text(
                            value.type!,
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
                          'About',
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
                        borderRadius: BorderRadius.circular(12.0),
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
                          'Industry',
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
                        "Industry Type",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                            fontFamily: 'Nunito Sans'),
                      ),
                      value: profileCtrl.selectedIndtype,
                      isDense: true,
                      onChanged: (newValue) {
                        profileCtrl.updateIndustryType(newValue!);
                        // print(currentSelectedValue);
                      },
                      items: profileCtrl.industryList.map((IndData value) {
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
                              controller: profileCtrl.skillcontroller,
                              cursorColor: ColorConstants.kAppcolor,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ConstString().serachskill,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.0,
                                    fontFamily: 'Nunito Sans'),
                              ),
                            ),
                            suggestionsCallback: (pattern) {
                              profileCtrl.getSkilldata("1.0", pattern);
                              return profileCtrl.skillList;
                            },
                            itemBuilder: (context, SkillData suggestion) {
                              return Container(
                                height: 40,
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(2),
                                child: SubstringHighlight(
                                  text: suggestion.skillName!,
                                  term: profileCtrl.skillcontroller.text,
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
                            onSuggestionSelected: (SkillData suggestion) {
                              profileCtrl.updateSkill(suggestion);
                              profileCtrl.skillcontroller.clear();
                              hideKeyBoard();
                            },
                          ),
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: const Color.fromRGBO(
                              200, 200, 200, 1),
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
                            profileCtrl.selectedSkillList.length, (int index) {
                          return Chip(
                            label: Text(profileCtrl.selectedSkillList[index]
                                .skillName!),
                            onDeleted: () {
                              profileCtrl.removeSkill(index);
                            },
                          );
                        })
                    )),
                SizedBox(height: 20),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
                    height: 50.0,
                    child:
                    TextFormField(
                      maxLines: 1,
                      controller: profileCtrl.otherSkilltxtController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.blueAccent,
                          onPressed: () {
                            if (!profileCtrl.otherSkilltxtController.text
                                .isEmpty) {
                              profileCtrl.updateOtherSkill(
                                  profileCtrl.otherSkilltxtController.text);
                            }
                          },
                        ),
                        hintText: 'Other Skills',
                        labelText: 'Other Skills',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    )),
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
                            profileCtrl.otherSkillList.length, (int index) {
                          return Chip(
                            label: Text(profileCtrl.otherSkillList[index]),
                            onDeleted: () {
                              profileCtrl.removeOtherSkill(index);
                            },
                          );
                        })
                    )),
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
                          'Work Location',
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
                          "Preferred Location",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              fontFamily: 'Nunito Sans'),
                        ),
                        value: profileCtrl.selectedLocation,
                        isDense: true,
                        onChanged: (newValue) {
                          profileCtrl.updateLocation(newValue!);
                          // print(currentSelectedValue);
                        },
                        items: profileCtrl.prefLocation.map((
                            WorkLocationTypes value) {
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
                      )),
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
                        controller: profileCtrl.expectedSalarycontroller,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return constString.errorField;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          labelText: 'Desired Salary',
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

                DefaultButton(width: MediaQuery
                    .of(context)
                    .size
                    .width / 2, height: 50, text: 'Save', press: () {

                  if(formkey.currentState!.validate()) {
                    profileCtrl.SaveStage2();
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
