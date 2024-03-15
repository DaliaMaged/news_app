import 'package:flutter/material.dart';
import 'package:news_app/AppTheme.dart';
import 'package:news_app/DrawerWidget.dart';
import 'package:news_app/SettingsScreen.dart';
import 'package:news_app/categories/CategoryModel.dart';
import 'package:news_app/category-details/NewsDetailsScreen.dart';
import 'package:news_app/search/custome_search_delegate.dart';

import 'categories/CategoriesScreen.dart';

class HomeScreen extends StatefulWidget {
  static String homeScreen = "homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.white,
            child: Image.asset("assets/imgs/background.png",fit: BoxFit.fill,height: double.infinity,width: double.infinity,)),
        Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            leading: IconButton(onPressed: () {
              showSearch(context: context, delegate: CustomeSearchDelegate());
            },
              alignment: Alignment.centerRight,
            icon: Icon(Icons.search,color: NewsTheme.whiteColor,),
            ),
          ),
          drawer: Drawer(
            child: DrawerWidget(onItemSelected: onItemSelected),
          ),
          body: selectedItem == 2 ? SettingScreen() : selectedCategory==null ?  CategoriesScreen(categoryClick:categoryClick) : NewsDetailsScreen(categoryModel: selectedCategory!,),
        )
      ],
    );
  }
  CategoryModel? selectedCategory;
  void categoryClick(CategoryModel categoryModel){
    selectedCategory = categoryModel;
    setState(() {

    });
  }
  int selectedItem = DrawerWidget.Categories;
  void onItemSelected(int screen){
    selectedItem = screen;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
