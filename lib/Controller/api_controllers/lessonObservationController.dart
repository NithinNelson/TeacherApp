
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/learning_observation_api_model.dart';
import '../../Models/api_models/learning_walk_apply_model.dart';
import '../../Services/api_services.dart';

class LessonObservationController extends GetxController {
  RxList<TeacherData> teacherNameList = <TeacherData>[].obs;
  Rx<TeacherData?> selectedTeacher = Rx<TeacherData?>(null);
  RxList<TeacherDetails> teacherClassList = <TeacherDetails>[].obs;
  Rx<TeacherDetails?> selectedClass = Rx<TeacherDetails?>(null);
  RxList<SubjectDetail> teacherSubjectList = <SubjectDetail>[].obs;
  Rx<SubjectDetail?> selectedSubject = Rx<SubjectDetail?>(null);
  Rx<LessonObservationData> lessonDataApi = LessonObservationData().obs;
  RxList<ListElement> learningWalkList = <ListElement>[].obs;
  RxList<ListElement> lessonObservationList = <ListElement>[].obs;
  RxList<Indicator> markedIndicators = <Indicator>[].obs;

  void resetData() {
    teacherNameList.value = [];
    selectedTeacher.value = null;
    selectedClass.value = null;
    selectedSubject.value = null;
    teacherSubjectList.value = [];
    teacherClassList.value = [];
    lessonDataApi.value = LessonObservationData();
  }

  void resetLearningWalkDropdownData() {
    selectedTeacher.value = null;
    selectedClass.value = null;
    selectedSubject.value = null;
    teacherSubjectList.value = [];
    teacherClassList.value = [];
  }

  Future<void> fetchLessonObservation() async {
    resetData();
    // try {
      String? userId = Get.find<UserAuthController>().userData.value.userId;
      String? acYr = Get.find<UserAuthController>().userData.value.academicYear;
      Map<String, dynamic> resp = await ApiServices.getLeadership(
          userId: userId.toString(),
          academicYear: acYr.toString(),
          hosStatus: true);
      lessonDataApi.value = LessonObservationData.fromJson(resp);
      if (resp['status']['code'] == 200) {
        teacherNameList.value = lessonDataApi.value.data?.details?.response ?? [];
        learningWalkList.value = lessonDataApi.value.data?.details?.learningWalk?.list ?? [];
        lessonObservationList.value = lessonDataApi.value.data?.details?.lessonObservations?.list ?? [];
      }
    // } catch (e) {
    //   print("-----------lesson obs error--------------");
    // } finally {}
  }

  Future<void> getTeacherClassData({required String teacherName}) async {
    teacherClassList.value = [];
    teacherSubjectList.value = [];
    selectedTeacher.value = null;
    selectedSubject.value = null;
    selectedClass.value = null;
    try {
      for (var teacher in teacherNameList) {
        if (teacher.teacherName == teacherName) {
          selectedTeacher.value = teacher;
          teacherClassList.value = teacher.details ?? [];
        }
      }
    } catch (e) {}
  }

  Future<void> getTeacherSubjectData({required String classAndBatch}) async {
    teacherSubjectList.value = [];
    selectedClass.value = null;
    selectedSubject.value = null;
    try {
      for (var classes in teacherClassList) {
        if ("${classes.className} ${classes.batchName}" == classAndBatch) {
          selectedClass.value = classes;
          teacherSubjectList.value = classes.subjectDetails ?? [];
        }
      }
    } catch (e) {}
  }

  Future<void> setTeacherSubjectData({required String subName}) async {
    try {
      for (var sub in teacherSubjectList) {
        if (sub.subjectName == subName) {
          selectedSubject.value = sub;
        }
      }
    } catch (e) {}
  }

  // void addIndicator({required Indicator indicator}) {
  //   markedIndicators.value.add(
  //       indicator,
  //   );
  // }
}
