import 'package:flutter/material.dart';

Widget buildNewsItem()=>

      Container(
        height: 60,
        padding: EdgeInsets.only(left:4.0),
        child: Row(
          children:  [
            Image(
              height:90,
              width: 90,
              image: NetworkImage('https://cdn.vox-cdn.com/thumbor/lh2YBh8cWvn3ARrenXxjolBte4o=/0x0:2040x1360/1200x628/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/23932655/acastro_STK106__01.jpg'),),
            SizedBox(width: 6.0,),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Animals can fly and play',
                  maxLines: 2,
                  overflow:TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0),
                ),
                SizedBox(height:6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('10 minutes ago',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 10.0
                      ),
                    ),
                    SizedBox(width: 90.0),
                    Icon(
                      Icons.article_outlined,color: Colors.deepOrange,size: 15.0,),

                  ],
                ),
              ],
            ),
          ],
        ),
      );



