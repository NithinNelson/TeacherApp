
import 'package:get/get.dart';
import 'package:teacherapp/Controller/api_controllers/userAuthController.dart';

import '../../Models/ui_models/menu_item_model.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxList<MenuItemsModel> menuItemsPerRole = <MenuItemsModel>[].obs;

  void changePage({required int currentPage}) {
    pageIndex.value = currentPage;
  }

  void setMenuItems(UserRole userRole) {
    if(userRole == UserRole.principal) {
      menuItemsPerRole.value = leaderMenuItems;
    } else {
      menuItemsPerRole.value = teacherMenuItems;
    }
  }
}