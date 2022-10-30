import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdscnews_app/presentation/controller/news_bloc.dart';
import 'package:gdscnews_app/presentation/controller/news_states.dart';


class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items:
              [

              ],
              options: CarouselOptions(
                // height: 170,
                  initialPage: 0,
                  reverse: false,
                  scrollDirection: Axis.horizontal),
            ),
            const Text(
              'Latest News',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
           // latestNews(),
            const SizedBox(height: 10.0,),
            //latestNews(),
            const SizedBox(height: 10.0,),
            //latestNews(),

            const Divider(
              height: 1.0,
              color: Colors.black54,
              thickness: 1.0,
            ),


          ],
        );
      },
    );
  }
}
