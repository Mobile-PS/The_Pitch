

class EmployerModel {
  List<EData>? data;
  bool? failed;
  dynamic? message;
  bool? succeeded;

  EmployerModel({this.data, this.failed, this.message, this.succeeded});

  EmployerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EData>[];
      json['data'].forEach((v) {
        data!.add(new EData.fromJson(v));
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

class EData {
  int? employerProfileId;
  String? companyName;
  String? emailId;
  String? companyLogo;
  String? videoPath;
  String? videoSource;
  String? companyUrl;
  String? facebookUrl;
  String? twitterUrl;
  String? linkedInUrl;
  int? like;
  int? disLike;
  int? favourite;
  int? likeCount;
  int? disLikeCount;
  int? favouriteCount;

  EData(
      {this.employerProfileId,
        this.companyName,
        this.emailId,
        this.companyLogo,
        this.videoPath,
        this.videoSource,
        this.companyUrl,
        this.facebookUrl,
        this.twitterUrl,
        this.linkedInUrl,
        this.like,
        this.disLike,
        this.favourite,
        this.likeCount,
        this.disLikeCount,
        this.favouriteCount});

  EData.fromJson(Map<String, dynamic> json) {
    employerProfileId = json['employerProfileId'];
    companyName = json['companyName'];
    emailId = json['emailId'];
    companyLogo = json['companyLogo'];
    videoPath = json['videoPath'];
    videoSource = json['videoSource'];
    companyUrl = json['companyUrl'];
    facebookUrl = json['facebookUrl'];
    twitterUrl = json['twitterUrl'];
    linkedInUrl = json['linkedInUrl'];
    like = json['like'];
    disLike = json['disLike'];
    favourite = json['favourite'];
    likeCount = json['likeCount'];
    disLikeCount = json['disLikeCount'];
    favouriteCount = json['favouriteCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employerProfileId'] = this.employerProfileId;
    data['companyName'] = this.companyName;
    data['emailId'] = this.emailId;
    data['companyLogo'] = this.companyLogo;
    data['videoPath'] = this.videoPath;
    data['videoSource'] = this.videoSource;
    data['companyUrl'] = this.companyUrl;
    data['facebookUrl'] = this.facebookUrl;
    data['twitterUrl'] = this.twitterUrl;
    data['linkedInUrl'] = this.linkedInUrl;
    data['like'] = this.like;
    data['disLike'] = this.disLike;
    data['favourite'] = this.favourite;
    data['likeCount'] = this.likeCount;
    data['disLikeCount'] = this.disLikeCount;
    data['favouriteCount'] = this.favouriteCount;
    return data;
  }
}