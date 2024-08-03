
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:teacherapp/Models/api_models/leave_req_list_api_model.dart';

import '../Models/api_models/chat_feed_view_model.dart';
import '../Models/api_models/parent_chatting_model.dart';
import '../Models/api_models/sent_msg_by_teacher_model.dart';
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








  static Future<Map<String, dynamic>> getTimeTableData({
    required String schoolId,
    required String academicYear,
    required String teacherId
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.timeTable}";
    print(url);
    Map apiBody = {
      "school_id": schoolId,
      "academic_year": academicYear,
      "teacher_id": teacherId
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
















  static Future<Map<String, dynamic>> getNotification({
    required String userId,

  }) async {
    String url = '${ApiConstants.baseUrl}${ApiConstants.notification}$userId${ApiConstants.notificationEnd}';
    print(url);
    Map apiBody = {
      "user_id": userId,

    };
    try {
      var request = http.Request('GET', Uri.parse(url));
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






















  static Future<Map<String, dynamic>> getMarkasReadNotification({
    required String userId,
    required String notificationId,
  }) async {
    String url = '${ApiConstants.baseUrl}${ApiConstants.updatenotification}';
    print(url);
    Map apiBody = {
      "user_id": userId,
      "notification_id": notificationId
    };
    try {
      var request = http.Request('PUT', Uri.parse(url));
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

  static Future<Map<String, dynamic>> sentMsgByTeacher({
    required SentMsgByTeacherModel teacherMsg,
  }) async {
    String url = "${ApiConstants.chat}${ApiConstants.sentMsgByTeacher}";
    print(url);
    Map apiBody = teacherMsg.toJson();
    // Map apiBody = {
    //   "class": teacherMsg.classs,
    //   "batch": teacherMsg.batch,
    //   "subject_id": teacherMsg.subjectId,
    //   "subject": teacherMsg.subject,
    //   "message_from": teacherMsg.messageFrom,
    //   "message": teacherMsg.message,
    //   "reply_id" : teacherMsg.replyId,
    //   "parents": teacherMsg.parents,
    //   "file_data": {
    //     "name": teacherMsg.fileData?.name,
    //     "org_name": teacherMsg.fileData?.orgName,
    //     "extension": teacherMsg.fileData?.extension,
    //   }
    // };
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

  static Future<Map<String, dynamic>> getChatFeedView({
    required ChatFeedViewReqModel reqBodyData,
  }) async {
    String url = "${ApiConstants.chat}${ApiConstants.teacherMsgList}";
    print(url);
    Map apiBody = {
      "class": reqBodyData.classs,
      "batch": reqBodyData.batch,
      "subject_id": reqBodyData.subjectId,
      "teacher_id": reqBodyData.teacherId,
      "school_id": reqBodyData.schoolId,
      "offset": reqBodyData.offset,
      "limit": reqBodyData.limit,
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

  static Future<dynamic> sendAttachment({
    required String filePath,
  }) async {
    String url = ApiConstants.chat + ApiConstants.fileUpload;
    print("--url--$url");
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var file = await http.MultipartFile.fromPath('file', filePath);
      request.files.add(file);
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      String respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> deleteSenderMsg({
    required int msgId,
    required String teacherId,
  }) async {
    String url = ApiConstants.chat + ApiConstants.deleteMsg;
    print("--url--$url");
    try {
      Map<String, dynamic> apiBody = {
        "message_id": msgId,
        "teacher_id": teacherId
      };

      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode(apiBody);
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      String respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> getParentList({
    required String classs,
    required String batch,
    required String subId,
    required String schoolId,
  }) async {
    String url = ApiConstants.chat + ApiConstants.parentList;
    print("--url--$url");
    try {
      Map<String, dynamic> apiBody = {
        "class": classs,
        "batch": batch,
        "subject_id": subId,
        "school_id": schoolId,
      };

      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode(apiBody);
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      String respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> getGroupedViewList({
    required String classs,
    required String batch,
    required String subId,
    required String schoolId,
    required String teacherId,
  }) async {
    String url = ApiConstants.chat + ApiConstants.groupedView;
    print("--url--$url");
    try {
      Map<String, dynamic> apiBody = {
        "teacher_id": teacherId,
        "class": classs,
        "batch": batch,
        "school_id": schoolId,
        "offset": 0,
        "limit": 100
      };

      var request = http.Request('POST', Uri.parse(url));
      request.body = json.encode(apiBody);
      print('Api body---------------------->${request.body}');
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      String respString = await response.stream.bytesToString();
      return json.decode(respString);
    } catch (e) {
      print(e);
    }
  }

  static Future<Map<String, dynamic>> getParentChatting({
    required ParentChattingReqModel reqBodyData,
  }) async {
    String url = "${ApiConstants.chat}${ApiConstants.parentChatMessages}";
    print(url);
    Map apiBody = {
      "class": reqBodyData.classs,
      "batch": reqBodyData.batch,
      "parent_id": reqBodyData.parentId,
      "teacher_id": reqBodyData.teacherId,
      "school_id": reqBodyData.schoolId,
      "offset": reqBodyData.offset,
      "limit": reqBodyData.limit,
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

  static Future<Map<String, dynamic>> getLeaveReqList({
    required String schoolId,
    required String accYr,
    required String userId,
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.leaveReqList}";
    print(url);
    Map apiBody = {
      "school_id": schoolId,
      "academic_year": accYr,
      "user_id": userId,
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

  static Future<Map<String, dynamic>> getLeaveApproval({
    required String schoolId,
    required String accYr,
    required String userId,
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.leaveApprovalList}";
    print(url);
    Map apiBody = {
      "school_id": schoolId,
      "academic_year": accYr,
      "user_id": userId,
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

  static Future<dynamic> leaveFileUpload({
    required String userId,
    required String filePath,
  }) async {
    String url = ApiConstants.downloadUrl + ApiConstants.leaveFileUpload;
    print("--url--$url");
    try {
      String fileName = filePath.split('/').last;
      String mimeType = lookupMimeType(filePath) ?? 'application/octet-stream';
      MediaType mediaType = MediaType.parse(mimeType);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var file = await http.MultipartFile.fromPath(
          'file',
          filePath,
        filename: fileName,
        contentType: mediaType,
      );
      request.files.add(file);
      request.fields['userPath'] = '$userId/leaveDocs/';
      request.headers.addAll(ApiConstants.headers);
      http.StreamedResponse response = await request.send();
      String respString = await response.stream.bytesToString();
      // print("Raw Response: $respString");
      return respString;
    } catch (e) {
      print(e);
    }
  }

  static Future<Map<String, dynamic>> leaveReqSubmit({
    required LeaveRequestModel reqData,
  }) async {
    String url = "${ApiConstants.baseUrl}${ApiConstants.requestLeave}";
    print(url);
    Map apiBody = reqData.toJson();
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