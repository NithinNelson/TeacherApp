
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/learning_observation_api_model.dart';
import '../../Services/api_services.dart';

class LessonObservationController extends GetxController {
  RxList<TeacherData> teacherNameList = <TeacherData>[].obs;
  RxList<TeacherDetails> teacherClassList = <TeacherDetails>[].obs;
  RxList<SubjectDetail> teacherSubjectList = <SubjectDetail>[].obs;
  Rx<LessonObservationData> lessonDataApi = LessonObservationData().obs;
  RxList<ListElement> learningWalkList = <ListElement>[].obs;
  RxList<ListElement> lessonObservationList = <ListElement>[].obs;

  void resetData() {
    teacherNameList.value = [];
    teacherSubjectList.value = [];
    teacherClassList.value = [];
    lessonDataApi.value = LessonObservationData();
  }

  Future<void> fetchLessonObservation() async {
    resetData();
    try {
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
    } catch (e) {
      print("-----------lesson obs error--------------");
    } finally {}
  }

  Future<void> getTeacherClassData({required String teacherName}) async {
    teacherClassList.value = [];
    teacherSubjectList.value = [];
    try {
      for (var teacher in teacherNameList) {
        if (teacher.teacherName == teacherName) {
          teacherClassList.value = teacher.details ?? [];
        }
      }
    } catch (e) {}
  }

  Future<void> getTeacherSubjectData({required String classAndBatch}) async {
    teacherSubjectList.value = [];
    try {
      for (var classes in teacherClassList) {
        if ("${classes.className} ${classes.batchName}" == classAndBatch) {
          teacherSubjectList.value = classes.subjectDetails ?? [];
        }
      }
    } catch (e) {}
  }
}
