import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopping_app/config/constants.dart';

class HomeApiProvider {
  HomeApiProvider(this.dio);

  Dio dio;

  dynamic callHomeData(lat, lon) async {

    final response = await dio.get(
      "${Constants.baseUrl}/mainData",
      queryParameters: {
        "lat" : lat,
        "long" : lon,
      },
    );

    // final response = await dio.get(
    //   "${Constants.baseUrl}/mainData",
    //   queryParameters: {
    //     "lat" : lat,
    //     "long" : lon,
    //   }
    // ).onError((DioError error, stackTrace){
    //   return CheckExceptions.response(error.response!);
    // });

    log(response.toString());

    return response;
  }

}