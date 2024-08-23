
import 'package:get/get.dart';
import '../Controller/api_controllers/chatClassGroupController.dart';
import '../Controller/api_controllers/feedViewController.dart';
import '../Controller/api_controllers/groupedViewController.dart';
import '../Controller/api_controllers/groupedViewListController.dart';
import '../Controller/api_controllers/leaveApprovalController.dart';
import '../Controller/api_controllers/leaveRequestController.dart';
import '../Controller/api_controllers/lessonLearningController.dart';
import '../Controller/api_controllers/markAsReadController.dart';
import '../Controller/api_controllers/notificationController.dart';
import '../Controller/api_controllers/obsResultController.dart';
import '../Controller/api_controllers/parentChatController.dart';
import '../Controller/api_controllers/parentChatListController.dart';
import '../Controller/api_controllers/qrController.dart';
import '../Controller/api_controllers/timeTableController.dart';
import '../Controller/api_controllers/userAuthController.dart';
import '../Controller/forward_controller.dart/forward_controller.dart';
import '../Controller/message_info_controller/message_info_controller.dart';
import '../Controller/reaction_controller/reaction_controller.dart';
import '../Controller/ui_controllers/keyboardController.dart';
import '../Controller/ui_controllers/page_controller.dart';
import '../Controller/ui_controllers/textFieldController.dart';

class HandleControllers {
  static createGetControllers() {
  Get.put(UserAuthController());
  Get.put(PageIndexController());
  Get.put(KeyboardController());
  Get.put(TextFieldController());
  Get.put(TimeTableController());
  Get.put(ChatClassGroupController());
  Get.put(LessonLearningController());
  Get.put(ParentChatListController());
  Get.put(FeedViewController());
  Get.put(NotificationController());
  Get.put(MarkAsReadController());
  Get.put(GroupedViewListController());
  Get.put(GroupedViewController());
  Get.put(ParentChattingController());
  Get.put(LeaveRequestController());
  Get.put(LeaveApprovalController());
  Get.put(ForwardController());
  Get.put(MessageInfoController());
  Get.put(ReactionController());
  Get.put(ObsResultController());
  Get.put(Qrcontroller());
  }
  static deleteAllGetControllers() {
    Get.delete<UserAuthController>();
    Get.delete<PageIndexController>();
    Get.delete<KeyboardController>();
    Get.delete<TextFieldController>();
    Get.delete<TimeTableController>();
    Get.delete<ChatClassGroupController>();
    Get.delete<LessonLearningController>();
    Get.delete<ParentChatListController>();
    Get.delete<FeedViewController>();
    Get.delete<NotificationController>();
    Get.delete<MarkAsReadController>();
    Get.delete<GroupedViewListController>();
    Get.delete<GroupedViewController>();
    Get.delete<ParentChattingController>();
    Get.delete<LeaveRequestController>();
    Get.delete<LeaveApprovalController>();
    Get.delete<ForwardController>();
    Get.delete<MessageInfoController>();
    Get.delete<ReactionController>();
    Get.delete<ObsResultController>();
    Get.delete<Qrcontroller>();
  }
}