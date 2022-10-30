import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdscnews_app/domain/entities/news_entities.dart';
import 'package:gdscnews_app/presentation/controller/news_bloc.dart';
import 'package:gdscnews_app/presentation/controller/news_states.dart';
import 'package:gdscnews_app/presentation/screens/web_view_screen.dart';

class AllNews extends StatelessWidget {
  const AllNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
        builder: (context, state) {
          return   Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        child: ListView.separated(
                         // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                            itemBuilder:(context,index)=>newsItem(state.allNews[index],context),
                        itemCount: state.allNews.length,
                          separatorBuilder: (BuildContext context, int index)=>const SizedBox(width: 5.0,),

                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Latest News',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height:10.0,),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                          itemBuilder: (context,index)=>latestNews(state.allNews[index],context),
                          separatorBuilder: (context,index)=>const SizedBox(height: 8.0,),
                          itemCount: state.allNews.length),
                    ],
                  ),
                ),
              );




        }
    );
  }

  Widget newsItem(News allNews,context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => WebViewScreen(allNews.url)));
      },
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 300.0,
            width: 200.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)),

            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image(
                  image: NetworkImage(
                    '${allNews.imageUrl}',
                  ),
                  //fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "2 hours ago",
                        // '${allNews.title}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      const SizedBox(
                        width: 80.0,
                      ),
                      const Icon(
                        Icons.article_outlined,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

    Widget latestNews(News allNews, context) {
      return
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: 60,
          padding: const EdgeInsets.only(left: 4.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => WebViewScreen(allNews.url)));
            },
            child: Row(
              children: [
                Image(
                  height: 100,
                  width: 90,
                  image: NetworkImage(
                      '${allNews.imageUrl}'
                  ),
                ),
                const SizedBox(
                  width: 6.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${allNews.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black, fontSize: 12.0),
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${allNews.publishedAt}',
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 10.0),
                          ),
                          const SizedBox(width: 90.0),
                          const Icon(
                            Icons.article_outlined,
                            color: Colors.deepOrange,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
    }


}
