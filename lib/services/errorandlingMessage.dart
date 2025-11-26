import 'package:dio/dio.dart';

String errorHandlingMessage(DioException e) {
  String errorMessage;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      errorMessage = "انتهت مهلة الاتصال بالخادم. تحقق من شبكتك.";
      break;
    case DioExceptionType.receiveTimeout:
      errorMessage = "انتهت مهلة استقبال البيانات من الخادم.";
      break;

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;

      if (statusCode == 404) {
        errorMessage = "المورد المطلوب غير موجود (404).";
      } else if (statusCode == 401) {
        errorMessage = "غير مصرح لك (401): يرجى تسجيل الدخول.";
      } else {
        errorMessage = "خطأ من الخادم (Status: $statusCode).";
      }
      break;

case DioExceptionType.cancel:
      errorMessage = "تم إلغاء الطلب من قبل المستخدم أو التطبيق.";
      break;
    case DioExceptionType.unknown:
      errorMessage = "فشل الاتصال بالإنترنت. يرجى التحقق من اتصالك.";
      break;

    default:
      errorMessage = "حدث خطأ غير متوقع.";
      break;
  }

  return errorMessage;
}
