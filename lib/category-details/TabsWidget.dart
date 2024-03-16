import 'package:flutter/material.dart';
import 'package:news_app/category-details/NewsWidget.dart';
import 'package:news_app/models/SourcesResponse.dart';

import 'TabItem.dart';

class TabsWidget extends StatefulWidget {
  List<Sources> sourcesList = [];
  TabsWidget(this.sourcesList);
  var currentSelected = 0;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {

@override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      //child: Expanded(
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              widget.currentSelected = index;
              setState(() {});
            },
            tabs: widget.sourcesList
                .map((source) => TabItem(
                isSelected : widget.currentSelected == widget.sourcesList.indexOf(source), sources: source))
                .toList(),
            isScrollable: true,
            indicatorColor: Colors.transparent,

          ),
          Expanded(child: NewsWidget(widget.sourcesList[widget.currentSelected].id ?? ""))
        ],
      ),
      // )
    );
  }
}
