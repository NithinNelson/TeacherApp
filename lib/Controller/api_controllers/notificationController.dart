import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../Models/api_models/learning_observation_api_model.dart';
import '../../Models/api_models/notification_api_model.dart';
import '../../Services/api_services.dart';

class NotificationController extends GetxController {
  Rx<NotificationDataModel> Notificationdata = NotificationDataModel().obs;
void data(){
  Notificationdata.value = NotificationDataModel();
}
  Future<void> fetchTimeTable() async {
 try {
   String? userId = Get.find<UserAuthController>().userData.value.userId;

   Map<String, dynamic> resp = await ApiServices.getNotification(
       userId: userId.toString(),
    );
   Notificationdata.value = NotificationDataModel.fromJson(resp);
   // if( ){}
   // else{}
 }catch(e){
 }




    }
  }

