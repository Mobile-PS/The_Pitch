import 'dart:convert';




import 'package:http/http.dart' as http;
import 'package:the_new_pitchapp/api/utils.dart';
import 'package:the_new_pitchapp/models/CandidateModel.dart';
import 'package:the_new_pitchapp/models/EmployerModel.dart';
import 'package:the_new_pitchapp/models/IndustryDataModel.dart';
import 'package:the_new_pitchapp/models/LoginResponse.dart';
import 'package:the_new_pitchapp/models/city_response.dart';
import 'package:the_new_pitchapp/models/common_screen_response.dart';
import 'package:the_new_pitchapp/models/country_response.dart';
import 'package:the_new_pitchapp/models/email_verification_response.dart';
import 'package:the_new_pitchapp/models/getemptype_response.dart';
import 'package:the_new_pitchapp/models/getuser_response.dart';
import 'package:the_new_pitchapp/models/profile_screen_response.dart';
import 'package:the_new_pitchapp/models/skill_response.dart';
import 'package:the_new_pitchapp/models/state_response.dart';
import 'package:the_new_pitchapp/models/zipcode_response.dart';
import 'package:the_new_pitchapp/utility/common.dart';




import 'constants.dart';

class Apis {
  final constant = ApiConstants();
  final utils = ApiUtils();




