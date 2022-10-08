

class CandidateModel {
  List<CData>? data;
  bool? failed;
  dynamic? message;
  bool? succeeded;

  CandidateModel({this.data, this.failed, this.message, this.succeeded});

  CandidateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CData>[];
      json['data'].forEach((v) {
        data!.add(new CData.fromJson(v));
      });
    }
    failed = json['failed'];
    message = json['message'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['failed'] = this.failed;
    data['message'] = this.message;
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class CData {
  int? candidateProfileId;
  int? jobDetailId;
  String? firstName;
  String? lastName;
  String? emailId;
  String? photoPath;
  String? resumePath;
  String? videoPath;
  String? videoSource;
  String? jobTitle;
  String? employmentType;
  int? experience;
  int? skillMatchPerc;
  int? like;
  int? disLike;
  int? favourite;
  int? likeCount;
  int? disLikeCount;
  int? favouriteCount;

  CData(
      {this.candidateProfileId,
        this.jobDetailId,
        this.firstName,
        this.lastName,
        this.emailId,
        this.photoPath,
        this.resumePath,
        this.videoPath,
        this.videoSource,
        this.jobTitle,
        this.employmentType,
        this.experience,
        this.skillMatchPerc,
        this.like,
        this.disLike,
        this.favourite,
        this.likeCount,
        this.disLikeCount,
        this.favouriteCount});

  CData.fromJson(Map<String, dynamic> json) {
    candidateProfileId = json['candidateProfileId'];
    jobDetailId = json['jobDetailId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailId = json['emailId'];
    photoPath = json['photoPath'];
    resumePath = json['resumePath'];
    videoPath = json['videoPath'];
    videoSource = json['videoSource'];
    jobTitle = json['jobTitle'];
    employmentType = json['employmentType'];
    experience = json['experience'];
    skillMatchPerc = json['skillMatchPerc'];
    like = json['like'];
    disLike = json['disLike'];
    favourite = json['favourite'];
    likeCount = json['likeCount'];
    disLikeCount = json['disLikeCount'];
    favouriteCount = json['favouriteCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['candidateProfileId'] = this.candidateProfileId;
    data['jobDetailId'] = this.jobDetailId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['emailId'] = this.emailId;
    data['photoPath'] = this.photoPath;
    data['resumePath'] = this.resumePath;
    data['videoPath'] = this.videoPath;
    data['videoSource'] = this.videoSource;
    data['jobTitle'] = this.jobTitle;
    data['employmentType'] = this.employmentType;
    data['experience'] = this.experience;
    data['skillMatchPerc'] = this.skillMatchPerc;
    data['like'] = this.like;
    data['disLike'] = this.disLike;
    data['favourite'] = this.favourite;
    data['likeCount'] = this.likeCount;
    data['disLikeCount'] = this.disLikeCount;
    data['favouriteCount'] = this.favouriteCount;
    return data;
  }
}