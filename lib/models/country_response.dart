

class CountryResponse {
  List<CountryData>? data;
  bool? failed;
  String? message;
  bool? succeeded;

  CountryResponse({this.data, this.failed, this.message, this.succeeded});

  CountryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CountryData>[];
      json['data'].forEach((v) {
        data?.add(new CountryData.fromJson(v));
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

class CountryData {
  int? id;
  String? name;
  int? gmtOffset;

  CountryData({this.id, this.name, this.gmtOffset});

  CountryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  //  gmtOffset = json['gmtOffset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
  //  data['gmtOffset'] = this.gmtOffset;
    return data;
  }
}