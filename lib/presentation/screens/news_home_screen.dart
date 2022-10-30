import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdscnews_app/presentation/controller/news_bloc.dart';
import 'package:gdscnews_app/presentation/controller/news_states.dart';
import 'package:gdscnews_app/presentation/screens/all_news_screen.dart';
import 'package:gdscnews_app/presentation/screens/business_screen.dart';
import 'package:gdscnews_app/presentation/screens/politic_screen.dart';
import 'package:gdscnews_app/presentation/screens/science_screen.dart';
import 'package:gdscnews_app/presentation/screens/search_screen.dart';
import 'package:gdscnews_app/presentation/screens/settings_screen.dart';
import 'package:gdscnews_app/presentation/screens/tech_screen.dart';

import 'archieved_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
    builder: (context, state) {
      return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          backgroundColor: Colors.white,
          title: Container(
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: const Text('OUX.aZ',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          elevation: 0.0,
          bottom:  const TabBar(
            //controller:NewsBloc().controller,
              indicator: BoxDecoration(
                color: Colors.white,
              ),
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(icon: Text('All news',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),),),
                Tab(icon: Text('Business',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),),),
                Tab(icon: Text('Politics',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),),),
                Tab(icon: Text('Tech',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),),),
                Tab(icon: Text('Science',
                  style: TextStyle(
                    fontSize: 13.0,
                  ),),),
              ]),

        ),

        body:
        TabBarView(
           //controller:NewsBloc().controller,
          children: [
           const AllNews(),
            BusinessScreen(),
            PoliticScreen(),
            TechScreen(),
            ScienceScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black87,
          items: [
            BottomNavigationBarItem(icon: IconButton(
              icon: const Icon(Icons.home, size: 17.0,), onPressed: () {
            /*  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AllNews(),));*/
            },), label: 'Home',),
            BottomNavigationBarItem(icon: IconButton(
              icon: const Icon(Icons.search, size: 17.0,), onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen(),));
            },), label: 'search'),
            BottomNavigationBarItem(icon: IconButton(
              icon: const Icon(Icons.article_outlined, size: 17.0,),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ArchievedScreen()));
              },), label: 'archived'),
            BottomNavigationBarItem(icon: IconButton(
              icon: const Icon(Icons.settings, size: 17.0,), onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },), label: 'settings'),

          ],
      //   currentIndex: NewsBloc().currentIndex,
        ),

      ),
    );
  },
);
  }
}
