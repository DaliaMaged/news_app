import 'package:flutter/material.dart';
import 'package:news_app/AppTheme.dart';
import 'package:news_app/models/SourcesResponse.dart';

class TabItem extends StatefulWidget {
  bool isSelected;
  Sources sources;
  TabItem({required this.isSelected,required this.sources});

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 2,color:  NewsTheme.primaryColor ),
          color:  widget.isSelected ? NewsTheme.primaryColor : NewsTheme.whiteColor
        ),
        child: Text("${widget.sources.name}",style: TextStyle(
          color: widget.isSelected ? NewsTheme.whiteColor : NewsTheme.primaryColor
        ),),
    );
  }
}
