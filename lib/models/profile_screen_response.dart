class ProfileScreenResponse {
  Data? data;
  bool? failed;
  dynamic? message;
  bool? succeeded;

  ProfileScreenResponse({this.data, this.failed, this.message, this.succeeded});

  ProfileScreenResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    failed = json['failed'];
    message = json['message'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['failed'] = this.failed;
    data['message'] = this.message;
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class Data {
  String? firstName;
  String? lastName;
  dynamic? emailId;
  String? mobileNumber;
  String? dateOfBirth;
  String? resumePath;
  String? photoPath;
  String? videoPath;
  String? videoSource;
  String? addressLine1;
  String? addressLine2;
  int? cityId;
  City? city;
  int? stateId;
  State? state;
  int? countryId;
  Country? country;
  String? zipCode;
  dynamic? gmtOffset;
  int? profileStageId;
  State? profileStage;
  JobDetailDto? jobDetailDto;
  int? reviewStatusId;
  State? reviewStatusDto;
  String? reviewDate;
  dynamic? reviewComment;
  dynamic? reviewerName;
  String? userId;
  String? createdOn;
  int? id;

  Data(
      {this.firstName,
        this.lastName,
        this.emailId,
        this.mobileNumber,
        this.dateOfBirth,
        this.resumePath,
        this.photoPath,
        this.videoPath,
        this.videoSource,
        this.addressLine1,
        this.addressLine2,
        this.cityId,
        this.city,
        this.stateId,
        this.state,
        this.countryId,
        this.country,
        this.zipCode,
        this.gmtOffset,
        this.profileStageId,
        this.profileStage,
        this.jobDetailDto,
        this.reviewStatusId,
        this.reviewStatusDto,
        this.reviewDate,
        this.reviewComment,
        this.reviewerName,
        this.userId,
        this.createdOn,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailId = json['emailId'];
    mobileNumber = json['mobileNumber'];
    dateOfBirth = json['dateOfBirth'];
    resumePath = json['resumePath'];
    photoPath = json['photoPath'];
    videoPath = json['videoPath'];
    videoSource = json['videoSource'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    cityId = json['cityId'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    stateId = json['stateId'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    countryId = json['countryId'];
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
    zipCode = json['zipCode'];
    gmtOffset = json['gmtOffset'];
    profileStageId = json['profileStageId'];
    profileStage = json['profileStage'] != null
        ? State.fromJson(json['profileStage'])
        : null;
    jobDetailDto = json['jobDetailDto'] != null
        ? JobDetailDto.fromJson(json['jobDetailDto'])
        : null;
    reviewStatusId = json['reviewStatusId'];
    reviewStatusDto = json['reviewStatusDto'] != null
        ? State.fromJson(json['reviewStatusDto'])
        : null;
    reviewDate = json['reviewDate'];
    reviewComment = json['reviewComment'];
    reviewerName = json['reviewerName'];
    userId = json['userId'];
    createdOn = json['createdOn'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailId'] = this.emailId;
    data['mobileNumber'] = this.mobileNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['resumePath'] = this.resumePath;
    data['photoPath'] = this.photoPath;
    data['videoPath'] = this.videoPath;
    data['videoSource'] = this.videoSource;
    data['addressLine1'] = this.addressLine1;
    data['addressLine2'] = this.addressLine2;
    data['cityId'] = this.cityId;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['stateId'] = this.stateId;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    data['countryId'] = this.countryId;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['zipCode'] = this.zipCode;
    data['gmtOffset'] = this.gmtOffset;
    data['profileStageId'] = this.profileStageId;
    if (this.profileStage != null) {
      data['profileStage'] = this.profileStage!.toJson();
    }
    if (this.jobDetailDto != null) {
      data['jobDetailDto'] = this.jobDetailDto!.toJson();
    }
    data['reviewStatusId'] = this.reviewStatusId;
    if (this.reviewStatusDto != null) {
      data['reviewStatusDto'] = this.reviewStatusDto!.toJson();
    }
    data['reviewDate'] = this.reviewDate;
    data['reviewComment'] = this.reviewComment;
    data['reviewerName'] = this.reviewerName;
    data['userId'] = this.userId;
    data['createdOn'] = this.createdOn;
    data['id'] = this.id;
    return data;
  }
}

class City {
  String? name;
  int? zipCode;
  double? latitude;
  double? longitude;
  int? id;

  City({this.name, this.zipCode, this.latitude, this.longitude, this.id});

  City.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    zipCode = json['zipCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['zipCode'] = this.zipCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['id'] = this.id;
    return data;
  }
}

class State {
  String? name;
  int? id;

  State({this.name, this.id});

  State.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class Country {
  String? name;
  int? gmtOffset;
  int? id;

  Country({this.name, this.gmtOffset, this.id});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gmtOffset = json['gmtOffset'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['gmtOffset'] = this.gmtOffset;
    data['id'] = this.id;
    return data;
  }
}

class JobDetailDto {
  int? candidateProfileId;
  String? jobTitle;
  String? profileSummary;
  int? experience;
  EmploymentType? employmentType;
  String? otherSkills;
  int? workLocationTypeId;
  WorkLocationType? workLocationType;
  int? preferredDistance;
  List<CandidateSkills>? candidateSkills;
  List<dynamic>? jobLocations;
  int? currentSalary;
  int? expectedSalary;
  State? industryType;
  int? masterIndustryTypeId;
  Null? otherIndustryType;
  int? id;

  JobDetailDto(
      {this.candidateProfileId,
        this.jobTitle,
        this.profileSummary,
        this.experience,
        this.employmentType,
        this.otherSkills,
        this.workLocationTypeId,
        this.workLocationType,
        this.preferredDistance,
        this.candidateSkills,
        this.jobLocations,
        this.currentSalary,
        this.expectedSalary,
        this.industryType,
        this.masterIndustryTypeId,
        this.otherIndustryType,
        this.id});

  JobDetailDto.fromJson(Map<String, dynamic> json) {
    candidateProfileId = json['candidateProfileId'];
    jobTitle = json['jobTitle'];
    profileSummary = json['profileSummary'];
    experience = json['experience'];
    employmentType = json['employmentType'] != null
        ? EmploymentType.fromJson(json['employmentType'])
        : null;
    otherSkills = json['otherSkills'];
    workLocationTypeId = json['workLocationTypeId'];
    workLocationType = json['workLocationType'] != null
        ? WorkLocationType.fromJson(json['workLocationType'])
        : null;
    preferredDistance = json['preferredDistance'];
    if (json['candidateSkills'] != null) {
      candidateSkills = <CandidateSkills>[];
      json['candidateSkills'].forEach((v) {
        candidateSkills!.add(CandidateSkills.fromJson(v));
      });
    }
    currentSalary = json['currentSalary'];
    expectedSalary = json['expectedSalary'];
    industryType = json['industryType'] != null
        ? State.fromJson(json['industryType'])
        : null;
    masterIndustryTypeId = json['masterIndustryTypeId'];
    otherIndustryType = json['otherIndustryType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['candidateProfileId'] = this.candidateProfileId;
    data['jobTitle'] = this.jobTitle;
    data['profileSummary'] = this.profileSummary;
    data['experience'] = this.experience;
    if (this.employmentType != null) {
      data['employmentType'] = this.employmentType!.toJson();
    }
    data['otherSkills'] = this.otherSkills;
    data['workLocationTypeId'] = this.workLocationTypeId;
    if (this.workLocationType != null) {
      data['workLocationType'] = this.workLocationType!.toJson();
    }
    data['preferredDistance'] = this.preferredDistance;
    if (this.candidateSkills != null) {
      data['candidateSkills'] =
          this.candidateSkills!.map((v) => v.toJson()).toList();
    }
    if (this.jobLocations != null) {
      data['jobLocations'] = this.jobLocations!.map((v) => v.toJson()).toList();
    }
    data['currentSalary'] = this.currentSalary;
    data['expectedSalary'] = this.expectedSalary;
    if (this.industryType != null) {
      data['industryType'] = this.industryType!.toJson();
    }
    data['masterIndustryTypeId'] = this.masterIndustryTypeId;
    data['otherIndustryType'] = this.otherIndustryType;
    data['id'] = this.id;
    return data;
  }
}

class EmploymentType {
  String? type;
  int? id;

  EmploymentType({this.type, this.id});

  EmploymentType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}

class WorkLocationType {
  String? name;
  int? distance;
  int? id;

  WorkLocationType({this.name, this.distance, this.id});

  WorkLocationType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    distance = json['distance'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['distance'] = this.distance;
    data['id'] = this.id;
    return data;
  }
}

class CandidateSkills {
  int? jobDetailId;
  int? masterSkillSetId;
  String? skillName;
  int? masterIndustryTypeId;
  int? id;

  CandidateSkills(
      {this.jobDetailId,
        this.masterSkillSetId,
        this.skillName,
        this.masterIndustryTypeId,
        this.id});

  CandidateSkills.fromJson(Map<String, dynamic> json) {
    jobDetailId = json['jobDetailId'];
    masterSkillSetId = json['masterSkillSetId'];
    skillName = json['skillName'];
    masterIndustryTypeId = json['masterIndustryTypeId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['jobDetailId'] = this.jobDetailId;
    data['masterSkillSetId'] = this.masterSkillSetId;
    data['skillName'] = this.skillName;
    data['masterIndustryTypeId'] = this.masterIndustryTypeId;
    data['id'] = this.id;
    return data;
  }
}