class ApiConstants {
  static final ApiConstants _instance = ApiConstants._internal();

  ApiConstants._internal();

  factory ApiConstants() {
    return _instance;
  }

  static String appVersion = "Version : 1.0.0";
  static Map<String, String> headers = {
    'x-auth-token': 'tq355lY3MJyd8Uj2ySzm',
    'Content-Type': 'application/json'
  };

  //-----------------live url------------------

  // static String baseUrl = "https://nims3000.educore.guru";
  // static String chat = "https://chat.bmark.in/api";

  //-----------------test url------------------

  static String baseUrl = "https://teamsqa3000.educore.guru";
  static String chat = "https://chat.bmark.in/api";

  //----------------commons--------------------

  static String login = "/v1/login_auth";
  static String googleSignIn = "/v1/gsuit_login_lessonapp";
  static String hosList = "/v2/lesson_observation/init/data";
  static String workLoad = "/v2/get/workloads/from/credentials";
  static String timeTable = "/v2/timetable/mobile";
  static String lessonObservation = "/v2/lesson_observation/init/data";
  static String classGroup = "/classgroup";
  static String parentChatList = "/parentchatlist";
  static String parentChatMessages = "/parentchatlistdata";
  static String teacherMsgList = "/teachermessagelist";
  static String sentMsgByTeacher = "/sendmessageteacher";
  static String fileUpload = "/upload";
  static String deleteMsg = "/deletemessage";
  static String parentList = "/getparents";
  static String notification = "/v0/notifications/header/details/";
  static String notificationEnd = "/educore";
  static String groupedView = "/groupedview";
  static String updatenotification = "/v0/notifications/update/status";
  static String leaveReqList = "/v0/get/classteacher/student/list/";
}
