import 'package:flutter/material.dart';
import 'package:news_app/AppTheme.dart';

import 'CategoryModel.dart';

class CategoryWidget extends StatefulWidget {
  List<CategoryModel> categories;
  int index;
  CategoryWidget({required this.categories,required this.index});
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: widget.categories[widget.index].color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(
              widget.index%2!=0 ? 20 : 0
          ), //odd
          bottomLeft: Radius.circular( widget.index%2 == 0 ? 20 : 0), // ev
        )
      ),

      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height*0.2,
              child: Image.asset(widget.categories[widget.index].img)),
          Text("${widget.categories[widget.index].title}",
          style: TextStyle(
            color: NewsTheme.whiteColor,
            fontWeight: FontWeight.w500
          ),
          )
        ],
      ),
    );
  }
}
