class HosStudentListMode {
  Status? status;
  int? count;
  Data? data;

  HosStudentListMode({this.status, this.count, this.data});

  HosStudentListMode.fromJson(Map<String, dynamic> json) {
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
  StudentData? data;
  int? status;

  Data({this.message, this.data, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new StudentData.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class StudentData {
  List<SendData>? sendData;
  List<SendData>? receiveData;

  StudentData({this.sendData, this.receiveData});

  StudentData.fromJson(Map<String, dynamic> json) {
    if (json['sendData'] != null) {
      sendData = <SendData>[];
      json['sendData'].forEach((v) { sendData!.add(new SendData.fromJson(v)); });
    }
    if (json['receiveData'] != null) {
      receiveData = <SendData>[];
      json['receiveData'].forEach((v) { receiveData!.add(new SendData.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sendData != null) {
      data['sendData'] = this.sendData!.map((v) => v.toJson()).toList();
    }
    if (this.receiveData != null) {
      data['receiveData'] = this.receiveData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SendData {
  int? id;
  int? institutionId;
  String? academicYear;
  String? studentName;
  String? profilePic;
  String? admissionNo;
  String? age;
  String? dob;
  String? gender;
  String? classs;
  String? batch;
  String? section;
  String? batchDetails;
  String? appType;
  String? visitDate;
  String? visitType;
  String? reason;
  String? situation;
  String? visitStatus;
  String? informedParent;
  String? contactStatus;
  String? remarks;
  String? parentName;
  String? parentEmail;
  String? parentMobile;
  String? teacherId;
  String? sendTo;
  String? createdAt;
  String? updatedAt;
  bool? isprogress;
  List<Statuss>? status;

  SendData({this.id, this.institutionId, this.academicYear, this.studentName, this.profilePic, this.admissionNo, this.age, this.dob, this.gender, this.classs, this.batch, this.section, this.batchDetails, this.appType, this.visitDate, this.visitType, this.reason, this.situation, this.visitStatus, this.informedParent, this.contactStatus, this.remarks, this.parentName, this.parentEmail, this.parentMobile, this.teacherId, this.sendTo, this.createdAt, this.updatedAt, this.isprogress, this.status});

  SendData.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  institutionId = json['institution_id'];
  academicYear = json['academic_year'];
  studentName = json['student_name'];
  profilePic = json['profile_pic'];
  admissionNo = json['admission_no'];
  age = json['age'];
  dob = json['dob'];
  gender = json['gender'];
  classs = json['class'];
  batch = json['batch'];
  section = json['section'];
  batchDetails = json['batch_details'];
  appType = json['app_type'];
  visitDate = json['visit_date'];
  visitType = json['visit_type'];
  reason = json['reason'];
  situation = json['situation'];
  visitStatus = json['visit_status'];
  informedParent = json['informed_parent'];
  contactStatus = json['contact_status'];
  remarks = json['remarks'];
  parentName = json['parent_name'];
  parentEmail = json['parent_email'];
  parentMobile = json['parent_mobile'];
  teacherId = json['teacher_id'];
  sendTo = json['send_to'];
  createdAt = json['createdAt'];
  updatedAt = json['updatedAt'];
  isprogress = json['isprogress'];
  if (json['status'] != null) {
  status = <Statuss>[];
  json['status'].forEach((v) { status!.add(new Statuss.fromJson(v)); });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['institution_id'] = this.institutionId;
  data['academic_year'] = this.academicYear;
  data['student_name'] = this.studentName;
  data['profile_pic'] = this.profilePic;
  data['admission_no'] = this.admissionNo;
  data['age'] = this.age;
  data['dob'] = this.dob;
  data['gender'] = this.gender;
  data['class'] = this.classs;
  data['batch'] = this.batch;
  data['section'] = this.section;
  data['batch_details'] = this.batchDetails;
  data['app_type'] = this.appType;
  data['visit_date'] = this.visitDate;
  data['visit_type'] = this.visitType;
  data['reason'] = this.reason;
  data['situation'] = this.situation;
  data['visit_status'] = this.visitStatus;
  data['informed_parent'] = this.informedParent;
  data['contact_status'] = this.contactStatus;
  data['remarks'] = this.remarks;
  data['parent_name'] = this.parentName;
  data['parent_email'] = this.parentEmail;
  data['parent_mobile'] = this.parentMobile;
  data['teacher_id'] = this.teacherId;
  data['send_to'] = this.sendTo;
  data['createdAt'] = this.createdAt;
  data['updatedAt'] = this.updatedAt;
  data['isprogress'] = this.isprogress;
  if (this.status != null) {
  data['status'] = this.status!.map((v) => v.toJson()).toList();
  }
  return data;
  }
}

class Statuss {
  String? sentBy;
  String? sentById;
  String? sentByToken;
  String? visitStatus;
  String? addedOn;String? remark;

  Statuss({this.sentBy, this.sentById, this.sentByToken, this.visitStatus, this.addedOn,this.remark});

  Statuss.fromJson(Map<String, dynamic> json) {
    sentBy = json['sent_by'];
    sentById = json['sent_by_id'];
    sentByToken = json['sent_by_token'];
    visitStatus = json['visit_status'];
    addedOn = json['Added_on'];remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sent_by'] = this.sentBy;
    data['sent_by_id'] = this.sentById;
    data['sent_by_token'] = this.sentByToken;
    data['visit_status'] = this.visitStatus;
    data['Added_on'] = this.addedOn;  data['remark'] = this.remark;
    return data;
  }
}