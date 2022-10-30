import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdscnews_app/domain/entities/news_entities.dart';
import 'package:gdscnews_app/presentation/controller/news_bloc.dart';
import 'package:gdscnews_app/presentation/controller/news_states.dart';

class PoliticScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  buildNewsItem(state.politicNews[index]),
              separatorBuilder: (BuildContext context, index) =>
              const SizedBox(height: 3.0,),
              itemCount:state.politicNews.length,
          ),
        );
      },
    );
  }
}

Widget buildNewsItem(News politicNew)=>
    Container(
      color: Colors.white,
      height: 60,
      padding: const EdgeInsets.only(left:4.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:  [
             Container(
               clipBehavior: Clip.antiAliasWithSaveLayer,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.0),
                 color: Colors.white
               ),
               child: Image(

                height:90,
                width: 90,
                image: NetworkImage('${politicNew.imageUrl}'),),
             ),
            const SizedBox(width: 6.0,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 '${politicNew.title}',
                  maxLines: 2,
                  overflow:TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12.0),
                ),

                const SizedBox(height:6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${politicNew.publishedAt}',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 10.0
                      ),
                    ),
                    const SizedBox(width: 90.0),
                    const Icon(
                      Icons.article_outlined,color: Colors.deepOrange,size: 15.0,),

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );