
import 'package:equatable/equatable.dart';

class News extends Equatable{
  final int? id;
  final String? name;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? publishedAt;
  final String url;

 const News( {
      required  this.id,
      required this.title,
     required this.description,
     required this.imageUrl,
     required this.publishedAt,
     required this.name,
 required  this.url,
   });

  @override
  List<Object?> get props => [id,title,description,imageUrl,publishedAt,name,url];
}