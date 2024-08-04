import 'login_api_model.dart';

class LearningWalkApplyModel {
  final String schoolId;
  final String teacherId;
  final String teacherName;
  final String observerId;
  final String observerName;
  final String classId;
  final String classBatchName;
  final String batchId;
  final String topic;
  final String academicYear;
  final String batchName;
  final String className;
  final String subjectName;
  final String subjectId;
  final List<AllRolesArray> rollIds;
  final List<String> areasForImprovement;
  final List<String> strengths;
  final String remedialMeasures;
  final String? upperHierarchy;
  final String sessionId;
  final String curriculumId;
  final bool isJoin;
  final List<RemarksData> remarksData;

  LearningWalkApplyModel({
    required this.schoolId,
    required this.teacherId,
    required this.teacherName,
    required this.observerId,
    required this.observerName,
    required this.classId,
    required this.classBatchName,
    required this.batchId,
    required this.topic,
    required this.academicYear,
    required this.batchName,
    required this.className,
    required this.subjectName,
    required this.subjectId,
    required this.rollIds,
    required this.areasForImprovement,
    required this.strengths,
    required this.remedialMeasures,
    this.upperHierarchy,
    required this.sessionId,
    required this.curriculumId,
    required this.isJoin,
    required this.remarksData,
  });

  factory LearningWalkApplyModel.fromJson(Map<String, dynamic> json) {
    return LearningWalkApplyModel(
      schoolId: json['school_id'],
      teacherId: json['teacher_id'],
      teacherName: json['teacher_name'],
      observerId: json['observer_id'],
      observerName: json['observer_name'],
      classId: json['class_id'],
      classBatchName: json['class_batch_name'],
      batchId: json['batch_id'],
      topic: json['topic'],
      academicYear: json['academic_year'],
      batchName: json['batch_name'],
      className: json['class_name'],
      subjectName: json['subject_name'],
      subjectId: json['subject_id'],
      rollIds:
          (json['roll_ids'] as List).map((i) => AllRolesArray.fromJson(i)).toList(),
      areasForImprovement: List<String>.from(json['areas_for_improvement']),
      strengths: List<String>.from(json['strengths']),
      remedialMeasures: json['remedial_measures'],
      upperHierarchy: json['upper_hierarchy'],
      sessionId: json['session_id'],
      curriculumId: json['curriculum_id'],
      isJoin: json['isJoin'],
      remarksData: (json['remarks_data'] as List)
          .map((i) => RemarksData.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'school_id': schoolId,
      'teacher_id': teacherId,
      'teacher_name': teacherName,
      'observer_id': observerId,
      'observer_name': observerName,
      'class_id': classId,
      'class_batch_name': classBatchName,
      'batch_id': batchId,
      'topic': topic,
      'academic_year': academicYear,
      'batch_name': batchName,
      'class_name': className,
      'subject_name': subjectName,
      'subject_id': subjectId,
      'roll_ids': rollIds.map((i) => i.toJson()).toList(),
      'areas_for_improvement': areasForImprovement,
      'strengths': strengths,
      'remedial_measures': remedialMeasures,
      'upper_hierarchy': upperHierarchy,
      'session_id': sessionId,
      'curriculum_id': curriculumId,
      'isJoin': isJoin,
      'remarks_data': remarksData.map((i) => i.toJson()).toList(),
    };
  }
}

class RemarksData {
  final List<Indicator?> indicators;

  RemarksData({
    required this.indicators,
  });

  factory RemarksData.fromJson(Map<String, dynamic> json) {
    return RemarksData(
      indicators: (json['Indicators'] as List)
          .map((i) => Indicator.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Indicators': indicators.map((i) => i?.toJson()).toList(),
    };
  }
}

class Indicator {
  final String? name;
  final String? remark;
  final int? point;
  final String? dbKey;
  final String? alias;

  Indicator({
    this.name,
    this.remark,
    this.point,
    this.dbKey,
    this.alias,
  });

  factory Indicator.fromJson(Map<String, dynamic> json) {
    return Indicator(
      name: json['name'],
      remark: json['remark'],
      point: json['point'],
      dbKey: json['db_key'],
      alias: json['alias'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'remark': remark,
      'point': point,
      'db_key': dbKey,
      'alias': alias,
    };
  }
}
