import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdscnews_app/presentation/controller/news_bloc.dart';
import 'package:gdscnews_app/presentation/controller/news_states.dart';


class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 40,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search_outlined, color: Colors.black,),
                      label: const Text('Search'),
                      fillColor: Colors.grey[100],
                      filled: true,
                      enabled: false,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}