class TrackingDateModel {
  Status? status;
  int? count;
  Data? data;

  TrackingDateModel({this.status, this.count, this.data});

  TrackingDateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? new Status.fromJson(json['status']) : null;
    count = json['count'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Status {
  int? code;
  String? message;

  Status({this.code, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? message;
  List<ListItem>? data;
  int? status;

  Data({this.message, this.data, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <ListItem>[];
      json['data'].forEach((v) { data!.add(new ListItem.fromJson(v)); });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class ListItem {
  int? id;
  String? studentName;
  String? classs;
  String? batch;
  String? visitDate;
  String? visitStatus;
  String? remarks;
  bool? isprogress;
  List<DataStatus>? status;

  ListItem({this.id, this.studentName, this.classs, this.batch, this.visitDate, this.visitStatus,this.remarks, this.isprogress, this.status});

  ListItem.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  studentName = json['student_name'];
  classs = json['class'];
  batch = json['batch'];
  visitDate = json['visit_date'];
  visitStatus = json['visit_status'];
  remarks = json['remarks'];
  isprogress = json['isprogress'];
  if (json['status'] != null) {
  status = <DataStatus>[];
  json['status'].forEach((v) { status!.add(new DataStatus.fromJson(v)); });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['student_name'] = this.studentName;
  data['class'] = this.classs;
  data['batch'] = this.batch;
  data['visit_date'] = this.visitDate;
  data['visit_status'] = this.visitStatus;
  data['remarks'] = this.remarks;
  data['isprogress'] = this.isprogress;
  if (this.status != null) {
  data['status'] = this.status!.map((v) => v.toJson()).toList();
  }
  return data;
  }
}

class DataStatus {
  String? sentBy;
  String? sentById;
  String? sentByToken;
  String? visitStatus;
  String? addedOn;

  DataStatus({this.sentBy, this.sentById, this.sentByToken, this.visitStatus, this.addedOn});

  DataStatus.fromJson(Map<String, dynamic> json) {
    sentBy = json['sent_by'];
    sentById = json['sent_by_id'];
    sentByToken = json['sent_by_token'];
    visitStatus = json['visit_status'];
    addedOn = json['Added_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sent_by'] = this.sentBy;
    data['sent_by_id'] = this.sentById;
    data['sent_by_token'] = this.sentByToken;
    data['visit_status'] = this.visitStatus;
    data['Added_on'] = this.addedOn;
    return data;
  }
}