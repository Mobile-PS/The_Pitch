class LoginResponse {
  Data? data;
  bool? failed;
  String? message;
  bool? succeeded;

  LoginResponse({this.data, this.failed, this.message, this.succeeded});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  String? userName;
  String? email;
  List<String>? roles;
  bool? isVerified;
  String? jwToken;
  String? issuedOn;
  String? expiresOn;
  String? profileStageId;
  String? employerProfileStageId;
  String? loginPortal;

  Data(
      {this.id,
        this.userName,
        this.email,
        this.roles,
        this.isVerified,
        this.jwToken,
        this.issuedOn,
        this.expiresOn,
        this.profileStageId,
        this.employerProfileStageId,
        this.loginPortal});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    isVerified = json['isVerified'];
    jwToken = json['jwToken'];
    issuedOn = json['issuedOn'];
    expiresOn = json['expiresOn'];
    profileStageId = json['profileStageId'];
    employerProfileStageId = json['employerProfileStageId'];
    loginPortal = json['loginPortal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['isVerified'] = this.isVerified;
    data['jwToken'] = this.jwToken;
    data['issuedOn'] = this.issuedOn;
    data['expiresOn'] = this.expiresOn;
    data['profileStageId'] = this.profileStageId;
    data['employerProfileStageId'] = this.employerProfileStageId;
    data['loginPortal'] = this.loginPortal;
    return data;
  }
}