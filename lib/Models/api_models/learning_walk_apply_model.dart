import 'login_api_model.dart';

class LearningFields {
  static final List<String> values = [
    /// Add all fields
    id, schoolId, teacherId, teacherName, observerId, observerName, classId,
    classBatchName, batchId, topic, academicYear, batchName, className,
    subjectName,
    subjectId, rollIds, areasForImprovement, strengths, remedialMeasures,
    upperHierarchy,
    sessionId, curriculumId, isJoin, remarksData, indicators, name, remark,
    point, dbKey, alias
  ];

  static final String id = '_id';
  static final String schoolId = 'school_id';
  static final String teacherId = 'teacher_id';
  static final String teacherName = 'teacher_name';
  static final String observerId = 'observer_id';
  static final String observerName = 'observer_name';
  static final String classId = 'class_id';
  static final String classBatchName = 'class_batch_name';
  static final String batchId = 'batch_id';
  static final String topic = 'topic';
  static final String academicYear = 'academic_year';
  static final String batchName = 'batch_name';
  static final String className = 'class_name';
  static final String subjectName = 'subject_name';
  static final String subjectId = 'subject_id';
  static final String rollIds = 'roll_ids';
  static final String areasForImprovement = 'areas_for_improvement';
  static final String strengths = 'strengths';
  static final String remedialMeasures = 'remedial_measures';
  static final String upperHierarchy = 'upper_hierarchy';
  static final String sessionId = 'session_id';
  static final String curriculumId = 'curriculum_id';
  static final String isJoin = 'isJoin';
  static final String remarksData = 'remarks_data';
  static final String indicators = 'Indicators';
  static final String name = 'name';
  static final String remark = 'remark';
  static final String point = 'point';
  static final String dbKey = 'db_key';
  static final String alias = 'alias';
}

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
      schoolId: json[LearningFields.schoolId],
      teacherId: json[LearningFields.teacherId],
      teacherName: json[LearningFields.teacherName],
      observerId: json[LearningFields.observerId],
      observerName: json[LearningFields.observerName],
      classId: json[LearningFields.classId],
      classBatchName: json[LearningFields.classBatchName],
      batchId: json[LearningFields.batchId],
      topic: json[LearningFields.topic],
      academicYear: json[LearningFields.academicYear],
      batchName: json[LearningFields.batchName],
      className: json[LearningFields.className],
      subjectName: json[LearningFields.subjectName],
      subjectId: json[LearningFields.subjectId],
      rollIds: (json[LearningFields.rollIds] as List)
          .map((i) => AllRolesArray.fromJson(i))
          .toList(),
      areasForImprovement:
          List<String>.from(json[LearningFields.areasForImprovement]),
      strengths: List<String>.from(json[LearningFields.strengths]),
      remedialMeasures: json[LearningFields.remedialMeasures],
      upperHierarchy: json[LearningFields.upperHierarchy],
      sessionId: json[LearningFields.sessionId],
      curriculumId: json[LearningFields.curriculumId],
      isJoin: json[LearningFields.isJoin],
      remarksData: (json[LearningFields.remarksData] as List)
          .map((i) => RemarksData.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      LearningFields.schoolId: schoolId,
      LearningFields.teacherId: teacherId,
      LearningFields.teacherName: teacherName,
      LearningFields.observerId: observerId,
      LearningFields.observerName: observerName,
      LearningFields.classId: classId,
      LearningFields.classBatchName: classBatchName,
      LearningFields.batchId: batchId,
      LearningFields.topic: topic,
      LearningFields.academicYear: academicYear,
      LearningFields.batchName: batchName,
      LearningFields.className: className,
      LearningFields.subjectName: subjectName,
      LearningFields.subjectId: subjectId,
      LearningFields.rollIds: rollIds.map((i) => i.toJson()).toList(),
      LearningFields.areasForImprovement: areasForImprovement,
      LearningFields.strengths: strengths,
      LearningFields.remedialMeasures: remedialMeasures,
      LearningFields.upperHierarchy: upperHierarchy,
      LearningFields.sessionId: sessionId,
      LearningFields.curriculumId: curriculumId,
      LearningFields.isJoin: isJoin,
      LearningFields.remarksData: remarksData.map((i) => i.toJson()).toList(),
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
      indicators: (json[LearningFields.indicators] as List)
          .map((i) => Indicator.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      LearningFields.indicators: indicators.map((i) => i?.toJson()).toList(),
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
      name: json[LearningFields.name],
      remark: json[LearningFields.remark],
      point: json[LearningFields.point],
      dbKey: json[LearningFields.dbKey],
      alias: json[LearningFields.alias],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      LearningFields.name: name,
      LearningFields.remark: remark,
      LearningFields.point: point,
      LearningFields.dbKey: dbKey,
      LearningFields.alias: alias,
    };
  }
}
