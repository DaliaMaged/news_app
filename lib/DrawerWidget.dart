import 'package:flutter/material.dart';

import 'AppTheme.dart';

class DrawerWidget extends StatefulWidget {
   static int Categories = 1;
  static int Settings = 2;
  Function onItemSelected;
  DrawerWidget({required this.onItemSelected});
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(36),
          color: NewsTheme.primaryColor,
          child : Text(
            "News app",
            style: TextStyle(
                color: NewsTheme.whiteColor, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: (){
            widget.onItemSelected(DrawerWidget.Categories);
          },
          child: Row(
            children: [
              Icon(Icons.menu,color: NewsTheme.primaryColor),
              Text(
                "Categories",
                style: TextStyle(
                    color: NewsTheme.primaryColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
        onTap: (){
    widget.onItemSelected(DrawerWidget.Settings);
    },
          child:
          Row(
            children: [
              Icon(Icons.settings,color: NewsTheme.primaryColor,),
              Text(
                "Settings",
                style: TextStyle(
                    color: NewsTheme.primaryColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
