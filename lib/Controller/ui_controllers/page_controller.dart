
import 'package:get/get.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage({required int currentPage}) {
    pageIndex.value = currentPage;
  }
}