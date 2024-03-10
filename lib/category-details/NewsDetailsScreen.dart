import 'package:flutter/material.dart';
import 'package:news_app/AppTheme.dart';
import 'package:news_app/categories/CategoryModel.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/category-details/TabItem.dart';
import 'package:news_app/category-details/TabsWidget.dart';
import 'package:news_app/api/api-manager.dart';

class NewsDetailsScreen extends StatefulWidget {
  CategoryModel categoryModel;
  NewsDetailsScreen({required this.categoryModel});
  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse?>(
        future: ApiManager.getSources(widget.categoryModel.title),
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
                      ApiManager.getSources(widget.categoryModel.id);
                    },
                    child: Text("Try again"))
              ],
            );
          } else if (snapShot.data?.status != "ok") {
            return Column(
              children: [
                Text("${snapShot.data?.message}"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.categoryModel.id);
                    },
                    child: Text("Try again"))
              ],
            );
          } else {
            var list = snapShot.data?.sources ?? [];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: TabsWidget(list),
            );
          }
        });
  }
}
