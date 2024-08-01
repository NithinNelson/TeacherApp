import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';
import '../../Models/api_models/notification_api_model.dart';
import '../../Services/api_services.dart';

class NotificationController extends GetxController {
  RxList<RecentNotifications> Recentnotification = <RecentNotifications>[].obs;
  Rx<NotificationDataModel> Notificationdata = NotificationDataModel().obs;

  void data() {
    Recentnotification.value = [];
    Notificationdata.value = NotificationDataModel();
  }

  Future<void> fetchNotification() async {
    try {
      String? userId = Get.find<UserAuthController>().userData.value.userId;

      Map<String, dynamic> resp = await ApiServices.getNotification(
        userId: userId.toString(),
      );
      Notificationdata.value = NotificationDataModel.fromJson(resp);
      if (resp['status']['code'] == 200) {
        // teacherNameList.value = lessonDataApi.value.data?.details?.response ?? [];
        Recentnotification.value =
            Notificationdata.value.data?.details?.recentNotifications ?? [];
      } else {}
    } catch (e) {}
  }
}
