
class StateResponse {
  List<StateData>? data;
  bool? failed;
  String? message;
  bool? succeeded;

  StateResponse({this.data, this.failed, this.message, this.succeeded});

  StateResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StateData>[];
      json['data'].forEach((v) {
        data?.add(new StateData.fromJson(v));
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

class StateData {
  int? id;
  String? name;

  StateData({this.id, this.name});

  StateData.fromJson(Map<String, dynamic> json) {
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