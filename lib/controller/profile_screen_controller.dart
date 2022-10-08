import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:azblob/azblob.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:mime_type/mime_type.dart';
import 'package:the_new_pitchapp/User_Profile/profile_review_screen.dart';
import 'package:the_new_pitchapp/api/apis.dart';
import 'package:the_new_pitchapp/api/constants.dart';
import 'package:the_new_pitchapp/models/IndustryDataModel.dart';
import 'package:the_new_pitchapp/models/city_response.dart';
import 'package:the_new_pitchapp/models/common_screen_response.dart';
import 'package:the_new_pitchapp/models/country_response.dart';
import 'package:the_new_pitchapp/models/getemptype_response.dart';
import 'package:the_new_pitchapp/models/getuser_response.dart';
import 'package:the_new_pitchapp/models/profile_screen_response.dart';
import 'package:the_new_pitchapp/models/skill_response.dart';
import 'package:the_new_pitchapp/models/state_response.dart';
import 'package:the_new_pitchapp/models/zipcode_response.dart';
import 'package:the_new_pitchapp/preferences/pref_repository.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/image_utils.dart';
import 'package:the_new_pitchapp/utility/widget_collection.dart';



class ProfileScreenController extends GetxController {

  ProfileScreenResponse? profileScreenResponse;
  CountryResponse? countryResponse;
  StateResponse? stateResponse;
  CityResponse? cityResponse;
  ZipcodeResponse? zipcodeResponse;
  GetUserResponse? getUserResponse;
  EmpTypeResponse? empTypeResponse;
  SkillResponse? skillResponse;
  IndustryDataModel? industryResponse;

  bool loading = false;

   TextEditingController controllerFirstName = new TextEditingController();
   TextEditingController controllerLastName = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController zipcodetxtController = TextEditingController();
  TextEditingController addresstxtController = TextEditingController();
  TextEditingController mobiletxtController = TextEditingController();

  QuillController controller = QuillController.basic();


  TextEditingController otherSkilltxtController = TextEditingController();
  TextEditingController skillcontroller = TextEditingController();
  TextEditingController jobtitlecontroller = TextEditingController();
  TextEditingController experiencecontroller = TextEditingController();
  TextEditingController profilesummarycontroller = TextEditingController();
  TextEditingController currentSalarycontroller = TextEditingController();
  TextEditingController expectedSalarycontroller = TextEditingController();
  TextEditingController videolinkcontroller = TextEditingController();



  CommonScreenResponse? stage1Response;
  final pref = PrefRepository();
  List<CountryData> countryList = [];
  List<StateData> stateList = [];
  List<CityData> cityList = [];
  List<EmploymentTypes> emptypeList = [];
  List<WorkLocationTypes> prefLocation = [];
  List<SkillData> skillList = [];
  List<SkillData> selectedSkillList = [];
  List<String> otherSkillList = [];
  List<IndData> industryList = [];

  int pageNum = 0;
  final constant = ApiConstants();

  int radioID = 1;


  int? countryID;
  int? stateID;
  int? cityID;
  int? profileID;

  int? indID;

  int? empID;
  int? locID;

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  File? selectedFile;
  String? filePath;
  File? selectedResume;
  File? selectedVideo;
  String? cvName;
  String? selectedEmptype;
  String? selectedIndtype;

  String? selectedLocation;

  String? videoLink;

  String? videoType;

  String? resumPath;
  String? videoPath;

  String? profileURL;
  String? resumeURL;
  String? videoURL;

  int? stageID;
  List<String> tempSkillList = [];

  String? skillSelection;
  String? otherSkillselection;

  WidgetsCollection? _widgets;
  BuildContext? _context;
  var Key_Message = 'KEY';


