import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shopping_app/common/error_handling/check_exceptions.dart';
import 'package:shopping_app/config/constants.dart';

class CategoryApiProvider {
  Dio dio;
  CategoryApiProvider(this.dio);

  dynamic callCategories() async{

    try{
      final response = await dio.get("${Constants.baseUrl}/categories/tree");
      log(response.toString());
      return response;
    }on DioError catch(e){
      return CheckExceptions.response(e.response!);
    }

  }

}