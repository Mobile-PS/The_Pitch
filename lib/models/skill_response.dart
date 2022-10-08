
class SkillResponse {
  List<SkillData>? data;
  int? page;
  int? totalPages;
  int? totalCount;
  bool? hasPreviousPage;
  bool? hasNextPage;
  bool? failed;
  dynamic? message;
  bool? succeeded;

  SkillResponse(
      {this.data,
        this.page,
        this.totalPages,
        this.totalCount,
        this.hasPreviousPage,
        this.hasNextPage,
        this.failed,
        this.message,
        this.succeeded});

  SkillResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SkillData>[];
      json['data'].forEach((v) {
        data?.add(new SkillData.fromJson(v));
      });
    }
    page = json['page'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
    failed = json['failed'];
    message = json['message'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['totalPages'] = this.totalPages;
    data['totalCount'] = this.totalCount;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    data['failed'] = this.failed;
    data['message'] = this.message;
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class SkillData {
  int? id;
  String? skillName;

  SkillData({this.id, this.skillName});

  SkillData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillName = json['skillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['skillName'] = this.skillName;
    return data;
  }
}