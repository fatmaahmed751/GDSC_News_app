import 'package:gdscnews_app/data/data_source/remote_data_source.dart';
import 'package:gdscnews_app/data/repository/news_repository.dart';
import 'package:gdscnews_app/domain/base_repository/base_news_app_repository.dart';
import 'package:gdscnews_app/domain/use_cases/get_news_by_id_usecase.dart';
import 'package:gdscnews_app/domain/use_cases/get_politics_news.dart';
import 'package:gdscnews_app/domain/use_cases/get_science_news.dart';
import 'package:gdscnews_app/presentation/controller/news_bloc.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;

class ServiceLocator{
  void init(){
    sl.registerFactory(() => NewsBloc(sl(),sl(),sl()));
    sl.registerLazySingleton(() =>GetNewsDetailsById (sl()));
    sl.registerLazySingleton(() =>GetPoliticsNews (sl()));
    sl.registerLazySingleton(() =>GetScienceNews (sl()));
    sl.registerLazySingleton<BaseNewsRepository>(() => NewsRepository(sl()));
    sl.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}