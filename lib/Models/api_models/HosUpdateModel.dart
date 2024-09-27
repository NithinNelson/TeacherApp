class HosUpdateModel {
  int? id;
  String? visitStatus;
  String? sentBy;
  String? sentById;

  HosUpdateModel({this.id, this.visitStatus, this.sentBy, this.sentById});

  HosUpdateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    visitStatus = json['visit_status'];
    sentBy = json['sent_by'];
    sentById = json['sent_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['visit_status'] = this.visitStatus;
    data['sent_by'] = this.sentBy;
    data['sent_by_id'] = this.sentById;
    return data;
  }
}