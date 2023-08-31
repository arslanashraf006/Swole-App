import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:swole_app/core/network/api/api_model.dart';
import 'package:swole_app/core/network/app_url.dart';
import 'package:swole_app/core/shared_prefrences/shared_prefs.dart';

import '../../../constants/app_strings.dart';
import '../../../models/error_model.dart';
import '../../../service/service.dart';
import '../../../ui/utils/toasts/toast.dart';

import 'dio_exceptions.dart';

class ApiServices{

  static Future<dynamic> callPostApi({
    required String url,
    dynamic modelName,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
  }) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: AppUrl.baseUrl,
        contentType: 'application/json',
        headers: {
         'Authorization' :  AppUrl.token,
        },
      );
      Dio dio = Dio(options);
      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: header),
        queryParameters: params,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        dynamic modelObject = await ApiModels.getModelObjects(
          modelName,
          response.data,
        );
        debugPrint(response.data.toString());
        return modelObject;
      }
      return null;
    } on DioError catch (er) {
      if (er.response != null) {
        Errors errorResponse = ApiModels.getModelObjects(
          ApiModels.errorModel,
          json.decode(er.response?.data),
        );
        ToastUtils.show(errorResponse.error.toString(), ToastType.error);
        debugPrint("error :${errorResponse.error}");
        return null;
      } else {
        DioExceptions.fromDioException(er);
        debugPrint(er.toString());
        return null;
      }
    } on Exception {
      ToastUtils.show(AppStrings.textUndefinedError, ToastType.error);
      return null;
    } catch (er) {
      debugPrint(er.toString());
      return null;
    }
  }

  static Future<dynamic> callGetApi(
      {required String url,
        Map<String, dynamic>? parameters,
        Map<String, dynamic>? headers,
        dynamic modelName,
        String baseUrl = AppUrl.baseUrl,
        }) async {
    try {
      final token = await locator<SharedPreferenceHelper>().getAuthToken();
      debugPrint('token-> $token');
      final refreshToken = await locator<SharedPreferenceHelper>().getRefreshToken();
      debugPrint('Refresh token-> $refreshToken');
      BaseOptions options = BaseOptions(
          contentType: 'application/json',
          baseUrl: baseUrl,
          headers: {
            "Authorization": "Bearer $token",
          },
         );

      var dio = Dio(options);
      Response _response = await dio.get(
        url,
        options: Options(headers: headers),
        queryParameters: parameters,
      );
      debugPrint('get response: ${_response.data}');
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        dynamic modelObj =
        await ApiModels.getModelObjects(modelName, _response.data);
        return modelObj;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        Errors errorResponse =
          ApiModels.getModelObjects(ApiModels.errorModel, ex.response?.data);
          ToastUtils.show(
                errorResponse.error.toString() , ToastType.error);
          return null;
      } else {
          DioExceptions.fromDioException(ex);

      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

}