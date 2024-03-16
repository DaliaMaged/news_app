import 'package:flutter/material.dart';
//import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:news_app/AppTheme.dart';
import 'package:news_app/models/NewsBySource.dart';

import '../api/api-manager.dart';

class CustomeSearchDelegate extends SearchDelegate<Articles>{
  // Debouncer _debouncer = Debouncer();
  // String? sourceId;
 // CustomeSearchDelegate({required sourceId});
  @override
  TextInputAction get textInputAction => super.textInputAction;

  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
     IconButton(onPressed: (){
       query = "";
     }, icon: Icon(Icons.clear,color: NewsTheme.lighterGreyColor,))
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
    // List<Articles> articlesResults = searchList
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    return FutureBuilder<NewsBySource?>(future: ApiManager.getNewsBySourceIdInSearch(q:query.toString()), builder:
        (context,snapShot){
      if(snapShot.connectionState==ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(
            color: NewsTheme.whiteColor,
          ),
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
        return Container(
          color: NewsTheme.primaryColor,
          child: Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return
                // InkWell(
                //   onTap: (){
                //     Navigator.pushNamed(context, FullDetailArticleScreen.fullDetailArticleScreen,
                //         arguments: snapShot.data!.articles![index]
                //     );
                //   },child:
              Container(
                margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: NewsTheme.whiteColor,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text("${snapShot.data!.articles![index].title}",style: TextStyle(color: NewsTheme.primaryColor),));
            },
              itemCount:snapShot.data?.articles?.length ,
            ),
          ),
        );
      }
    }
    );
  }
  //
  // void _handleTextFieldChange(String value,BuildContext context) {
  //   if (_debouncer.isActive ?? false) _debouncer.cancel();
  //   _debouncer = Timer(const Duration(milliseconds: 500), () {
  //     // Start playing song here
  //     print("Song playing");
  //   });
 // }
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: NewsTheme.primaryColor,
    );
  }
  
}