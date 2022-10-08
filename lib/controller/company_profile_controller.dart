

import 'dart:io';
import 'dart:typed_data';

import 'package:azblob/azblob.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:mime_type/mime_type.dart';
import 'package:the_new_pitchapp/api/apis.dart';
import 'package:the_new_pitchapp/api/constants.dart';
import 'package:the_new_pitchapp/models/IndustryDataModel.dart';
import 'package:the_new_pitchapp/models/city_response.dart';
import 'package:the_new_pitchapp/models/common_screen_response.dart';
import 'package:the_new_pitchapp/models/country_response.dart';
import 'package:the_new_pitchapp/models/state_response.dart';
import 'package:the_new_pitchapp/preferences/pref_repository.dart';
import 'package:the_new_pitchapp/utility/common.dart';
import 'package:the_new_pitchapp/utility/image_utils.dart';
import 'package:the_new_pitchapp/utility/widget_collection.dart';

class CompanyProfileScreenController extends GetxController {

  final pref = PrefRepository();


  TextEditingController companyNameController = new TextEditingController();
  TextEditingController websitetxtController = TextEditingController();
  TextEditingController contacttxtController = TextEditingController();
  TextEditingController emailtxtController = TextEditingController();
  TextEditingController facebiiktxtController = TextEditingController();
  TextEditingController twittertxtController = TextEditingController();
  TextEditingController linkdintxtController = TextEditingController();
  QuillController controller = QuillController.basic();


  TextEditingController companyAddressTitleController = new TextEditingController();
  TextEditingController companyAddressController = new TextEditingController();
  TextEditingController companyZipController = new TextEditingController();
  TextEditingController companyConatctPersonController = new TextEditingController();
  TextEditingController companyEmailController = new TextEditingController();
  TextEditingController companyMobileController = new TextEditingController();

  CountryResponse? countryResponse;
  StateResponse? stateResponse;
  CityResponse? cityResponse;

  IndustryDataModel? industryResponse;

  List<IndData> industryList = [];

  TextEditingController industrycontroller = TextEditingController();
  List<IndData> selectedIndustryList = [];

  File? selectedFile;
  String? filePath;
  String? profileURL;
  final constant = ApiConstants();
  List<String> tempSkillList = [];

  String? skillSelection;
  bool loading = false;
  WidgetsCollection? _widgets;
  BuildContext? _context;

  List<CountryData> countryList = [];
  List<StateData> stateList = [];
  List<CityData> cityList = [];


  List<String> countryList1 = [];
  List<String> stateList1 = [];
  List<String> cityList1 = [];

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  var Key_Message = 'KEY';

  int? countryID;
  int? stateID;
  int? cityID;
  File? selectedVideo;
  String? videoType;
  String? videoURL;
  String? videoPath;


  @override
  Future<void> onInit() async {
    var data = await pref.getLoginUserData();

    getCountrydata("1.0",data!.data!.jwToken!);

    super.onInit();
  }

  void init(BuildContext context){
    _widgets = WidgetsCollection(context);
    _context = context;

  }

