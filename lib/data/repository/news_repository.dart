import 'package:dartz/dartz.dart';
import 'package:gdscnews_app/core/error/exceptions.dart';
import 'package:gdscnews_app/core/error/failure.dart';
import 'package:gdscnews_app/data/data_source/remote_data_source.dart';
import 'package:gdscnews_app/data/models/news_model.dart';
import 'package:gdscnews_app/domain/base_repository/base_news_app_repository.dart';

class NewsRepository extends BaseNewsRepository {

  final BaseRemoteDataSource baseRemoteDataSource;

  NewsRepository(this.baseRemoteDataSource);

  @override
  Future <Either<Failure, List<NewsModel>>> getNewsDataById() async {
    final result = await baseRemoteDataSource.getNewsDataById();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> getPoliticsNews() async {
    final result = await baseRemoteDataSource.getPoliticsData();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<NewsModel>>> getScienceNews() async {
    final result = await baseRemoteDataSource.getScienceData();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
