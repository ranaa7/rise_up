import 'dart:convert';

import 'package:dio/dio.dart';

class NetworkService {
 static late Dio dio;

  static initDio() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: "https://gorest.co.in/public/v2/users" ,
      ),
    );
  }

  static Future<Response> getUser({required String endPoint}) async {
    dio.options.headers={"Authorization":"Bearer 67a366eb7ed03292ff8db707d0f5cf33c72161f3c77247a53776c49b52031616"};
   Response response=  await dio
        .get(endPoint);
   return response;
  }

  // static Future<Response> postNewUser({required String endPoint,required Map<String,dynamic>data}) async {
  //   var jsonbody=jsonEncode(data);
  //   dio.options.headers={"Authorization":"Bearer "};
  //   Response response=await dio.post(endPoint,data: jsonbody);
  //   print(response.data["accessToken"]);
  //   return response;
  // }
  // static Future<Response> updateUserData({required String endPoint,required Map<String,dynamic>data}) async {
  //   var jsonbody=jsonEncode(data);
  //  dio.options.headers={"Authorization":"Bearer "};
  //     Response response=await dio.put(endPoint,data: jsonbody);
  //     print(response.data["accessToken"]);
  //     return response;
  // }
  // static Future<Response> deleteUser({required String endPoint,required Map<String,dynamic>data}) async {
  //   var jsonbody=jsonEncode(data);
  //   dio.options.headers={"Authorization":"Bearer "};
  //   Response response=await dio.delete(endPoint,data: jsonbody);
  //   print(response.data["accessToken"]);
  //   return response;
  // }
}