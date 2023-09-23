import 'package:fitness/models/category.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/models/popular_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getinitialinfo() {
    categories = Category.getcategories();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getinitialinfo();
    return Scaffold(
      appBar: appbar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          searchfield(),
          SizedBox(
            height: 40,
          ),
          _categoriesection(),
          SizedBox(
            height: 40,
          ),
          _dietSection(),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemCount: popularDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: 25,
                ),
                padding: EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(popularDiets[index].iconPath),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                            ),
                            Text(popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calorie, style: const TextStyle(color: Color(0xff7B6F72), fontSize: 13, fontWeight: FontWeight.w400))
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(color: Color.fromARGB(255, 242, 237, 237), borderRadius: BorderRadius.circular(16), boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.07), offset: Offset(0, 10), blurRadius: 40, spreadRadius: 0)
                    ]),
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Recommendation\nfor Diet',
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(color: diets[index].boxColor.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconpath),
                    Text(
                      diets[index].name,
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      diets[index].level + '|' + diets[index].duration + '|' + diets[index].calorie,
                      style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      child: Center(
                          child: Text(
                        'view',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                      )),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(255, 127, 83, 237),
                            Color.fromARGB(96, 30, 106, 229)
                          ]),
                          borderRadius: BorderRadius.circular(50)),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 25,
            ),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
          ),
        )
      ],
    );
  }

  Column _categoriesection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 40),
        Container(
          height: 120,
          child: ListView.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
              itemBuilder: (context, index) {
                return Container(
                    width: 100,
                    decoration: BoxDecoration(color: categories[index].boxColor.withOpacity(0.3), borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconpath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14),
                        )
                      ],
                    ));
              }),
        )
      ],
    );
  }

  Container searchfield() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.11), blurRadius: 40, spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          hintText: 'search Biryani',
          hintStyle: TextStyle(color: Color.fromARGB(31, 43, 41, 41), fontSize: 14),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/icons/Filter.svg'),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  AppBar appbar() {
    return AppBar(
      title: const Text(
        "Aftab's Kitchen",
        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          'assets/icons/Arrow - Left 2.svg',
          height: 23,
          width: 23,
        ),
        decoration: BoxDecoration(color: Color(0xffF7F8F8), borderRadius: BorderRadius.circular(10)),
      ),
      actions: [
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            child: SvgPicture.asset('assets/icons/dots.svg'),
            height: 23,
            width: 23,
            decoration: BoxDecoration(color: Color(0xffF7F8F8), borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