  Future<LoginResponse?> Login(String username,String password,String type) async {


    final request = utils.createPostRequest(
        constant.verifyLoginUrl());

    request.body = json.encode({
      'email': username,
      'password': password,
      'loginPortal': type,

    });
    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return LoginResponse.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<CandidateModel?> GetCandidate(String token) async {

    Map<String, String> params = {
      'isAll': '1',
    };


    final request = utils.createGetRequestWithParams(
        constant.candidateUrl(),params);


    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return CandidateModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<EmployerModel?> GetEmployer(String token) async {

    Map<String, String> params = {
      'isAll': '1',
    };


    final request = utils.createGetRequestWithParams(
        constant.employerUrl(),params);


    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        printLog(data);
        return EmployerModel.fromJson(jsonDecode(data));
      } else {
        printLog(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<EmailVerificationResponse?> sendOtp(String channelEmail) async {

    final request = utils.createPostRequest(
        constant.getOtpUrl());
    request.body = json.encode({
      constant.paramEmail: channelEmail,
    });

    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return EmailVerificationResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<EmailVerificationResponse?> verifyOtp(String otp,String email) async {

    final request = utils.createPostRequest(
        constant.verifyOtpUrl());
    request.body = json.encode({
      constant.paramOtp: otp,
      constant.paramEmail: email,

    });

    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return EmailVerificationResponse.fromJson(jsonDecode(data));
      /*} else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<EmailVerificationResponse?> sendRegData(String fanme,String lname,String email,String password, String confirmpassword,int type) async {

    final request = utils.createPostRequest(
        constant.sendRegDataUrl());
    request.body = json.encode({
      constant.paramFirstname: fanme,
      constant.paramEmail: email,
      constant.paramLastname: lname,
      constant.paramPassword: password,
      constant.paramconfirmPassword: password,
      constant.parmUserType: type,

    });

    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      //if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return EmailVerificationResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }



/*
  Future<LoginScreenResponse> verifyLogin(String email,String password) async {

    final request = utils.createPostRequest(
        constant.verifyLoginUrl());
    request.body = json.encode({
      constant.paramEmail: email,
      constant.paramPassword: password,
      constant.paramLoginportal: 'Candidate',

    });

    request.headers.addAll(constant.getHeader());

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return LoginScreenResponse.fromJson(jsonDecode(data));
      */
/* } else {
        printLog(response.reasonPhrase);
        return null;
      }*//*

    } catch (e) {
      printLog(e);
      return null;
    }
  }
*/

  Future<ProfileScreenResponse?> getProfile(int profilefiled,String version,String token) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getProfileDataUrl('v'+version,profilefiled));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return ProfileScreenResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<GetUserResponse?> getUserData(String version,String token) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getUserDataUrl('v'+version));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return GetUserResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<CountryResponse?> getCountry(String version,String token) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getCountryDataUrl('v'+version));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return CountryResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<StateResponse?> getState(String version,String token,int id) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getStateDataUrl('v'+version,id));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return StateResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<CityResponse?> getCity(String version,String token,int id) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getCityDataUrl('v'+version,id));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return CityResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<IndustryDataModel?> getIndustry(String version,String token) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getIndustryDataUrl('v'+version));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return IndustryDataModel.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<ZipcodeResponse?> getZipCodeData(String version,String token,int id) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getZipCodeDataUrl('v'+version,id));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return ZipcodeResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<CommonScreenResponse?> saveStage1(String version,String token,String mobilenum,String photoPath,String addressLine1,
      String addressLine2,int cityId,int stateId,int countryId,String zipCode) async {

    final request = utils.createPostRequest(
        constant.saveUserDataUrl('v'+version));
    request.body = json.encode({
      constant.paramMob: mobilenum,
      constant.paramPhotoPath: photoPath,
      constant.paramAdress1: addressLine1,
      constant.paramAdress2: addressLine2,
      constant.paramCity: cityId,
      constant.paramState: stateId,
      constant.paramCountry: countryId,
      constant.paramZipcode: zipCode,
    });

    request.headers.addAll(constant.getHeader1('Bearer '+token));
    printLog(request);
    printLog(request.body);

    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog("data");
      printLog(data);
      printLog("data");

      return CommonScreenResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }



  Future<CommonScreenResponse?> saveCompanyStage1(String version,String token,String companyname,
      String comapnyInfo,String webiste,String logo,
      String contact,String email,String industries,String facebook,String twitter,String linkdin) async {

    final request = utils.createPostRequest(
        constant.saveComapnyDataUrl('v'+version));
    request.body = json.encode({
      "companyName": companyname,
      "companyDescription": comapnyInfo,
      "contactEmail": email,
      "companyLogo": logo,
      "companyUrl": webiste,
      "contactPerson": contact,
      "facebookUrl": facebook,
      "twitterUrl": twitter,
      "linkedInUrl": linkdin,
      "industryTypeIds": industries
    });

    request.headers.addAll(constant.getHeader1('Bearer '+token));
    printLog(request);
    printLog(request.body);

    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog("data");
      printLog(data);
      printLog("data");

      return CommonScreenResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<CommonScreenResponse?> saveAddressStage2(String version,String token,String companyTitle,
      String address,int city,int state,
      int country,String zip,String contactperson,String contactemail,String mobile,) async {

    final request = utils.createPostRequest(
        constant.saveAddressUrl('v'+version));
    request.body = json.encode({
      "employerProfileId": 0,
      "title": companyTitle,
      "addressLine1": address,
      "cityId": city,
      "stateId": state,
      "countryId": country,
      "zipCode": zip,
      "contactPerson": contactperson,
      "contactEmail": contactemail,
      "mobileNumber": mobile
    });

    request.headers.addAll(constant.getHeader1('Bearer '+token));
    printLog(request);
    printLog(request.body);

    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog("data");
      printLog(data);
      printLog("data");

      return CommonScreenResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }

  Future<CommonScreenResponse?> updateStage1(String version,String token,int profileid,String mobilenum,String photoPath,String addressLine1,
      String addressLine2,int cityId,int stateId,int countryId,String zipCode) async {

    final request = utils.createPutRequest(
        constant.updateUserDataUrl('v'+version));
    request.body = json.encode({
      constant.paramProfileId : profileid,
      constant.paramMob: mobilenum,
      constant.paramPhotoPath: photoPath,
      constant.paramAdress1: addressLine1,
      constant.paramAdress2: addressLine2,
      constant.paramCity: cityId,
      constant.paramState: stateId,
      constant.paramCountry: countryId,
      constant.paramZipcode: zipCode,
    });

    request.headers.addAll(constant.getHeader1('Bearer '+token));
    printLog(request);
    printLog(request.body);

    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog("data");
      printLog(data);
      printLog("data");

      return CommonScreenResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<EmpTypeResponse?> getEmpType(String version,String token) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getEmpDataUrl('v'+version));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return EmpTypeResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<SkillResponse?> getSkill(String version,String token,String serchterm,int pagesize,int pagnum) async {

    printLog(token);

    final request = utils.createGetRequest(constant.getSkillDataUrl('v'+version,token,serchterm,pagesize,pagnum));

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);

    http.StreamedResponse response = await request.send();
    printLog(request.headers);

    printLog(response.statusCode);


    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return SkillResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }


  Future<CommonScreenResponse?> saveStage2(String version,String token,int candidatid,String jobtitle,String prosumarry,
      int experience,int employmentTypeId,int workLocationTypeId,String skillIds,String otherskill,int industryid,int expectedsalary) async {

    final request = utils.createPostRequest(
        constant.saveProfessionalDataUrl('v'+version));
    request.body = json.encode({
      constant.candidateId: candidatid,
      constant.jobtitle: jobtitle,
      constant.profilesummary: prosumarry,
      constant.experience: experience,
      constant.emptypeId: employmentTypeId,
      constant.locationID: workLocationTypeId,
      constant.skillID: skillIds,
      constant.otherSkill: otherskill,
      'masterIndustryTypeId': industryid,
      constant.expectedSalary: expectedsalary,
    });

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);
    printLog(request.body);

    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return CommonScreenResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }



  Future<CommonScreenResponse?> updateStage2(String version,String token,int candidatid,String jobtitle,String prosumarry,
      int experience,int employmentTypeId,int workLocationTypeId,String skillIds,String otherskill,int currentsalary,int expectedsalary,int industryid) async {

    final request = utils.createPutRequest(
        constant.updateProfessionalDataUrl('v'+version));
    request.body = json.encode({
      constant.jobdetailId: candidatid,
      constant.jobtitle: jobtitle,
      constant.profilesummary: prosumarry,
      constant.experience: experience,
      constant.emptypeId: employmentTypeId,
      constant.locationID: workLocationTypeId,
      constant.skillID1: skillIds,
      constant.otherSkill: otherskill,
      constant.expectedSalary: expectedsalary,
      'masterIndustryTypeId': industryid,

    });

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);
    printLog(request.body);

    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return CommonScreenResponse.fromJson(jsonDecode(data));
      /* } else {
        printLog(response.reasonPhrase);
        return null;
      }*/
    } catch (e) {
      printLog(e);
      return null;
    }
  }



  Future<CommonScreenResponse?> saveStage3(String version,String token,int candidatid,String resumepath,String videopath,String videotype) async {

    final request = utils.createPutRequest(
        constant.saveResumeDataUrl('v'+version));
    request.body = json.encode({
      constant.profileId: candidatid,
      constant.resumepath: resumepath,
      constant.videopath: videopath,
      constant.videosource: videotype,
    });

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return CommonScreenResponse.fromJson(jsonDecode(data));

    } catch (e) {
      printLog(e);
      return null;
    }



  }


  Future<CommonScreenResponse?> saveCompanyStage3(String version,String token,int candidatid,String videopath,String videotype) async {

    final request = utils.createPutRequest(
        constant.saveBusinessVideoUrl('v'+version));
    request.body = json.encode({
      constant.profileId: candidatid,
      constant.videopath: videopath,
      constant.videosource: videotype,
    });

    request.headers.addAll(constant.getHeader1('Bearer '+token));

    printLog(request);
    http.StreamedResponse response = await request.send();

    try {
      //  if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      final data = await response.stream.bytesToString();
      printLog(data);
      return CommonScreenResponse.fromJson(jsonDecode(data));

    } catch (e) {
      printLog(e);
      return null;
    }



  }

}
