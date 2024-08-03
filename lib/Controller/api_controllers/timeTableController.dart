
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/time_table_api_model.dart';
import '../../Models/api_models/work_load_api_model.dart';
import '../../Services/api_services.dart';

class TimeTableController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  RxList<TeacherSubject> teacherSubjects = <TeacherSubject>[].obs;
  RxList<ResultArray> teacherTimeTable = <ResultArray>[].obs;
  RxList<TimeTable> teacherTimeTableToday = <TimeTable>[].obs;
  RxList<TimeTable> selectedTimetable = <TimeTable>[].obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  Future<void> fetchTimeTable() async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String? userId = Get.find<UserAuthController>().userData.value.schoolId;
      String? acYr = Get.find<UserAuthController>().userData.value.academicYear;
      String? teacherId = Get.find<UserAuthController>().userData.value.userId;
      Map<String, dynamic> resp = await ApiServices.getTimeTable(
        userId: userId.toString(),
        academicYear: acYr.toString(),
        teacherId: teacherId.toString(),
      );
      TimeTableModel timeTableModel = TimeTableModel.fromJson(resp);
      int weekDay = DateTime.now().weekday;
      if (resp['status']['code'] == 200) {
        teacherTimeTable.value = timeTableModel.data?.resultArray ?? [];
        for (var week in teacherTimeTable) {
          if(week.id == weekDay) {
            teacherTimeTableToday.value = week.timeTable;
          }
        }
      }
    } catch (e) {
      print("------time table error---------");
      isLoaded.value = false;
    } finally {
      resetStatus();
    }
  }

  Future<void> fetchWorkLoad() async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      String? userId = Get.find<UserAuthController>().userData.value.userId;
      Map<String, dynamic> resp = await ApiServices.getWorkLoadApi(userId: userId.toString());
      WorkloadApiModel workloadApiModel = WorkloadApiModel.fromJson(resp);
      if (resp['status']['code'] == 200) {
        List<OwnList> ownList = workloadApiModel.data?.data.first.facultyData?.teacherComponent?.ownList ?? [];
        teacherSubjects.value = [];
        for (var sub in ownList) {
          for (var subDetail in sub.subjects) {
            teacherSubjects.add(
                TeacherSubject(
                  sub: subDetail.name,
                  classs: sub.ownListClass?.name,
                  batch: sub.batch?.name,
                  batchId: sub.batch?.id,
                  classId: sub.ownListClass?.id,
                  curriculumId: sub.curriculum?.id,
                  sessionId: sub.session?.id,
                  isClassTeacher: sub.isClassTeacher,
                ),
            );
          }
        }
      }
    } catch (e) {
      print("------work load error---------");
      isLoaded.value = false;
    } finally {
      resetStatus();
    }
  }

  void setSelectedTimetable({required List<TimeTable> result}) {
    selectedTimetable.value = result;
  }
}
