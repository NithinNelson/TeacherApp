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

  //-----------------test url------------------

  static String baseUrl = "https://teamsqa3000.educore.guru";

  //----------------commons--------------------

  static String login = "/v1/login_auth";
  static String hosList = "/v2/lesson_observation/init/data";
  static String workLoad = "/v2/get/workloads/from/credentials";
  static String timeTable = "/v2/timetable/mobile";
  static String lessonObservation= "/v2/lesson_observation/init/data";


}
