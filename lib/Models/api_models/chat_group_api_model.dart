
class ClassGroupApiModel {
  ClassGroupApiModel({
    this.status,
    this.data,
  });

  final Status? status;
  final Data? data;

  factory ClassGroupApiModel.fromJson(Map<String, dynamic> json) {
    return ClassGroupApiModel(
      status: json["status"] == null ? null : Status.fromJson(json["status"]),
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.message,
    this.classTeacher,
    this.data,
  });

  final String? message;
  final List<ClassTeacherGroup>? classTeacher;
  final List<ClassTeacherGroup>? data;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json["message"],
      classTeacher: json["class_teacher"] == null
          ? []
          : List<ClassTeacherGroup>.from(
              json["class_teacher"]!.map((x) => ClassTeacherGroup.fromJson(x))),
      data: json["data"] == null
          ? []
          : List<ClassTeacherGroup>.from(
              json["data"]!.map((x) => ClassTeacherGroup.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "class_teacher": classTeacher?.map((x) => x.toJson()).toList(),
        "data": data?.map((x) => x.toJson()).toList(),
      };
}

class ClassTeacherGroup {
  ClassTeacherGroup({
    this.classTeacherClass,
    this.batch,
    this.subjectId,
    this.subjectName,
    this.isClassTeacher,
    this.unreadCount,
    this.type,
    this.lastMessage,
  });

  final String? classTeacherClass;
  final String? batch;
  final String? subjectId;
  final String? subjectName;
  final bool? isClassTeacher;
  final int? unreadCount;
  final String? type;
  final List<LastMessage>? lastMessage;

  factory ClassTeacherGroup.fromJson(Map<String, dynamic> json) {
    return ClassTeacherGroup(
      classTeacherClass: json["class"],
      batch: json["batch"],
      subjectId: json["subject_id"],
      subjectName: json["subject_name"],
      isClassTeacher: json["is_class_teacher"],
      unreadCount: json["unread_count"],
      type: json["type"],
      lastMessage: json["last_message"] == null
          ? []
          : List<LastMessage>.from(
              json["last_message"]!.map((x) => LastMessage.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "class": classTeacherClass,
        "batch": batch,
        "subject_id": subjectId,
        "subject_name": subjectName,
        "is_class_teacher": isClassTeacher,
        "unread_count": unreadCount,
        "type": type,
        "last_message": lastMessage?.map((x) => x.toJson()).toList(),
      };
}

class LastMessage {
  LastMessage({
    this.type,
    this.message,
    this.messageFile,
    this.fileName,
    this.messageAudio,
    this.sandAt,
  });

  final String? type;
  final String? message;
  final dynamic messageFile;
  final dynamic fileName;
  final dynamic messageAudio;
  final DateTime? sandAt;

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      type: json["type"],
      message: json["message"],
      messageFile: json["message_file"],
      fileName: json["file_name"],
      messageAudio: json["message_audio"],
      sandAt: DateTime.tryParse(json["sand_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
        "message_file": messageFile,
        "file_name": fileName,
        "message_audio": messageAudio,
        "sand_at": sandAt?.toIso8601String(),
      };
}

class Status {
  Status({
    this.code,
    this.message,
  });

  final int? code;
  final String? message;

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      code: json["code"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
