import 'package:flutter/material.dart';
import 'package:news_app/models/categories.dart';
import 'package:news_app/widgets/category_card.dart';

class categoriesListView extends StatelessWidget {
  const categoriesListView({
    super.key,
  });

  final List <caregories> listCate= const[
    caregories(categoryName: "Technology", image: "assets/technology.jpeg"),
    caregories(categoryName: "Business", image: "assets/business.jpg"),
    caregories(categoryName: "Entertainment", image: "assets/entertainment.jpg"),
    caregories(categoryName: "General", image: "assets/general.jpg"),
    caregories(categoryName: "Health", image: "assets/health.png"),
    caregories(categoryName: "Science", image: "assets/science.jpg"),
    caregories(categoryName: "Sports", image: "assets/sportss.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        itemCount: listCate.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  CategoryCard(
            corgo:listCate[index]
          );
        }),
    );
  }
}