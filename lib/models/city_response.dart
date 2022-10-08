
class CityResponse {
  List<CityData>? data;
  bool? failed;
  String? message;
  bool? succeeded;

  CityResponse({this.data, this.failed, this.message, this.succeeded});

  CityResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CityData>[];
      json['data'].forEach((v) {
        data?.add(new CityData.fromJson(v));
      });
    }
    failed = json['failed'];
    message = json['message'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['failed'] = this.failed;
    data['message'] = this.message;
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class CityData {
  int? id;
  String? name;

  CityData({this.id, this.name});

  CityData.fromJson(Map<String, dynamic> json) {
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