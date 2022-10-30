



import 'package:gdscnews_app/domain/entities/news_entities.dart';

class NewsModel extends News{
  const NewsModel({
    required super.id,
    required super.name,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.publishedAt,
     required super.url,
  });

  factory NewsModel.fromJson(Map<String,dynamic>json)=>
  NewsModel(
   id:json["id"],
    name :json["name"],
    title :json["title"],
    description : json["description"],
    imageUrl: json["urlToImage"],
    publishedAt: json["publishedAt"],
    url:json["url"],
      );
}