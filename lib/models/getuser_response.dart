class GetUserResponse {
  Data? data;
  bool? failed;
  dynamic? message;
  bool? succeeded;

  GetUserResponse({this.data, this.failed, this.message, this.succeeded});

  GetUserResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    failed = json['failed'];
    message = json['message'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? id;
  String? firstName;
  String? lastName;
  String? companyName;
  String? contactPerson;
  String? email;
  dynamic? userName;
  int? profileId;
  int? profileStageId;
  dynamic? employerProfileId;
  int? employerProfileStageId;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.companyName,
        this.contactPerson,
        this.email,
        this.userName,
        this.profileId,
        this.profileStageId,
        this.employerProfileId,
        this.employerProfileStageId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    companyName = json['companyName'];
    contactPerson = json['contactPerson'];
    email = json['email'];
    userName = json['userName'];
    profileId = json['profileId'];
    profileStageId = json['profileStageId'];
    employerProfileId = json['employerProfileId'];
    employerProfileStageId = json['employerProfileStageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['companyName'] = this.companyName;
    data['contactPerson'] = this.contactPerson;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['profileId'] = this.profileId;
    data['profileStageId'] = this.profileStageId;
    data['employerProfileId'] = this.employerProfileId;
    data['employerProfileStageId'] = this.employerProfileStageId;
    return data;
  }
}