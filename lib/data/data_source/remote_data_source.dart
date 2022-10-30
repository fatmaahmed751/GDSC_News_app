
import 'package:dio/dio.dart';
import 'package:gdscnews_app/core/error/exceptions.dart';
import 'package:gdscnews_app/core/network/error_message_model.dart';
import 'package:gdscnews_app/data/models/news_model.dart';


abstract class BaseRemoteDataSource{
  Future<List<NewsModel>>getNewsDataById();
  Future<List<NewsModel>>getPoliticsData();
  Future<List<NewsModel>>getScienceData();
 }

 class RemoteDataSource implements BaseRemoteDataSource {
   @override
   Future<List<NewsModel>> getNewsDataById() async {
     final response = await Dio().get(
         "https://newsapi.org/v2/top-headlines?country=us&apiKey=77ef2ede7d4c4255a48ef0c8ce9d93a7"
       /* "${AppConstants.baseUrl}/top-headlines?country=us&${AppConstants.apiKey}"*/);
    // print(response.data);
     if (response.statusCode == 200) {
    //   print(response);
       return List<NewsModel>.from(
           (response.data["articles"] as List).map((e) => NewsModel.fromJson(e),
           ));
     }
     else {
       throw ServerException(
         errorMessageModel: ErrorMessageModel.fromJson(response.data),

       );
     }
   }

   @override
   Future<List<NewsModel>> getPoliticsData() async {
     final response = await Dio().get(
         "https://newsapi.org/v2/top-headlines?country=eg&category=general&apiKey=77ef2ede7d4c4255a48ef0c8ce9d93a7"
       /* "${AppConstants.baseUrl}/top-headlines?country=us&${AppConstants.apiKey}"*/);
     print(response.data);
     if (response.statusCode == 200) {
      // print(response);
       return List<NewsModel>.from(
           (response.data["articles"] as List).map((e) => NewsModel.fromJson(e),
           ));
     }
     else {
       throw ServerException(
         errorMessageModel: ErrorMessageModel.fromJson(response.data),

       );
     }
   }

  @override
  Future<List<NewsModel>> getScienceData()async {
    final response = await Dio().get(
        "https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=77ef2ede7d4c4255a48ef0c8ce9d93a7"
      /* "${AppConstants.baseUrl}/top-headlines?country=us&${AppConstants.apiKey}"*/);
    print(response.data);
    if (response.statusCode == 200) {
      // print(response);
      return List<NewsModel>.from(
          (response.data["articles"] as List).map((e) => NewsModel.fromJson(e),
          ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),

      );
    }
  }

 }
