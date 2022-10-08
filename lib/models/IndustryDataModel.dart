
class IndustryDataModel {
  List<IndData>? data;
  int? page;
  int? totalPages;
  int? totalCount;
  bool? hasPreviousPage;
  bool? hasNextPage;
  bool? failed;
  Null? message;
  bool? succeeded;

  IndustryDataModel(
      {this.data,
        this.page,
        this.totalPages,
        this.totalCount,
        this.hasPreviousPage,
        this.hasNextPage,
        this.failed,
        this.message,
        this.succeeded});

  IndustryDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <IndData>[];
      json['data'].forEach((v) {
        data!.add(new IndData.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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

class IndData {
  int? id;
  String? name;

  IndData({this.id, this.name});

  IndData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}