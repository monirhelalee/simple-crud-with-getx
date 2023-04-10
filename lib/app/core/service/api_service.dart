import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServiceHandler {
  static late Dio _dio;
  static final ApiServiceHandler _singleton = ApiServiceHandler._internal();
  ApiServiceHandler._internal();
  factory ApiServiceHandler() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://secure-falls-43052.herokuapp.com/api/",
      receiveTimeout: Duration(seconds: 60), //60 sec
      connectTimeout: Duration(seconds: 60),
    ); //60 sec
    _dio = Dio(options);
    return _singleton;
  }

  static Future get(
    String endpoint, {
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    String? token = "{{token}}";

    _dio
        .get(endpoint,
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json'
              },
            ))
        .then((res) {
      if (onSuccess != null) {
        log("success url is = $endpoint");

        onSuccess(res.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
        log(("error url is = $endpoint \n error response data $error"));
      }
    });
  }

  static Future post(
    String endpoint,
    Map<String, dynamic> params, {
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    String? token = "{{token}}";
    debugPrint("end point $endpoint");
    _dio
        .post(endpoint,
            data: params,
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json'
              },
            ))
        .then((res) {
      if (onSuccess != null) {
        onSuccess(res.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
        log(("error url is = $endpoint \n error response data ${error.response!.data['message']}"));
      }
    });
  }

  static Future patch(
    String endpoint,
    Map<String, dynamic> params, {
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    String? token = "{{token}}";
    _dio
        .patch(endpoint,
            data: params,
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json'
              },
            ))
        .then((res) {
      if (onSuccess != null) {
        onSuccess(res.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
        log(("error url is = $endpoint \n error response data ${error.response!.data['message']}"));
      }
    });
  }

  static Future delete(
    String endpoint,
    Map<String, dynamic> params, {
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    String? token = "{{token}}";
    _dio
        .delete(endpoint,
            data: params,
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json'
              },
            ))
        .then((res) {
      if (onSuccess != null) {
        onSuccess(res.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
        log(("error url is = $endpoint \n error response data ${error.response!.data['message']}"));
      }
    });
  }

  static String processError(dynamic error) {
    String messgae = "Something went wrong, try again.";

    if (error is DioError && error.response != null) {
      messgae = error.response!.data['message'];
    }
    return messgae;
  }

  static String exceptionHandler(DioError dioError) {
    String errorDescription = "";

    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      // case DioErrorType.connectTimeout:
      //   errorDescription = "Connection timeout with API server";
      //   break;
      // case DioErrorType.other:
      //   errorDescription =
      //       "Connection to API server failed due to internet connection";
      //   break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      // case DioErrorType.response:
      //   errorDescription =
      //       "Received invalid status code: ${dioError.response!.statusCode}";
      //   break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      default:
        errorDescription = "Something went wrong, try again.";
        break;
    }

    return errorDescription;
  }
}
