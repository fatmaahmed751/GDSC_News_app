import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdscnews_app/core/services/services_locator.dart';
import 'package:gdscnews_app/presentation/controller/news_events.dart';
import 'presentation/controller/news_bloc.dart';
import 'presentation/screens/news_home_screen.dart';

void main() {
  ServiceLocator().init();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) =>
        NewsBloc(sl(),sl(),sl())..add(GetNewsByIdEvent())..add(GetPoliticsNewsEvent())..add(GetScienceNewsEvent()),
        )],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NewsLayout(),
      ),
    );
  }
}
