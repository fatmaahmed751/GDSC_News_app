import 'package:equatable/equatable.dart';
import 'package:gdscnews_app/core/utils/enums.dart';
import 'package:gdscnews_app/domain/entities/news_entities.dart';

class NewsStates extends Equatable {
  final List<News> allNews;
  final RequestState allNewsState;
  final String allNewsMessage;

  final String politicNewsMessage;
  final List<News> politicNews;
  final RequestState politicState;

  final String businessNewsMessage;
  final List<News> businessNews;
  final RequestState businessState;

  final String scienceMessage;
  final List<News> scienceNews;
  final RequestState scienceState;

  final String techMessage;
  final List<News> techNews;
  final RequestState techState;

  const NewsStates({
    this.allNews = const [],
    this.allNewsState = RequestState.loading,
    this.allNewsMessage = "",
    this.politicNews = const [],
    this.politicState = RequestState.loading,
    this.politicNewsMessage = "",
    this.businessNews = const [],
    this.businessState = RequestState.loading,
    this.businessNewsMessage = "",
    this.scienceNews = const [],
    this.scienceState = RequestState.loading,
    this.scienceMessage = "",
    this.techNews = const [],
    this.techState = RequestState.loading,
    this.techMessage = "",
  });

  @override
  List<Object> get props =>
      [
        allNews,
        allNewsState,
        allNewsMessage,
        politicNewsMessage,
        politicNews,
        politicState,
        businessNewsMessage,
        businessNews,
        businessState,
        scienceMessage,
        scienceNews,
        scienceState,
        techMessage,
        techNews,
        techState,
      ];

}

class NewsBottomNavState extends NewsStates {}

