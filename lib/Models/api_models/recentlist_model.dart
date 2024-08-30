class RecentTrackingModel {
  String? schoolId;
  String? academicYear;
  List<EndorsedClass>? endorsedClass;

  RecentTrackingModel({this.schoolId, this.academicYear, this.endorsedClass});

  RecentTrackingModel.fromJson(Map<String, dynamic> json) {
    schoolId = json['school_id'];
    academicYear = json['academic_year'];
    if (json['Endorsed_class'] != null) {
      endorsedClass = <EndorsedClass>[];
      json['Endorsed_class'].forEach((v) { endorsedClass!.add(new EndorsedClass.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school_id'] = this.schoolId;
    data['academic_year'] = this.academicYear;
    if (this.endorsedClass != null) {
      data['Endorsed_class'] = this.endorsedClass!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EndorsedClass {
  int? classes;
  String? batch;

  EndorsedClass({this.classes, this.batch});

  EndorsedClass.fromJson(Map<String, dynamic> json) {
    classes = json['class'];
  batch = json['batch'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['class'] = this.classes;
  data['batch'] = this.batch;
  return data;
  }
}

