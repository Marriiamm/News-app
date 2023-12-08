import 'package:flutter/material.dart';
import 'package:news_app/models/categories.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.corgo});
final caregories corgo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return  categoryView(category: corgo.categoryName);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          height: 95,
            width: 185,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(image: AssetImage(corgo.image),
              fit: BoxFit.fill)
            ),
            child:  Center(child: Text(corgo.categoryName,
            style:const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}