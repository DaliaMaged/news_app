import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/NewsBySource.dart';
import 'package:url_launcher/url_launcher.dart';
import '../AppTheme.dart';

class FullDetailArticleScreen extends StatefulWidget {
  static String fullDetailArticleScreen = "FullDetailArticleScreen";

  @override
  State<FullDetailArticleScreen> createState() =>
      _FullDetailArticleScreenState();
}

class _FullDetailArticleScreenState extends State<FullDetailArticleScreen> {
  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)!.settings.arguments as Articles;

    return Stack(children: [
      Container(
          color: Colors.white,
          child: Image.asset(
            "assets/imgs/background.png",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          )),
      Scaffold(
        appBar: AppBar(
          title: Text("News App"),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    imageUrl: '${articles.urlToImage}',
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: NewsTheme.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "${articles.title}",
                  style: TextStyle(
                      color: NewsTheme.lighterGreyColor,
                      fontWeight: FontWeight.bold),
                ),
                // SizedBox(
                //   height: 12,
                // ),
                // Text(
                //   "${articles.content}",
                //   style: TextStyle(color: NewsTheme.darkGreyColor),
                // ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "${DateFormat('dd MMMM yyyy HH:mm').format(DateTime.parse(articles.publishedAt!).toLocal())}",
                  style: TextStyle(
                      color: NewsTheme.lighterGreyColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      color: NewsTheme.whiteColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "${articles.content}",
                    style: TextStyle(
                        color: NewsTheme.lighterGreyColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: ()  {
                    _launchUrl(articles.url.toString());
                  },
                  child: Text(
                    "View Article",
                    style: TextStyle(
                        color: NewsTheme.darkGreyColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  _launchUrl(String urlParsed) async {
    print("$urlParsed");
     Uri url = Uri.parse("$urlParsed");
    //try {
      await launchUrl(url);
    // }catch(e){
    // throw Exception('$e');
    // }
  }
}
