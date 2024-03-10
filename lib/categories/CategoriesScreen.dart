import 'package:flutter/material.dart';
import 'package:news_app/AppTheme.dart';
import 'package:news_app/categories/CategoryModel.dart';
import 'package:news_app/categories/CategoryWidget.dart';

class CategoriesScreen extends StatefulWidget {
  static String category_screen = "Category_screen";
  Function categoryClick;
  CategoriesScreen({required this.categoryClick});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var list = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          child: Text(
            "Pick your category\nof interest",
            style: TextStyle(color: NewsTheme.darkGreyColor,
            fontWeight: FontWeight.w700,
              fontSize: 20
            ),
            textAlign: TextAlign.start
            ,
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap:() {
                  print(list[index].id);
                  widget.categoryClick(list[index]);
                },
                child: CategoryWidget(
                    categories: list, index: index),
              );
            },
            itemCount: CategoryModel.getCategories().length,
          ),
        )
      ],
    );
  }
}
