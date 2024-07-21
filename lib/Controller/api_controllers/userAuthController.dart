
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacherapp/Controller/ui_controllers/page_controller.dart';
import 'package:teacherapp/Services/shared_preferences.dart';
import '../../Models/api_models/hos_listing_api_model.dart';
import '../../Models/api_models/login_api_model.dart';
import '../../Services/api_services.dart';
import '../../Utils/Colors.dart';
import '../../View/CWidgets/TeacherAppPopUps.dart';

enum UserRole { principal, hos, teacher }

class UserAuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoaded = false.obs;
  RxBool isError = false.obs;
  Rx<UserData> userData = UserData().obs;
  Rx<UserRole?> userRole = Rx<UserRole?>(null);
  Rx<String?> schoolToken = Rx<String?>(null);
  RxList<HosList> hosList = <HosList>[].obs;

  void resetStatus() {
    isLoading.value = false;
    isError.value = false;
  }

  Future<void> fetchUserData(
      {required String username, required String password}) async {
    isLoading.value = true;
    isLoaded.value = false;
    try {
      Map<String, dynamic> resp =
          await ApiServices.userLogin(userName: username, psw: password);
      if (resp['status']['code'] == 200) {
        LoginApiModel loginApi = LoginApiModel.fromJson(resp);
        List<UserData> list = loginApi.data?.data ?? [];
        if (list.isNotEmpty) {
          userData.value = loginApi.data?.data?.first ?? UserData();
          String? schoolId = userData.value.schoolId;
          if (schoolId != null) {
            setSchoolTokenAndRoll(schoolId);
          }
          await SharedPrefs().setLoginData(loginApi);
          isLoaded.value = true;
        }
      } else {
        TeacherAppPopUps.submitFailed(
          title: "Failed",
          message: "Something went wrong.",
          actionName: "Try again",
          iconData: Icons.error_outline,
          iconColor: Colorutils.svguicolour2,
        );
      }
    } catch (e) {
      isLoaded.value = false;
      print("-----------login error-----------");
      TeacherAppPopUps.submitFailed(
        title: "Failed",
        message: "Something went wrong.",
        actionName: "Try again",
        iconData: Icons.error_outline,
        iconColor: Colorutils.svguicolour2,
      );
    } finally {
      resetStatus();
    }
  }

  Future<void> getUserData() async {
    isLoading.value = true;
    LoginApiModel? loginApi = await SharedPrefs().getLoginData();
    userData.value = loginApi?.data?.data?.first ?? UserData();
    String? userId = userData.value.userId;
    if (userId != null) {
      isLoaded.value = true;
    } else {
      isLoaded.value = false;
    }
    String? schoolId = userData.value.schoolId;
    if (schoolId != null) {
      await setSchoolTokenAndRoll(schoolId);
    }
    isLoading.value = false;
  }

  Future<void> setSchoolTokenAndRoll(schoolId) async {
    List<String> roleIds = userData.value.roleIds ?? [];
    if (schoolId == "CPpbKPQTcuG97i3kv") {
      schoolToken.value = "7a9d733269d23bc35b04b56dc855d330";
      if (roleIds.contains("rolepri12") ||
          roleIds.contains("role12123") ||
          roleIds.contains("62690f2b15f336042ba786786")) {
        userRole.value = UserRole.principal;
      } else if (roleIds.contains("role121235") ||
          roleIds.contains("role121234") ||
          roleIds.contains("v2QNTPPvPQK6T") ||
          roleIds.contains("role12123rqwer")) {
        userRole.value = UserRole.hos;
      } else if (roleIds.contains("role12123rqwer")) {
        userRole.value = UserRole.teacher;
      }
    }
    if (schoolId == "ps4vyLJhQvPZjfxaH") {
      schoolToken.value = "99d351fe9165be1c0cf35fa0a0885c17";
      if (roleIds.contains("rolepri12") ||
          roleIds.contains("role12123") ||
          roleIds.contains("62690f2b15f336042ba786786")) {
        userRole.value = UserRole.principal;
      } else if (roleIds.contains("role121235") ||
          roleIds.contains("role121234") ||
          roleIds.contains("5d8b3b701dad2f60218cbe46") ||
          roleIds.contains("role12123rqwer")) {
        userRole.value = UserRole.hos;
      } else if (roleIds.contains("role12123rqwer")) {
        userRole.value = UserRole.teacher;
      }
    }
    if (schoolId == "m2LMtqaESFZf6xDE8") {
      schoolToken.value = "47e2b919b8551d762e1dd1f5769b66ba";
      if (roleIds.contains("rolepri12") ||
          roleIds.contains("role12123") ||
          roleIds.contains("62690f2b15f336042ba786786")) {
        userRole.value = UserRole.principal;
      } else if (roleIds.contains("role121235") ||
          roleIds.contains("role121234") ||
          roleIds.contains("Eqt48DDGmQx8P") ||
          roleIds.contains("role12123rqwer")) {
        userRole.value = UserRole.hos;
      } else if (roleIds.contains("role12123rqwer")) {
        userRole.value = UserRole.teacher;
      }
    }
    if (schoolId == "2FwuqhgeoKt6SQiCG") {
      schoolToken.value = "0ae409a7d98dde57b35a4643d2354906";
      if (roleIds.contains("rolepri12") ||
          roleIds.contains("role12123") ||
          roleIds.contains("62690f2b15f336042ba786786")) {
        userRole.value = UserRole.principal;
      } else if (roleIds.contains("role121235") ||
          roleIds.contains("role121234") ||
          roleIds.contains("v2QNTPPvPQK6T") ||
          roleIds.contains("role12123rqwer")) {
        userRole.value = UserRole.hos;
      } else if (roleIds.contains("role12123rqwer")) {
        userRole.value = UserRole.teacher;
      }
    }

    if(userRole.value == UserRole.principal || userRole.value == UserRole.hos) {
      Get.find<PageIndexController>().setMenuItems(UserRole.principal);
    } else {
      Get.find<PageIndexController>().setMenuItems(UserRole.teacher);
    }
  }

  Future<void> fetchHosList() async {
    if(userRole.value == UserRole.principal) {
      String? userId = userData.value.userId;
      String? academicYear = userData.value.academicYear;
      try {
        Map<String, dynamic> resp =
        await ApiServices.getHosList(userId: userId.toString(), acYr: academicYear.toString());
        if (resp['status']['code'] == 200) {
          HosListApiModel hosListApi = HosListApiModel.fromJson(resp);
          hosList.value = hosListApi.data?.details?.response?.list ?? [];
        }
      } catch (e) {
        print("---------hos list error---------");
      } finally {}
    }
  }
}
