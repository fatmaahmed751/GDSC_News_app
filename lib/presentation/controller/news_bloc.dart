import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdscnews_app/core/utils/enums.dart';
import 'package:gdscnews_app/domain/use_cases/get_news_by_id_usecase.dart';
import 'package:gdscnews_app/domain/use_cases/get_politics_news.dart';
import 'package:gdscnews_app/domain/use_cases/get_science_news.dart';
import 'package:gdscnews_app/presentation/controller/news_events.dart';
import 'package:gdscnews_app/presentation/controller/news_states.dart';

class NewsBloc extends Bloc<NewsEvents,NewsStates>{

  final GetNewsDetailsById getNewsDetailsById;
  final GetPoliticsNews getPoliticsNews;
  final GetScienceNews getScienceNews;


  NewsBloc(this.getNewsDetailsById,this.getScienceNews,this.getPoliticsNews):super(const NewsStates()) {

    on<GetNewsByIdEvent>((event, emit)async  {
    final result=await getNewsDetailsById.execute();
    //emit(const NewsStates(allNewsState: RequestState.loaded));
    result.fold((l) =>
        emit(NewsStates(allNewsState: RequestState.error,
            allNewsMessage: l.message)),
            (r) =>emit(NewsStates(allNews:r,allNewsState: RequestState.loaded)));
    print(result);
    });

    on<GetPoliticsNewsEvent>((event, emit)async  {
      final politics=await getPoliticsNews.execute();
     // emit(const NewsStates(allNewsState: RequestState.loaded));
      politics.fold((l) =>
          emit(NewsStates(politicState: RequestState.error,
              allNewsMessage: l.message)),
              (r) =>emit(NewsStates(politicNews:r,politicState: RequestState.loaded)));
           print(state);

    });

  on<GetScienceNewsEvent>((event, emit)async  {
  final politics=await getScienceNews.execute();
  // emit(const NewsStates(allNewsState: RequestState.loaded));
  politics.fold((l) =>
  emit(NewsStates(politicState: RequestState.error,
  allNewsMessage: l.message)),
  (r) =>emit(NewsStates(politicNews:r,politicState: RequestState.loaded)));
  print(state);

});
}


}