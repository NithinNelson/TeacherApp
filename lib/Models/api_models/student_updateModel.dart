class StudentUpdateModel {
  int? visitId;
  String? user;
  String? userId;
  String? userToken;

  StudentUpdateModel({this.visitId, this.user, this.userId, this.userToken});

  StudentUpdateModel.fromJson(Map<String, dynamic> json) {
    visitId = json['visit_id'];
    user = json['user'];
    userId = json['user_id'];
    userToken = json['user_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visit_id'] = this.visitId;
    data['user'] = this.user;
    data['user_id'] = this.userId;
    data['user_token'] = this.userToken;
    return data;
  }

}