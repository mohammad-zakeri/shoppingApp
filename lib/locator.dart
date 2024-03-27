import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/utils/prefs_operator.dart';
import 'feature_home/data/data_source/home_api_provider.dart';
import 'feature_home/repositories/home_repository.dart';
import 'feature_product/data/data_source/category_api_provider.dart';
import 'feature_product/data/data_source/product_api_provider.dart';
import 'feature_product/repositories/all_product_repository.dart';
import 'feature_product/repositories/category_repository.dart';

GetIt locator = GetIt.instance;

Future<void> initLocator() async{

  locator.registerSingleton<Dio>(Dio());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());

  /// api provider
  locator.registerSingleton<HomeApiProvider>(HomeApiProvider(locator()));
  locator.registerSingleton<CategoryApiProvider>(CategoryApiProvider(locator()));
  locator.registerSingleton<ProductsApiProvider>(ProductsApiProvider(locator()));
  // locator.registerSingleton<AuthApiProvider>(AuthApiProvider(locator<Dio>()));

  /// repository
  locator.registerSingleton<HomeRepository>(HomeRepository(locator()));
  locator.registerSingleton<CategoryRepository>(CategoryRepository(locator()));
  locator.registerSingleton<AllProductsRepository>(AllProductsRepository(locator()));
  // locator.registerSingleton<AuthRepository>(AuthRepository(locator<AuthApiProvider>()));

  /// bloc
  // locator.registerSingleton<SignupBloc>(SignupBloc(locator<AuthRepository>()));
  // locator.registerSingleton<LoginBloc>(LoginBloc(locator<AuthRepository>()));

}