
import 'dart:convert';

import '../Utils/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static final ApiServices _instance = ApiServices._internal();

  ApiServices._internal();

  factory ApiServices() {
    return _instance;
  }

  static Future<Map<String, dynamic>> userLogin({
    required String userName,
    required String psw,
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.login}";
    print(url);
    Map apiBody = {
      "username": userName,
      "password": psw,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return json.decode(respString);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> getHosList({
    required String userId,
    required String acYr,
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.hosList}";
    print(url);
    Map apiBody = {
      "user_id": userId,
      "academic_year": acYr,
      "hos": false
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return json.decode(respString);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> getWorkLoadApi({
    required String userId,
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.workLoad}";
    print(url);
    Map apiBody = {"user_id": userId};
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return json.decode(respString);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  //brineshleadership

  static Future<Map<String, dynamic>> getLeadership({
    required String userId,
    required String academicYear,
    required bool hosStatus
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.lessonObservation}";
    print(url);
    Map apiBody = {
      "user_id": userId,
      "academic_year": academicYear,
      "hos": hosStatus
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return json.decode(respString);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> getTimeTable({
    required String userId,
    required String academicYear,
    required String teacherId,
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.timeTable}";
    print(url);
    Map apiBody = {
      "school_id": userId,
      "academic_year": academicYear,
      "teacher_id": teacherId,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return json.decode(respString);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> getClassGroupList({
    required String teacherId,
  }) async {
    String url = "${ApiConstants.chat}${ApiConstants.classGroup}";
    print(url);
    Map apiBody = {
      "teacher_id": teacherId,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return json.decode(respString);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> getParentChatList({
    required String teacherId,
    required String teacherEmail,
  }) async {
    String url = "${ApiConstants.chat}${ApiConstants.parentChatList}";
    print(url);
    Map apiBody = {
      "teacher_id": teacherId,
      "email": teacherEmail,
      "offset": 0,
      "limit": 500
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return json.decode(respString);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Service Error");
    }
  }

  static Future<Map<String, dynamic>> googleSignInApi({
    required String user,
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.googleSignIn}";
    print(url);
    Map apiBody = {
      "username": user,
    };
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.body = (json.encode(apiBody));
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      var respString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return json.decode(respString);
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception("Service Error");
    }
  }
}