  Future<CountryResponse?> getCountrydata(String version,String token) async {
    // toggleLoading();

    final response = await Apis().getCountry(
        version, token);

    printLog(response);

    if (response != null && response.succeeded!) {
      countryResponse = response;
      countryList = response.data!;

      countryList.forEach((element) {

        countryList1.add(element.name!);
      });

      //  Get.to(EmployeeProfileScreen());
      // showSnackbar(response.message);
    }
    else {
      countryResponse = response;
      showSnackbar(response!.message!);
    }

    /*  if(!profileScreenResponse!.succeeded!){
        getUserdata(version, token);
      }
      else {
        toggleLoading();
      update();
      }*/
    toggleLoading();
    update();
    return response;

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
        stateList.forEach((element) {
          stateList1.add(element.name!);
        });
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
        cityList.forEach((element) {
          cityList1.add(element.name!);
        });
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

  void updateVideo(File file){
    videoURL = null;
    this.selectedVideo = file;
    update();

  }

  void updateIndustry(IndData data){
    this.selectedIndustryList.add(data);
    update();
  }

  void removeSkill(int index){
    this.selectedIndustryList.removeAt(index);
    update();
  }

  void updatePhoto(File file){
    profileURL = null;
    this.selectedFile = file;
    update();

  }
  void toggleLoading() {
    if (loading) {
      loading = false;
    } else {
      loading = true;
    }
    update();
  }

  Future uploadImageToAzure() async {
  //  toggleLoading();

    _widgets?.startLoader();

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
        } catch (err) {
          print(err);
        }
      }
      else{
        _widgets?.stopLoader();

      }

  }


  Future<CommonScreenResponse?> SaveStage1() async {
    // toggleLoading();


    for (var state in selectedIndustryList) {
      tempSkillList.add(state.id.toString());
    }

    skillSelection = tempSkillList.join(',');

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

      final response = await Apis().saveCompanyStage1(
          '1.0', data.data!.jwToken!,companyNameController.text,controller.document.toPlainText(),websitetxtController.text,
          filePath!,contacttxtController.text,emailtxtController.text,skillSelection!,facebiiktxtController.text,
        twittertxtController.text,linkdintxtController.text);

      printLog(response);

      if (response != null && response.succeeded!) {
       // stage1Response = response;
       // updatePageNum(1);
        //stageID = 1;
        showSnackbar('Save successfully');

        FBroadcast.instance().broadcast(
          /// message type
          Key_Message,

          /// data
          value: 1,
        );
      }
      else {
       // stage1Response = response;
        showSnackbar(response!.message!);
      }


      _widgets?.stopLoader();

      update();

      return response;
    }
  }



  Future<CommonScreenResponse?> SaveStage2() async {
    // toggleLoading();
    _widgets?.startLoader();

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

    var data = await pref.getLoginUserData();

    if(data !=null) {
      //printLog(data.jwToken);

      final response = await Apis().saveAddressStage2(
          '1.0', data.data!.jwToken!,companyAddressTitleController.text,companyAddressController.text,cityID!,stateID!,countryID!,companyZipController.text,companyConatctPersonController.text,companyEmailController.text,companyMobileController.text);

      printLog(response);

      if (response != null && response.succeeded!) {
        // stage1Response = response;
        // updatePageNum(1);
        //stageID = 1;
        showSnackbar('Save successfully');
        FBroadcast.instance().broadcast(
          /// message type
          Key_Message,

          /// data
          value: 2,
        );
      }
      else {
        // stage1Response = response;
        showSnackbar(response!.message!);
      }


      _widgets?.stopLoader();

      update();

      return response;
    }
  }

  void updateVideoType(String type){
    this.videoType = type;
    update();

  }


  Future uploadVideoToAzure() async {

    _widgets?.startLoader();

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

          SaveStage3();
        } on AzureStorageException catch (ex) {
          print(ex.message);
          _widgets?.stopLoader();

          //toggleLoading();
        } catch (err) {
          print(err);
          _widgets?.stopLoader();

          //toggleLoading();
        }
      }


  Future<CommonScreenResponse?> SaveStage3() async {
    // toggleLoading();
    /*  String version,String token,int candidatid,String jobtitle,String prosumarry,
    int experience,int employmentTypeId,int workLocationTypeId,String skillIds,String otherskill*/


    printLog(videoType);



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

    var profileid = 0;


    if(data !=null) {
      final response = await Apis().saveCompanyStage3(
          '1.0', data.data!.jwToken!,profileid,videoPath!,videoType!);

      printLog(response);

      if (response != null && response.succeeded!) {
        //stage1Response = response;
        //updatePageNum(2);
        // Get.offAll(EmployeeProfileScreen());
        showSnackbar('Save successfully');

      }
      else {
       // stage1Response = response;
        showSnackbar(response!.message!);
      }


      _widgets?.stopLoader();
      update();

      return response;
    }
  }





}