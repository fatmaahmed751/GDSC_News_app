import 'package:equatable/equatable.dart';

abstract class NewsEvents extends Equatable {
  const NewsEvents();

  @override
  List<Object> get props => [];
}

class GetNewsByIdEvent extends NewsEvents{}

class GetPoliticsNewsEvent extends NewsEvents{}

class GetLatestNewsEvent extends NewsEvents{}

class GetScienceNewsEvent extends NewsEvents{}

