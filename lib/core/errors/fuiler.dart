import 'package:dio/dio.dart';

abstract class Fuiler {
  final String errMassege;

  Fuiler({required this.errMassege});
}

class serverFuiler extends Fuiler {
  serverFuiler({required super.errMassege});

  factory serverFuiler.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return serverFuiler(errMassege: 'Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return serverFuiler(errMassege: 'Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return serverFuiler(errMassege: 'Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        // هذا هو أهم جزء، حيث يتم تحليل استجابة الخطأ
        return serverFuiler.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return serverFuiler(errMassege: 'Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') ?? false) {
          return serverFuiler(errMassege: 'No Internet Connection');
        }
        return serverFuiler(errMassege: 'Unexpected Error, Please try again!');
      default:
        return serverFuiler(
          errMassege: 'Oops there was an error, Please try again',
        );
    }
  }

  factory serverFuiler.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // هنا نقوم باستخراج رسالة الخطأ من داخل كائن 'error' الذي يرسله Stripe
      // ونوفر رسالة افتراضية إذا لم نجدها
      return serverFuiler(
        errMassege:
            response['error']['message'] ??
            'There was an error, please try again.',
      );
    } else if (statusCode == 404) {
      return serverFuiler(
        errMassege: 'Your request not found, Please try later!',
      );
    } else if (statusCode == 500) {
      return serverFuiler(
        errMassege: 'Internal Server error, Please try later',
      );
    } else {
      return serverFuiler(
        errMassege: 'Oops there was an error, Please try again',
      );
    }
  }
}
