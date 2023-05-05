import 'package:dio/dio.dart';
import 'package:fireimage/constant/url.dart';

class DioHelper{
 static late Dio dio;
 static init()async{
    dio=Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true
    ));
  }

 static Future<Response> getData(int page)async{
  dio.options.headers={"Authorization":"bTCYPN40CBFIuK8Fzbib3dxThAoUoczH8o4vQPKjAmutk4dW2602wLB1"};
  var respons= await dio.get("v1/curated?page=$page&per_page=80");
  return respons;
  }

  static Future<Response> searchData(String text)async{
    var respons=await dio.get("v1/search?query=$text&per_page=80");
  print(respons.data);
  return respons;
  }
}