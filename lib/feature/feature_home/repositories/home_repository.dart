import 'package:dio/dio.dart';
import 'package:shopping_app/common/error_handling/app_exception.dart';
import 'package:shopping_app/common/error_handling/check_exceptions.dart';
import 'package:shopping_app/feature/feature_home/data/data_source/home_api_provider.dart';
import 'package:shopping_app/feature/feature_home/data/models/home_model.dart';
import '../../../common/resources/data_state.dart';

class HomeRepository {
  HomeRepository(this.apiProvider);

  HomeApiProvider apiProvider;

  Future<DataState<HomeModel>> fetchHomeData(lat, lon) async {

    try{
      Response response = await apiProvider.callHomeData(lat, lon);
      final HomeModel homeModel = HomeModel.fromJson(response.data);
      return DataSuccess(homeModel);
    } on AppException catch(e){
      return await CheckExceptions.getError(e);
    }

  }

}