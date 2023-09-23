import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconpath;
  String level;
  String duration;
  String calorie;
  bool viewisselected;
  Color boxColor;

  DietModel({
    required this.name,
    required this.calorie,
    required this.duration,
    required this.level,
    required this.iconpath,
    required this.viewisselected,
    required this.boxColor,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(name: 'cup cake', calorie: '305 Kcal', duration: '40mins', level: 'Easy', iconpath: 'assets/icons/cupp.svg', viewisselected: true, boxColor: Color(0xff9DCEFF)));
    diets.add(DietModel(name: 'canai-bread', calorie: '400 Kcal', duration: '60mins', level: 'medium', iconpath: 'assets/icons/canai-bread.svg', viewisselected: true, boxColor: Color(0xffEEA4CE)));
    return diets;
  }
}
