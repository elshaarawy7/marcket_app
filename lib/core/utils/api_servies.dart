import 'package:dio/dio.dart';

class ApiServies {

  final Dio dio = Dio();

  Future<Response> post({required body , required String url , required String token ,  String ? contentTyep}) async{

    var response = await dio.post(
      url , data: body , 
      options: Options(
        contentType: contentTyep , 
        headers: {
          "Authorization" : "Bearer$token"
        } , 

      ) 
      
    ); 

    return response ;
  }
}