class QrclinicModel {
  String? studentId;
  String? admnNo;
  String? studentName;
  String? profileImage;
  String? profileImageAlternate;
  String? classCode;
  String? batch;
  String? description;
  String? studStatus;
  int? instID;
  int? age;
  String? dob;
  String? gender;
  String? fatherName;
  String? fatherAddress;
  String? fatherPhone;
  String? fatherEmail;
  String? fatherPostalCode;
  String? motherName;
  String? motherAddress;
  String? motherPhone;
  String? motherEmail;
  String? motherPostalCode;
  List<Siblings>? siblings;

  QrclinicModel(
      {this.studentId,
        this.admnNo,
        this.studentName,
        this.profileImage,
        this.profileImageAlternate,
        this.classCode,
        this.batch,
        this.description,
        this.studStatus,
        this.instID,
        this.age,
        this.dob,
        this.gender,
        this.fatherName,
        this.fatherAddress,
        this.fatherPhone,
        this.fatherEmail,
        this.fatherPostalCode,
        this.motherName,
        this.motherAddress,
        this.motherPhone,
        this.motherEmail,
        this.motherPostalCode,
        this.siblings});

  QrclinicModel.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    admnNo = json['Admn_No'];
    studentName = json['student_name'];
    profileImage = json['profile_image'];
    profileImageAlternate = json['profile_image_alternate'];
    classCode = json['Class_code'];
    batch = json['batch'];
    description = json['Description'];
    studStatus = json['stud_status'];
    instID = json['inst_ID'];
    age = json['age'];
    dob = json['dob'];
    gender = json['gender'];
    fatherName = json['father_name'];
    fatherAddress = json['father_address'];
    fatherPhone = json['father_phone'];
    fatherEmail = json['father_email'];
    fatherPostalCode = json['father_postal_code'];
    motherName = json['mother_name'];
    motherAddress = json['mother_address'];
    motherPhone = json['mother_phone'];
    motherEmail = json['mother_email'];
    motherPostalCode = json['mother_postal_code'];
    if (json['siblings'] != null) {
      siblings = <Siblings>[];
      json['siblings'].forEach((v) {
        siblings!.add(new Siblings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['Admn_No'] = this.admnNo;
    data['student_name'] = this.studentName;
    data['profile_image'] = this.profileImage;
    data['profile_image_alternate'] = this.profileImageAlternate;
    data['Class_code'] = this.classCode;
    data['batch'] = this.batch;
    data['Description'] = this.description;
    data['stud_status'] = this.studStatus;
    data['inst_ID'] = this.instID;
    data['age'] = this.age;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['father_name'] = this.fatherName;
    data['father_address'] = this.fatherAddress;
    data['father_phone'] = this.fatherPhone;
    data['father_email'] = this.fatherEmail;
    data['father_postal_code'] = this.fatherPostalCode;
    data['mother_name'] = this.motherName;
    data['mother_address'] = this.motherAddress;
    data['mother_phone'] = this.motherPhone;
    data['mother_email'] = this.motherEmail;
    data['mother_postal_code'] = this.motherPostalCode;
    if (this.siblings != null) {
      data['siblings'] = this.siblings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Siblings {
  String? siblingId;
  String? siblingName;
  String? siblingGender;
  String? siblingAdmnNo;
  String? siblingProfileImage;
  String? siblingProfileImageAlternate;
  String? siblingClassCode;
  String? siblingBatch;
  String? siblingAcademicYear;
  String? siblingStudStatus;
  int? siblingInstId;
  int? siblingAge;
  String? siblingDob;

  Siblings(
      {this.siblingId,
        this.siblingName,
        this.siblingGender,
        this.siblingAdmnNo,
        this.siblingProfileImage,
        this.siblingProfileImageAlternate,
        this.siblingClassCode,
        this.siblingBatch,
        this.siblingAcademicYear,
        this.siblingStudStatus,
        this.siblingInstId,
        this.siblingAge,
        this.siblingDob});

  Siblings.fromJson(Map<String, dynamic> json) {
    siblingId = json['sibling_id'];
    siblingName = json['sibling_name'];
    siblingGender = json['sibling_gender'];
    siblingAdmnNo = json['sibling_admn_no'];
    siblingProfileImage = json['sibling_profile_image'];
    siblingProfileImageAlternate = json['sibling_profile_image_alternate'];
    siblingClassCode = json['sibling_class_code'];
    siblingBatch = json['sibling_batch'];
    siblingAcademicYear = json['sibling_academic_year'];
    siblingStudStatus = json['sibling_stud_status'];
    siblingInstId = json['sibling_inst_id'];
    siblingAge = json['sibling_age'];
    siblingDob = json['sibling_dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sibling_id'] = this.siblingId;
    data['sibling_name'] = this.siblingName;
    data['sibling_gender'] = this.siblingGender;
    data['sibling_admn_no'] = this.siblingAdmnNo;
    data['sibling_profile_image'] = this.siblingProfileImage;
    data['sibling_profile_image_alternate'] = this.siblingProfileImageAlternate;
    data['sibling_class_code'] = this.siblingClassCode;
    data['sibling_batch'] = this.siblingBatch;
    data['sibling_academic_year'] = this.siblingAcademicYear;
    data['sibling_stud_status'] = this.siblingStudStatus;
    data['sibling_inst_id'] = this.siblingInstId;
    data['sibling_age'] = this.siblingAge;
    data['sibling_dob'] = this.siblingDob;
    return data;
  }
}