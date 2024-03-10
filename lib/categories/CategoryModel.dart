import 'package:flutter/material.dart';

class CategoryModel{
  Color color;
  String title;
  String img;
  String id;
  CategoryModel(
  {
    required this.color,
    required this.title,
    required this.img,
    required this.id
}
      );

  static List<CategoryModel> getCategories(){
    return [
      CategoryModel(color: Colors.red, title: "Sports", img: "assets/imgs/ball.png",id: "sports"),
      CategoryModel(color: Colors.blue, title: "General", img: "assets/imgs/Politics.png",id: "general"),
      CategoryModel(color: Colors.pink, title: "Health", img: "assets/imgs/health.png",id: "health"),
      CategoryModel(color: Colors.brown, title: "Business", img: "assets/imgs/bussines.png",id: "business"),
      CategoryModel(color: Colors.blueAccent, title: "Entertainment", img: "assets/imgs/environment.png",id:" entertainment"),
      CategoryModel(color: Colors.yellow, title: "Science", img: "assets/imgs/science.png",id: "science"),
      CategoryModel(color: Colors.deepOrangeAccent, title: "Technology", img: "assets/imgs/ball.png",id:"technology"),
    ];
  }
}