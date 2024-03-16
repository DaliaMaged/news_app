import 'package:flutter/material.dart';
import 'package:news_app/api/api-manager.dart';
import 'package:news_app/category-details/FullDetailArticleScreen.dart';
import 'package:news_app/models/NewsBySource.dart';

import '../AppTheme.dart';
import 'NewDetailsWidget.dart';

class NewsWidget extends StatefulWidget {
  late ScrollController scrollController;
  String sourceId;

  NewsWidget(this.sourceId);

  var page = 1;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  void initState() {
    widget.scrollController = ScrollController();
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        setState(() {
          widget.page = widget.page + 1;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsBySource?>(
        future: ApiManager.getNewsBySourceId(
            sourceId: widget.sourceId, page: widget.page),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(
              color: NewsTheme.primaryColor,
            );
          } else if (snapShot.hasError) {
            return Column(
              children: [
                Text("someting went wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(
                          sourceId: widget.sourceId, page: widget.page);
                    },
                    child: Text("Try again"))
              ],
            );
          } else if (snapShot.data?.status != "ok") {
            return Column(
              children: [
                Text("someting went wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(
                          sourceId: widget.sourceId, page: widget.page);
                    },
                    child: Text("Try again"))
              ],
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context,
                            FullDetailArticleScreen.fullDetailArticleScreen,
                            arguments: snapShot.data!.articles![index]);
                      },
                      child: NewDetailsWidget(
                          articles: snapShot.data!.articles![index]));
                },
                controller: widget.scrollController,
                itemCount: snapShot.data?.articles?.length,
              ),
            );
          }
        });
  }
}
