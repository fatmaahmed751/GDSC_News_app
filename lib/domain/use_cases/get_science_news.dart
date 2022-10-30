import 'package:dartz/dartz.dart';
import 'package:gdscnews_app/core/error/failure.dart';
import 'package:gdscnews_app/domain/base_repository/base_news_app_repository.dart';
import 'package:gdscnews_app/domain/entities/news_entities.dart';

class GetScienceNews{
  final BaseNewsRepository baseNewsRepository;

  GetScienceNews(this.baseNewsRepository);

  Future <Either<Failure,List<News>>> execute()async{
    return await baseNewsRepository.getScienceNews();
  }
}