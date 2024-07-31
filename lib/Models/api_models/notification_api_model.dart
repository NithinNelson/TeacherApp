class NotificationDataModel {
  Status? status;
  Data? data;

  NotificationDataModel({this.status, this.data});

  NotificationDataModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
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
  String? source;
  Details? details;

  Data({this.message, this.source, this.details});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    source = json['source'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['source'] = this.source;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  List<RecentNotifications>? recentNotifications;
  int? unreadCount;

  Details({this.recentNotifications, this.unreadCount});

  Details.fromJson(Map<String, dynamic> json) {
    if (json['recentNotifications'] != null) {
      recentNotifications = <RecentNotifications>[];
      json['recentNotifications'].forEach((v) {
        recentNotifications!.add(new RecentNotifications.fromJson(v));
      });
    }
    unreadCount = json['unreadCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recentNotifications != null) {
      data['recentNotifications'] =
          this.recentNotifications!.map((v) => v.toJson()).toList();
    }
    data['unreadCount'] = this.unreadCount;
    return data;
  }
}

class RecentNotifications {
  List<NotificationStatus>? notificationStatus;
  List<String>? custom;
  String? updatedOn;
  String? sId;
  int? type;
  int? iconType;
  String? status;
  String? msg;
  String? genDate;
  String? senderId;
  String? updatedBy;

  RecentNotifications(
      {this.notificationStatus,
        this.custom,
        this.updatedOn,
        this.sId,
        this.type,
        this.iconType,
        this.status,
        this.msg,
        this.genDate,
        this.senderId,
        this.updatedBy});

  RecentNotifications.fromJson(Map<String, dynamic> json) {
    if (json['notification_status'] != null) {
      notificationStatus = <NotificationStatus>[];
      json['notification_status'].forEach((v) {
        notificationStatus!.add(new NotificationStatus.fromJson(v));
      });
    }
    custom = json['custom'].cast<String>();
    updatedOn = json['updated_on'];
    sId = json['_id'];
    type = json['type'];
    iconType = json['icon_type'];
    status = json['status'];
    msg = json['msg'];
    genDate = json['gen-date'];
    senderId = json['sender_id'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationStatus != null) {
      data['notification_status'] =
          this.notificationStatus!.map((v) => v.toJson()).toList();
    }
    data['custom'] = this.custom;
    data['updated_on'] = this.updatedOn;
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['icon_type'] = this.iconType;
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['gen-date'] = this.genDate;
    data['sender_id'] = this.senderId;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}

class NotificationStatus {
  String? userId;
  bool? status;

  NotificationStatus({this.userId, this.status});

  NotificationStatus.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['status'] = this.status;
    return data;
  }
}
