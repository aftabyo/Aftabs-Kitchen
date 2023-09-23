import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  String name;
  String iconpath;
  Color boxColor;
  Category({
    required this.name,
    required this.iconpath,
    required this.boxColor,
  });

  static List<Category> getcategories() {
    List<Category> categories = [];

    categories.add(Category(name: 'Salad', iconpath: 'assets/icons/salad.svg', boxColor: Colors.orange));

    categories.add(Category(name: 'cake', iconpath: 'assets/icons/cake.svg', boxColor: Colors.blue));

    categories.add(Category(name: 'Juices', iconpath: 'assets/icons/juice.svg', boxColor: Colors.red));

    return categories;
  }
}
