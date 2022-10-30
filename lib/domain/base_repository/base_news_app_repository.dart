import 'package:dartz/dartz.dart';
import 'package:gdscnews_app/core/error/failure.dart';
import 'package:gdscnews_app/data/models/news_model.dart';

abstract class BaseNewsRepository{

 Future <Either<Failure,List<NewsModel>>> getNewsDataById();
 Future <Either<Failure,List<NewsModel>>> getPoliticsNews();
 Future <Either<Failure,List<NewsModel>>> getScienceNews();
}