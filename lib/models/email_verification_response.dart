
class EmailVerificationResponse {
  bool? failed;
  String? message;
  bool? succeeded;

  EmailVerificationResponse(
      {this.failed, this.message, this.succeeded});

  EmailVerificationResponse.fromJson(Map<String, dynamic> json) {
    failed = json['failed'];
    message = json['message'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['failed'] = this.failed;
    data['message'] = this.message;
    data['succeeded'] = this.succeeded;
    return data;
  }
}