  void init(BuildContext context){
    _widgets = WidgetsCollection(context);
    _context = context;
  }

  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }
  void updatePageNum(int pagnum){
    this.pageNum = pagnum;
   // update();
    if(pageNum == 1){
      getEmpTypedata("1.0");
    }
    else {
      update();
    }
  }

  void updatePhoto(File file){
    profileURL = null;
    this.selectedFile = file;
    update();

  }

  void updateVideoType(String type){
    this.videoType = type;
    update();

  }

  void updateRadioID(int id){
    this.radioID = id;
    videoURL = null;
    this.selectedVideo = null;
    this.videoLink = null;
    if(id == 2) {
      this.videoType = 'Link';
    }
    else{
      this.videoType = null;
    }
    update();
  }

  void updateSkill(SkillData data){
    this.selectedSkillList.add(data);
    update();
  }

  void removeSkill(int index){
    this.selectedSkillList.removeAt(index);
    update();
  }

  void updateOtherSkill(String data){
    this.otherSkillList.add(data);
    update();
  }

  void removeOtherSkill(int index){
    this.otherSkillList.removeAt(index);
    update();
  }

  void updateEmpType(String emptype){
    this.selectedEmptype = emptype;
    update();
  }

  void updateIndustryType(String indtype){
    this.selectedIndtype = indtype;
    update();
  }

  void updateLocation(String loc){
    this.selectedLocation = loc;
    update();
  }

  void updateCV(File file){
    resumeURL = null;
    this.selectedResume = file;
    cvName = selectedResume?.path
        .split('/')
        .last;
    update();

  }
  void updateVideo(File file){
    videoURL = null;
    this.selectedVideo = file;
    update();

  }

  void updateVideoLink(String videolink){
    videoURL = null;
    this.selectedVideo = null;
    this.videoLink = videolink;
    update();

  }

  void updateCountry(String country){
    this.selectedCountry = country;
    update();
    getStatedata("1.0");
  }

  void updateState(String state){
    this.selectedState = state;
    selectedCity = null;
    update();
    getCitydata("1.0");
  }

  void updateCity(String city){
    this.selectedCity = city;
    update();
  }

  void getZip(int zipcode){
    getZipCodedata("1.0",zipcode);
  }

  @override
  void onInit() async{
    super.onInit();
   // var data = await pref.getLoginUserData();

   // getCountrydata("1.0",data!.data!.jwToken!);

     getProfiledata(0,"1.0");
  }




  Future<ProfileScreenResponse?> getProfiledata(int profileid,String version) async {
    toggleLoading();
    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getProfile(
          profileid, version, data.data!.jwToken!);

      printLog(response);

      if (response != null && response.succeeded!) {
        profileScreenResponse = response;
        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
        if (profileScreenResponse?.data?.profileStageId == 3) {
          stageID = 2;
          updatePageNum(2);
        }
        else {
          stageID = profileScreenResponse?.data?.profileStageId;
          updatePageNum(profileScreenResponse!.data!.profileStageId!);
        }

        controllerFirstName.text = profileScreenResponse!.data!.firstName!;
        controllerLastName.text = profileScreenResponse!.data!.lastName!;
       // emailController.text = profileScreenResponse!.data!.emailId!;
        mobiletxtController.text = profileScreenResponse!.data!.mobileNumber!;
        zipcodetxtController.text = profileScreenResponse!.data!.zipCode!;
        addresstxtController.text = profileScreenResponse!.data!.addressLine1!;
        selectedCountry = profileScreenResponse!.data!.country!.name;
        selectedState = profileScreenResponse!.data!.state!.name;
        selectedCity = profileScreenResponse!.data!.city!.name;
        profileURL = profileScreenResponse!.data!.photoPath;
        resumeURL = profileScreenResponse!.data!.resumePath;
        videoURL = profileScreenResponse!.data!.videoPath;

        if (profileScreenResponse!.data!.jobDetailDto != null) {

          stageID = 2;
          pageNum = 2;

          currentSalarycontroller.text = profileScreenResponse!.data!.jobDetailDto!.currentSalary.toString();
          expectedSalarycontroller.text = profileScreenResponse!.data!.jobDetailDto!.expectedSalary.toString();

          jobtitlecontroller.text =
              profileScreenResponse!.data!.jobDetailDto!.jobTitle!;
          experiencecontroller.text =
              profileScreenResponse!.data!.jobDetailDto!.experience.toString();
          profilesummarycontroller.text =
              profileScreenResponse!.data!.jobDetailDto!.profileSummary!;
          selectedEmptype =
              profileScreenResponse!.data!.jobDetailDto!.employmentType!.type;
          selectedIndtype =
              profileScreenResponse!.data!.jobDetailDto!.industryType!.name;

          emptypeList.add(new EmploymentTypes.fromJson(
              {"id": profileScreenResponse!.data!.jobDetailDto!.employmentType!.id!,
                "type": profileScreenResponse!.data!.jobDetailDto!.employmentType!
                    .type!}));
         // controller.plainTextEditingValue.text =  profileScreenResponse!.data!.jobDetailDto!.profileSummary!;
        }


        if (profileScreenResponse!.data!.jobDetailDto != null) {
          if (profileScreenResponse!.data!.jobDetailDto!.candidateSkills!.length >
              0) {
            for (int i = 0; i <
                profileScreenResponse!.data!.jobDetailDto!.candidateSkills!
                    .length; i++) {
              selectedSkillList.add(new SkillData.fromJson({
                "id": profileScreenResponse!.data!.jobDetailDto!.candidateSkills
                !.elementAt(i)
                    .id,
                "skillName": profileScreenResponse!.data!.jobDetailDto
                !.candidateSkills
                !.elementAt(i).skillName
              }));
            }
          }

          if (profileScreenResponse!.data!.jobDetailDto!.workLocationType !=
              null) {
            selectedLocation =
                profileScreenResponse!.data!.jobDetailDto!.workLocationType!.name;
            prefLocation.add(WorkLocationTypes.fromJson({
              "id": profileScreenResponse!.data!.jobDetailDto!.workLocationType!.id,
              "distance": profileScreenResponse!.data!.jobDetailDto
              !.workLocationType
              !.distance,
              "name": profileScreenResponse!.data!.jobDetailDto!.workLocationType
              !.name
            }));

            final splitSkill = profileScreenResponse!.data!.jobDetailDto
            !.otherSkills
            !.split(',');
            for (int i = 0; i < splitSkill.length; i++) {
              otherSkillList.add(splitSkill[i]);
            }
          }
        }
            /* if(profileScreenResponse?.data?.reviewStatusId == 2){
               Get.to(const UserProfileReviewScreen());
             }*/


          stateList.add(new StateData.fromJson({"id": profileScreenResponse!.data!.state!.id,
             "name": profileScreenResponse!.data!.state!.name}));

        cityList.add(new CityData.fromJson({
          "id": profileScreenResponse!.data!.city!.id,
          "name": profileScreenResponse!.data!.city!.name
        }));

        getCountrydata("1.0",data.data!.jwToken!);
      }
      else {
        profileScreenResponse = response;
        getCountrydata("1.0",data.data!.jwToken!);
        //showSnackbar(response!.message!);
      }


     // toggleLoading();
     // update();

      return response;
    }
    }



  Future<CountryResponse?> getCountrydata(String version,String token) async {
   // toggleLoading();

      final response = await Apis().getCountry(
           version, token);

      printLog(response);

      if (response != null && response.succeeded!) {
        countryResponse = response;
        countryList = response.data!;
        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
      }
      else {
        countryResponse = response;
        showSnackbar(response!.message!);
      }

      if(profileScreenResponse!.succeeded!){
        getUserdata(version, token);
      }
      else {
        toggleLoading();
      update();
      }
      toggleLoading();
      update();
      return response;

  }

  Future<GetUserResponse?> getUserdata(String version,String token) async {
    // toggleLoading();

    final response = await Apis().getUserData(
        version, token);

    printLog(response);

    if (response != null) {
      getUserResponse = response;
      //  Get.to(EmployeeProfileScreen());
      // showSnackbar(response.message);
      controllerFirstName.text = getUserResponse!.data!.firstName!;
      controllerLastName.text = getUserResponse!.data!.lastName!;
      emailController.text = getUserResponse!.data!.email!;

      if(getUserResponse!.data?.profileId != null) {
        profileID = getUserResponse!.data?.profileId;
      }
      else{
        profileID =0;
      }
      stateID = getUserResponse!.data?.profileStageId;
      updatePageNum(getUserResponse!.data!.profileStageId!);
    }



  //  toggleLoading();
      update();

    return response;

  }


  Future<StateResponse?> getStatedata(String version) async {
     toggleLoading();

    for (var country in countryList) {
      if (country.name == selectedCountry) {
         countryID = country.id;
      }
    }
    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getState(
          version, data.data!.jwToken!, countryID!);

      printLog(response);

      if (response != null && response.succeeded!) {
        stateResponse = response;
        stateList = response.data!;
        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
      }
      else {
        stateResponse = response;
        showSnackbar(response!.message!);
      }


      toggleLoading();
      update();

      return response;
    }
  }


  Future<CityResponse?> getCitydata(String version) async {
    toggleLoading();

    for (var state in stateList) {
      if (state.name == selectedState) {
        stateID = state.id;
      }
    }

    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getCity(
          version, data.data!.jwToken!, stateID!);

      printLog(response);

      if (response != null && response.succeeded!) {
        cityResponse = response;
        cityList = response.data!;
        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
      }
      else {
        cityResponse = response;
        showSnackbar(response!.message!);
      }


      toggleLoading();
      update();

      return response;
    }
  }

  Future<ZipcodeResponse?> getZipCodedata(String version,int zipcode) async {
    //toggleLoading();

    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getZipCodeData(
          version, data.data!.jwToken!, zipcode);

      printLog(response);

      if (response != null && response.succeeded!) {
        zipcodeResponse = response;

         this.selectedCountry = response.data?.countryName;
         this.selectedState = response.data?.stateName;
         this.selectedCity = response.data?.cityName;
        cityList.add(new CityData.fromJson({
          "id": response.data?.cityId,
          "name": response.data?.cityName
        }));


        updateCountry1();
        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
      }
      else {
        zipcodeResponse = response;
        showSnackbar(response!.message!);
      }


     // toggleLoading();
     // update();

      return response;
    }
  }

  Future<StateResponse?> getStatedata1(String version) async {
   // toggleLoading();

    for (var country in countryList) {
      if (country.name == selectedCountry) {
        countryID = country.id;
      }
    }

    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getState(
          version, data.data!.jwToken!, countryID!);

      printLog(response);

      if (response != null && response.succeeded!) {
        stateResponse = response;
        stateList = response.data!;

       // updateState1();
        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
      }
      else {
        stateResponse = response;
        showSnackbar(response!.message!);
      }


     // toggleLoading();
      update();

      return response;
    }
  }

  Future<CityResponse?> getCitydata1(String version) async {
   // toggleLoading();

    for (var state in stateList) {
      if (state.name == selectedState) {
        stateID = state.id;
      }
    }

    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getCity(
          version, data.data!.jwToken!, stateID!);

      printLog(response);

      if (response != null && response.succeeded!) {
        cityResponse = response;

        cityList = response.data!;

        printLog(cityList.length);

        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
      }
      else {
        cityResponse = response;
        showSnackbar(response!.message!);
      }


     // toggleLoading();
      update();

      return response;
    }
  }


  Future uploadImageToAzure() async {

    _widgets?.startLoader();

    //toggleLoading();

    if(profileURL != null){
      if(stageID == 1 || stageID == 2){
        UpdateStage1();
      }
    }
    else {
      if(selectedFile != null) {
        try {
          String fileName = selectedFile!.path
              .split('/')
              .last;
          print(fileName);

          // read file as Uint8List
          Uint8List content = await selectedFile!.readAsBytes();
          var storage = AzureStorage.parse(BLOBURL);
          //String container = "image";
          // get the mine type of the file
          String? contentType = mime(fileName);
          await storage.putBlob('/$BUCKET_NAME/$fileName', bodyBytes: content,
              contentType: contentType,
              type: BlobType.BlockBlob);
        /*  if (stageID == 1) {
            UpdateStage1();
          }
          else {*/
            SaveStage1();
         // }
          //SaveStage1();
        } on AzureStorageException catch (ex) {
          print(ex.message);
          _widgets?.stopLoader();
        } catch (err) {
          print(err);
          _widgets?.stopLoader();

        }
      }
      else{
        _widgets?.stopLoader();

        toggleLoading();
      }
    }
  }


  Future<CommonScreenResponse?> SaveStage1() async {
    // toggleLoading();

    for (var state in stateList) {
      if (state.name == selectedState) {
        stateID = state.id;
      }
    }
    for (var country in countryList) {
      if (country.name == selectedCountry) {
        countryID = country.id;
      }
    }
    for (var city in cityList) {
      if (city.name == selectedCity) {
        cityID = city.id;
      }
    }

    if(profileURL != null) {
      filePath = profileURL;
    }
    else {
      filePath = constant.blobProfileUrl + BUCKET_NAME + '/' + selectedFile!.path
          .split('/')
          .last;
    }

    var data = await pref.getLoginUserData();
    if(data !=null) {
      //printLog(data.jwToken);

      final response = await Apis().saveStage1(
          '1.0', data.data!.jwToken!,mobiletxtController.text,filePath!,addresstxtController.text,addresstxtController.text,cityID!,stateID!,countryID!,zipcodetxtController.text);

      printLog(response);

      if (response != null && response.succeeded!) {
        stage1Response = response;
        getUserdata('1.0',data.data!.jwToken!);
        updatePageNum(1);
        FBroadcast.instance().broadcast(
          /// message type
          Key_Message,

          /// data
          value: 1,
        );
        //stageID = 1;
      }
      else {
        stage1Response = response;
        showSnackbar(response!.message!);
      }

      _widgets?.stopLoader();

       toggleLoading();
      update();

      return response;
    }
  }


  Future<CommonScreenResponse?> UpdateStage1() async {
    // toggleLoading();

    for (var state in stateList) {
      if (state.name == selectedState) {
        stateID = state.id;
      }
    }
    for (var country in countryList) {
      if (country.name == selectedCountry) {
        countryID = country.id;
      }
    }
    for (var city in cityList) {
      if (city.name == selectedCity) {
        cityID = city.id;
      }
    }

    if(profileURL != null) {
      filePath = profileURL;
    }
    else {
      filePath = constant.blobProfileUrl + BUCKET_NAME + '/' + selectedFile!.path
          .split('/')
          .last;
    }

    var data = await pref.getLoginUserData();
    if(data !=null) {

      final response = await Apis().updateStage1(
          '1.0', data.data!.jwToken!,profileScreenResponse!.data!.id!,mobiletxtController.text,filePath!,addresstxtController.text,addresstxtController.text,cityID!,stateID!,countryID!,zipcodetxtController.text);

      printLog(response);
      _widgets?.stopLoader();

      if (response != null && response.succeeded!) {
        stage1Response = response;
        updatePageNum(1);
        FBroadcast.instance().broadcast(
          /// message type
          Key_Message,

          /// data
          value: 1,
        );
      }
      else {
        stage1Response = response;
        showSnackbar(response!.message!);
      }


      toggleLoading();
      update();

      return response;
    }
  }


  Future<EmpTypeResponse?> getEmpTypedata(String version) async {
    //toggleLoading();

    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getEmpType(
          version, data.data!.jwToken!);

      printLog(response);

      if (response != null && response.succeeded!) {
        empTypeResponse = response;
        emptypeList = response.data!.employmentTypes!;
        prefLocation = response.data!.workLocationTypes!;
        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
        getIndustrydata('1.0');
      }
      else {
        empTypeResponse = response;
        showSnackbar(response!.message!);
      }


      //toggleLoading();
      update();

      return response;
    }
  }

  Future<IndustryDataModel?> getIndustrydata(String version) async {
    // toggleLoading();


    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getIndustry(
          version, data.data!.jwToken!);

      printLog(response);

      if (response != null && response.succeeded!) {
        industryResponse = response;

        industryList = response.data!;

        printLog(cityList.length);

        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
      }
      else {
        industryResponse = response;
        showSnackbar(response!.message!);
      }


      // toggleLoading();
      update();

      return response;
    }
  }


  Future<SkillResponse?> getSkilldata(String version,String serchterm) async {
   // toggleLoading();

    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().getSkill(
          version, data.data!.jwToken!,serchterm,50,1);

      printLog(response);

      if (response != null && response.succeeded!) {
        skillResponse = response;
        skillList = response.data!;
        //  Get.to(EmployeeProfileScreen());
        // showSnackbar(response.message);
      }
      else {
        skillResponse = response;
       // showSnackbar(response.message);
      }


     // toggleLoading();
      update();

      return response;
    }
  }


  Future<CommonScreenResponse?> SaveStage2() async {
   /*  String version,String token,int candidatid,String jobtitle,String prosumarry,
    int experience,int employmentTypeId,int workLocationTypeId,String skillIds,String otherskill*/

    _widgets?.startLoader();

     if(stageID == 2){

       UpdateStage2();
     }
     else {
       toggleLoading();

       for (var state in industryList) {
         if (state.name == selectedIndtype) {
           indID = state.id;
         }
       }

       for (var state in emptypeList) {
         if (state.type == selectedEmptype) {
           empID = state.id;
         }
       }
       for (var state in prefLocation) {
         if (state.name == selectedLocation) {
           locID = state.id;
         }
       }

       for (var state in selectedSkillList) {
         tempSkillList.add(state.id.toString());
       }

       skillSelection = tempSkillList.join(',');

       otherSkillselection = otherSkillList.join(',');

       var data = await pref.getLoginUserData();
       if (data != null) {
         final response = await Apis().saveStage2(
             '1.0',
             data.data!.jwToken!,
             0,
             jobtitlecontroller.text,
             controller.document.toPlainText(),
             int.parse(experiencecontroller.text),
             empID!,
             locID!,
             skillSelection!,
             otherSkillselection!,
             indID!,
             int.parse(expectedSalarycontroller.text));

         printLog(response);

         if (response != null && response.succeeded!) {
           stage1Response = response;
           updatePageNum(2);
           stageID = 2;
           FBroadcast.instance().broadcast(
             /// message type
             Key_Message,

             /// data
             value: 2,
           );

         }
         else {
           stage1Response = response;
           showSnackbar(response!.message!);
         }

         _widgets?.stopLoader();

         toggleLoading();
         update();

         return response;
       }
     }
  }


  Future<CommonScreenResponse?> UpdateStage2() async {
    toggleLoading();
    /*  String version,String token,int candidatid,String jobtitle,String prosumarry,
    int experience,int employmentTypeId,int workLocationTypeId,String skillIds,String otherskill*/
    for (var state in emptypeList) {
      if (state.type == selectedEmptype) {
        empID = state.id;
      }
    }
    for (var state in prefLocation) {
      if (state.name == selectedLocation) {
        locID = state.id;
      }
    }

    for (var state in selectedSkillList) {
      tempSkillList.add(state.id.toString());
    }
    for (var state in industryList) {
      if (state.name == selectedIndtype) {
        indID = state.id;
      }
    }

    skillSelection = tempSkillList.join(',');

    otherSkillselection = otherSkillList.join(',');

    var data = await pref.getLoginUserData();
    if(data !=null) {
      final response = await Apis().updateStage2(
          '1.0', data.data!.jwToken!,profileScreenResponse!.data!.id!,jobtitlecontroller.text,
          controller.document.toPlainText(),
          int.parse(experiencecontroller.text),
          empID!,locID!,skillSelection!,otherSkillselection!,int.parse(expectedSalarycontroller.text),
          int.parse(expectedSalarycontroller.text),indID!);

      printLog(response);

      if (response != null && response.succeeded!) {
        stage1Response = response;
        updatePageNum(2);

      }
      else {
        stage1Response = response;
        showSnackbar(response!.message!);
      }


      toggleLoading();
      update();

      return response;
    }
  }


  Future uploadResumeToAzure() async {
    toggleLoading();
    _widgets?.startLoader();
     if(resumeURL != null){
       uploadVideoToAzure();

     }
    else {
       try {
         String fileName = selectedResume!.path
             .split('/')
             .last;
         print(fileName);

         // read file as Uint8List
         Uint8List content = await selectedResume!.readAsBytes();
         var storage = AzureStorage.parse(BLOBURL);
         //String container = "image";
         // get the mine type of the file
         String? contentType = mime(fileName);
         await storage.putBlob('/$CVBUCKET_NAME/$fileName', bodyBytes: content,
             contentType: contentType,
             type: BlobType.BlockBlob);
         print("done");
         uploadVideoToAzure();
       } on AzureStorageException catch (ex) {
         _widgets?.stopLoader();
         print(ex.message);
         toggleLoading();
       } catch (err) {
         print(err);
         _widgets?.stopLoader();

         toggleLoading();
       }
     }
  }


  Future uploadVideoToAzure() async {

    if(videoType == 'Link') {
      SaveStage3();
    }
    else {
      if (videoURL != null) {
        SaveStage3();
      }
      else {
        try {
          String fileName = selectedVideo!.path
              .split('/')
              .last;
          print(fileName);

          // read file as Uint8List
          Uint8List content = await selectedVideo!.readAsBytes();
          var storage = AzureStorage.parse(BLOBURL);
          //String container = "image";
          // get the mine type of the file
          String? contentType = mime(fileName);
          await storage.putBlob(
              '/$VIDEOBUCKET_NAME/$fileName', bodyBytes: content,
              contentType: contentType,
              type: BlobType.BlockBlob);
          print("done");
          SaveStage3();
        } on AzureStorageException catch (ex) {
          print(ex.message);
          toggleLoading();
          _widgets?.stopLoader();

        } catch (err) {
          print(err);
          _widgets?.stopLoader();

          toggleLoading();
        }
      }
    }
  }


  Future<CommonScreenResponse?> SaveStage3() async {
   // toggleLoading();
    /*  String version,String token,int candidatid,String jobtitle,String prosumarry,
    int experience,int employmentTypeId,int workLocationTypeId,String skillIds,String otherskill*/

   // _widgets?.startLoader();

    printLog(videoType);

    if(resumeURL !=null){
      resumPath = resumeURL;
    }
    else{
      resumPath = constant.blobProfileUrl+CVBUCKET_NAME+'/'+selectedResume!.path
          .split('/')
          .last;
    }


      if (videoURL != null) {
        videoPath = videoURL;
      }
      else {
        videoPath = constant.blobProfileUrl + VIDEOBUCKET_NAME + '/' +
            selectedVideo!.path
                .split('/')
                .last;
      }


    var data = await pref.getLoginUserData();

    // var profileid = 0;
    /* if(profileScreenResponse!.data!.id != null){
       profileid = profileScreenResponse!.data!.id!;
     }*/

    if(data !=null) {
      final response = await Apis().saveStage3(
          '1.0', data.data!.jwToken!,profileID!,resumPath!,videoPath!,videoType!);

      printLog(response);

      _widgets?.stopLoader();

      if (response != null && response.succeeded!) {
        stage1Response = response;
        //updatePageNum(2);
       // Get.offAll(EmployeeProfileScreen());

      }
      else {
        stage1Response = response;
        showSnackbar(response!.message!);
      }


     // _widstopLoader();

      toggleLoading();
      update();
 return response;
    }
  }





  void updateCountry1(){
    getStatedata1("1.0");
  }

  void updateState1(){
    getCitydata1("1.0");
  }
}
