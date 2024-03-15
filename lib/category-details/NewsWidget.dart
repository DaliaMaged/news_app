import 'package:flutter/material.dart';
import 'package:news_app/api/api-manager.dart';
import 'package:news_app/category-details/FullDetailArticleScreen.dart';
import 'package:news_app/category-details/NewsDetailsScreen.dart';
import 'package:news_app/models/NewsBySource.dart';

import '../AppTheme.dart';
import 'NewDetailsWidget.dart';

class NewsWidget extends StatefulWidget {
  String sourceId;
  NewsWidget(this.sourceId);
  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsBySource?>(future: ApiManager.getNewsBySourceId(sourceId: widget.sourceId), builder:
    (context,snapShot){
      if(snapShot.connectionState==ConnectionState.waiting){
        return CircularProgressIndicator(
          color: NewsTheme.primaryColor,
        );
      }else if(
      snapShot.hasError
      ){
        return Column(
          children: [
            Text("someting went wrong"),
            ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySourceId(sourceId: widget.sourceId);
                },
                child: Text("Try again"))
          ],
        );
      }else if(snapShot.data?.status!="ok"){
        return Column(
          children: [
            Text("someting went wrong"),
            ElevatedButton(
                onPressed: () {
                  ApiManager.getNewsBySourceId(sourceId: widget.sourceId);
                },
                child: Text("Try again"))
          ],
        );
      }else {
        return Expanded(
          child: ListView.builder(itemBuilder: (context,index){
            return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, FullDetailArticleScreen.fullDetailArticleScreen,
                  arguments: snapShot.data!.articles![index]
                  );
                },
                child: NewDetailsWidget(articles: snapShot.data!.articles![index]));
          },
          itemCount:snapShot.data?.articles?.length ,
          ),
        );
      }
    }
    );
  }
}