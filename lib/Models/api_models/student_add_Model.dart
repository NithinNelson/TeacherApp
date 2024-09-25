class StudentAddModel {
  String? admnNo;
  String? studentName;
  String? profilePic;
  String? batchDetails;
  String? academicYear;
  int? instID;
  int? age;
  String? dob;
  String? gender;
  String? fatherName;
  String? fatherPhone;
  String? fatherEmail;
  String? remarks;
  String? appType;
  String? visitStatus;
  String? sentBy;
  String? sentById;
  String? sentByToken;
  String? sentTo;
  StudentAddModel(
      {this.admnNo,
        this.studentName,
        this.profilePic,
        this.batchDetails,
        this.academicYear,
        this.instID,
        this.age,
        this.dob,
        this.gender,
        this.fatherName,
        this.fatherPhone,
        this.fatherEmail,
        this.remarks,
        this.appType,
        this.visitStatus,
        this.sentBy,
        this.sentById,
        this.sentByToken,  this.sentTo});

  StudentAddModel.fromJson(Map<String, dynamic> json) {
    admnNo = json['Admn_No'];
    studentName = json['student_name'];
    profilePic = json['profile_pic'];
    batchDetails = json['batch_details'];
    academicYear = json['academic_year'];
    instID = json['inst_ID'];
    age = json['age'];
    dob = json['dob'];
    gender = json['gender'];
    fatherName = json['father_name'];
    fatherPhone = json['father_phone'];
    fatherEmail = json['father_email'];
    remarks = json['remarks'];
    appType = json['app_type'];
    visitStatus = json['visit_status'];
    sentBy = json['sent_by'];
    sentById = json['sent_by_id'];
    sentByToken = json['sent_by_token'];
    sentTo = json['sent_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Admn_No'] = this.admnNo;
    data['student_name'] = this.studentName;
    data['profile_pic'] = this.profilePic;
    data['batch_details'] = this.batchDetails;
    data['academic_year'] = this.academicYear;
    data['inst_ID'] = this.instID;
    data['age'] = this.age;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['father_name'] = this.fatherName;
    data['father_phone'] = this.fatherPhone;
    data['father_email'] = this.fatherEmail;
    data['remarks'] = this.remarks;
    data['app_type'] = this.appType;
    data['visit_status'] = this.visitStatus;
    data['sent_by'] = this.sentBy;
    data['sent_by_id'] = this.sentById;
    data['sent_by_token'] = this.sentByToken;
    data['sent_to'] = this.sentTo;
    return data;
  }
}

