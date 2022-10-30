import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget{
  final String url;
  const WebViewScreen(this.url, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar:AppBar(
      backgroundColor: Colors.white,
   elevation: 0.0,
    leading: IconButton(
     icon:const Icon(Icons.arrow_back_ios,color: Colors.black,), onPressed: () {
       Navigator.pop(context);
    },),
),
      body: WebView(
        initialUrl: url,
      ),

    );
  }
}
