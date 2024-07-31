import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../Models/api_models/learning_observation_api_model.dart';
import '../../Models/api_models/notification_api_model.dart';
import '../../Services/api_services.dart';

class NotificationController extends GetxController {
  RxList<RecentNotifications> notificationList = <RecentNotifications>[].obs;
  Rx<NotificationDataModel> notificationDataApi = NotificationDataModel().obs;
  void resetData() {
    notificationList.value = [];

  }
  Future<void> fetchTimeTable() async {



    try {
      String? userId = Get.find<UserAuthController>().userData.value.userId;
      Map<String, dynamic> resp = await ApiServices.getNotification(
          userId: userId.toString(),
          );
      notificationDataApi.value = NotificationDataModel.fromJson(resp);
      if (resp['status']['code'] == 200) {

        notificationList.value = notificationDataApi.value.data?.details?.recentNotifications ?? [];
      }
    } catch (e) {


    }
    }
  }

