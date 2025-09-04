import 'package:dio/dio.dart';

class ApiServies {
  final Dio dio = Dio();

  Future<Response> post({
    required body,
    required String url,
    required String token,
    Map<String, String>? headers,
    String? contentTyep,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {"Authorization": "Bearer $token", ...?headers},
      ),
    );

    return response;
  }
}
