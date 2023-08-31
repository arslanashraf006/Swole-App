import 'package:dio/dio.dart';

import '../../../constants/app_strings.dart';
import '../../../ui/utils/toasts/toast.dart';

class DioExceptions implements Exception {
  late String message;
  DioExceptions.fromDioException(DioError dioErr) {
    switch (dioErr.type) {
      case DioErrorType.cancel:
        message = AppStrings.textCanceledRequest;
        showToast(message);
        break;
      case DioErrorType.connectTimeout:
        message = AppStrings.textRequestTimeOut;
        showToast(message);
        break;
      case DioErrorType.receiveTimeout:
        message = AppStrings.textReceivingTimeOut;
        showToast(message);
        break;
      case DioErrorType.sendTimeout:
        message = AppStrings.textSendingTimeOut;
        showToast(message);
        break;
      case DioErrorType.other:
        if (dioErr.message.contains(AppStrings.socketText)) {
          message = AppStrings.textCheckNetwork;
          showToast(message);
        } else {
          message = AppStrings.textSendingTimeOut;
          showToast(message);
        }
        break;
      case DioErrorType.response:
        message = _handleError(
          dioErr.response!.statusCode,
          dioErr.message,
        );
        showToast(message.toString());

        break;

      default:
        message = AppStrings.textUndefinedError;
        showToast(message);
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return AppStrings.textInvalidData;
      case 401:
        return AppStrings.textUnauthorized;
      case 403:
        return AppStrings.textErrorForbidden;
      case 404:
        return error[AppStrings.messageText];
      case 500:
        return AppStrings.textErrorInternalServer;
      case 502:
        return AppStrings.textErrorBadRequest;
      default:
        return AppStrings.textSomethingWentWrong;
    }
  }

  void showToast(String msg) {
    ToastUtils.show(
      msg,
      ToastType.error,
    );
  }
}