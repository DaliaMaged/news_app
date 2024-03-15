import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:news_app/AppTheme.dart';
import 'package:news_app/models/NewsBySource.dart';

import '../api/api-manager.dart';

class CustomeSearchDelegate extends SearchDelegate<Articles>{
 // String? sourceId;
 // CustomeSearchDelegate({required sourceId});
  @override
  TextInputAction get textInputAction => super.textInputAction;

  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
     IconButton(onPressed: (){}, icon: Icon(Icons.clear,color: NewsTheme.lighterGreyColor,))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: Icon(Icons.arrow_back,color: NewsTheme.lighterGreyColor,))
    ;
  }

  @override
  Widget buildResults(BuildContext context) {
    print("buildResults");
    // List<Articles> articlesResults = searchList
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    return FutureBuilder<NewsBySource?>(future: ApiManager.getNewsBySourceIdInSearch(q:query.toString()), builder:
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
                  ApiManager.getNewsBySourceIdInSearch(q: query.toString());
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
                  ApiManager.getNewsBySourceIdInSearch(q: query.toString());
                },
                child: Text("Try again"))
          ],
        );
      }else {
        return Expanded(
          child: ListView.builder(itemBuilder: (context,index){
            return
              // InkWell(
              //   onTap: (){
              //     Navigator.pushNamed(context, FullDetailArticleScreen.fullDetailArticleScreen,
              //         arguments: snapShot.data!.articles![index]
              //     );
              //   },child:
            Text("${snapShot.data!.articles![index].title}",style: TextStyle(color: NewsTheme.darkGreyColor),);
          },
            itemCount:snapShot.data?.articles?.length ,
          ),
        );
      }
    }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: NewsTheme.whiteColor,
    );
  }
  
}