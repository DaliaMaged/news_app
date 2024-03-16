import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/AppTheme.dart';

import '../models/NewsBySource.dart';

class NewDetailsWidget extends StatefulWidget {
  Articles articles;

  NewDetailsWidget({required this.articles});

  @override
  State<NewDetailsWidget> createState() => _NewDetailsWidgetState();
}

class _NewDetailsWidgetState extends State<NewDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ClipRRect(
        //   child: Image.network("${widget.articles.urlToImage}",
        //   ),
        //   borderRadius: BorderRadius.circular(20),
        // ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            width: double.infinity,
          fit: BoxFit.fitWidth,
          imageUrl: '${widget.articles.urlToImage}',
            placeholder: (context, url) => Center(
              child: Center(
                child: CircularProgressIndicator(
                  color: NewsTheme.primaryColor,
                ),
              ),
            ),
            errorWidget: (context,url,error)=> Icon(Icons.error),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "${widget.articles.title}",
          style: TextStyle(
              color: NewsTheme.lighterGreyColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "${widget.articles.content}",
          style: TextStyle(color: NewsTheme.darkGreyColor),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "${DateFormat('dd MMMM yyyy HH:mm').format(DateTime.parse(widget.articles.publishedAt!).toLocal())}",
          style: TextStyle(
              color: NewsTheme.lighterGreyColor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.end,
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
