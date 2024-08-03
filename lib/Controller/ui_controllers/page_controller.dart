
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../Models/ui_models/menu_item_model.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxList<MenuItemsModel> menuItemsPerRole = <MenuItemsModel>[].obs;
  RxBool isFromChoice = false.obs;
  RxInt navLength = 5.obs;

  void changePage({required int currentPage}) {
    pageIndex.value = currentPage;
  }

  void setMenuItems({required UserRole userRole, required bool fromChoice}) {
    isFromChoice.value = fromChoice;
    if(fromChoice) {
      if(userRole == UserRole.principal) {
        navLength.value = 5;
        menuItemsPerRole.value = leaderMenuItems;
      } else {
        navLength.value = 4;
        menuItemsPerRole.value = choiceTeacherMenuItems;
      }
    } else {
      if(userRole == UserRole.principal) {
        navLength.value = 5;
        menuItemsPerRole.value = leaderMenuItems;
      } else {
        navLength.value = 5;
        menuItemsPerRole.value = teacherMenuItems;
      }
    }
  }
}