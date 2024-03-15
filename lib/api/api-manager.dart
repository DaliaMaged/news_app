import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/Api%20Constants.dart';
import 'package:news_app/models/NewsBySource.dart';
import 'package:news_app/models/SourcesResponse.dart';
class ApiManager{
static Future<SourcesResponse?> getSources(String category) async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourcesApi,{
      "apiKey" : ApiConstants.api_key,
      "category":category
    });
    try{
    var responseString = await http.get(url);
    var responseJson = jsonDecode(responseString.body);
   // print(responseJson);
    return SourcesResponse.fromJson(responseJson);
  } catch (e){
     throw e;
  }
}
static Future<NewsBySource?> getNewsBySourceId({required String sourceId}) async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.topicsApi,{
      "apiKey" : ApiConstants.api_key,
      "sources" : sourceId
    });
    try{
    var responseString = await http.get(url);
    var responseJson = jsonDecode(responseString.body);
   // print(responseJson);
    return NewsBySource.fromJson(responseJson);
  } catch (e){
     throw e;
  }
}
static Future<NewsBySource?> getNewsBySourceIdInSearch({required String q}) async{

    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.topicsApi,{
      "q" : q,
      "apiKey" : ApiConstants.api_key,
     // "sources" : sourceId,
    });
    print("$url");
    try{
    var responseString = await http.get(url);
    var responseJson = jsonDecode(responseString.body);
    print(responseJson);
    return NewsBySource.fromJson(responseJson);
  } catch (e){
     throw e;
  }
}
}