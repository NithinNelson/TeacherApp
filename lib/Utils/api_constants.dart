class ApiConstants {
  static final ApiConstants _instance = ApiConstants._internal();

  ApiConstants._internal();

  factory ApiConstants() {
    return _instance;
  }

  static String appVersion = "Version : 2.0.0";
  static Map<String, String> headers = {
    'x-auth-token': 'tq355lY3MJyd8Uj2ySzm',
    'Content-Type': 'application/json'
  };

  //-----------------live url------------------

  // static String baseUrl = "https://nims3000.educore.guru";
  // static String chat = "https://chat.bmark.in/api";

  //-----------------test url------------------

  static String baseUrl = "https://teamsqa3000.educore.guru";
  static String downloadUrl = "https://teamsqa4000.educore.guru";
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
  static String requestLeave = "/v0/api/add/leave";
  static String fileUpload = "/upload";
  static String leaveFileUpload = "/server-uploads";
  static String deleteMsg = "/deletemessage";
  static String parentList = "/getparents";
  static String notification = "/v0/notifications/header/details/";
  static String notificationEnd = "/educore";
  static String groupedView = "/groupedview";
  static String updatenotification = "/v0/notifications/update/status";
  static String leaveReqList = "/v0/get/classteacher/student/list/";
  static String leaveApprovalList = "/v0/get/leave/teacher/list";
  static String studentListApi = "/v2/class/students/attendance/list";
  static String attendanceSubmit = "/v2/teacher/class/take/attendance/";
  static String messageInfo = "/messageinfo";
  static String reactionSent = "/reactteacher";
  static String forgotPassword = "/v1/forgot_password";
  static String lessonSubmit = "/v2/lesson_observation/submit_evaluation";
  static String learningWalkSubmit = "/v2/learning_walk/submit_evaluation";
  static String observationResult = "/v0/learning-observation/get/userSubmissions";
  static String fcmSentApi = "/v0/educare/add/login_tracker";


  static String DOCME_URL = "https://sqa.docme.online/bm-school/api/App";
  static String Observationlist = "https://teamsqa3000.educore.guru/v0/learning-observation/get/userSubmissions";
  static String IMAGE_BASE_URL = "https://teamsqa4000.educore.guru";
  static String ObservationResultSubmitLearningWalk = "https://teamsqa3000.educore.guru/v0/learning-walk/addTeacherCmnt";
  static String ObservationResultlist = "https://teamsqa3000.educore.guru/v0/learning-observation/submissionView/";
  static String ObservationResultSubmitLessonObservation = "https://teamsqa3000.educore.guru/v0/lesson-observation/addTeacherCmnt";
  static String LeaveApprovalRequest = "https://teamsqa3000.educore.guru/v0/update/leave";
  static String WorkLoad = "https://teamsqa3000.educore.guru/v2/get/workloads/from/credentials";
  static String Qrscan = "https://sqa.docme.online/bm-school/Docme-UI/registration/get_student_search_data";
  static String RecentVisit = "https://apiqa-bmclinic.docme.online/v2/recent_visit";
  static String AddClinicStudents = "https://apiqa-bmclinic.docme.online/v2/add_student";
  static String studentsUpdateClinc = "https://apiqa-bmclinic.docme.online/v2/update_visit";
}
