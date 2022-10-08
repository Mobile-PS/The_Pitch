
class EmpTypeResponse {
  EmpTypeData? data;
  bool? failed;
  dynamic? message;
  bool? succeeded;

  EmpTypeResponse({this.data, this.failed, this.message, this.succeeded});

  EmpTypeResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new EmpTypeData.fromJson(json['data']) : null;
    failed = json['failed'];
    message = json['message'];
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['failed'] = this.failed;
    data['message'] = this.message;
    data['succeeded'] = this.succeeded;
    return data;
  }
}

class EmpTypeData {
  List<WorkLocationTypes>? workLocationTypes;
  List<EmploymentTypes>? employmentTypes;

  EmpTypeData({this.workLocationTypes, this.employmentTypes});

  EmpTypeData.fromJson(Map<String, dynamic> json) {
    if (json['workLocationTypes'] != null) {
      workLocationTypes = <WorkLocationTypes>[];
      json['workLocationTypes'].forEach((v) {
        workLocationTypes?.add(new WorkLocationTypes.fromJson(v));
      });
    }
    if (json['employmentTypes'] != null) {
      employmentTypes = <EmploymentTypes>[];
      json['employmentTypes'].forEach((v) {
        employmentTypes?.add(new EmploymentTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.workLocationTypes != null) {
      data['workLocationTypes'] =
          this.workLocationTypes?.map((v) => v.toJson()).toList();
    }
    if (this.employmentTypes != null) {
      data['employmentTypes'] =
          this.employmentTypes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkLocationTypes {
  String? name;
  int? distance;
  int? id;

  WorkLocationTypes({this.name, this.distance, this.id});

  WorkLocationTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    distance = json['distance'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['distance'] = this.distance;
    data['id'] = this.id;
    return data;
  }
}

class EmploymentTypes {
  String? type;
  int? id;

  EmploymentTypes({this.type, this.id});

  EmploymentTypes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}