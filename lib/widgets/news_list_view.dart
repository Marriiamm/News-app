
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';

// ignore: camel_case_types, must_be_immutable
class newsListView extends StatelessWidget {

   List<ArticleModel> articles=[];

   newsListView({super.key,required this.articles});
    

  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index){
              return  NewsTile(
                articalModel: articles[index],
              );
            }));
  }
}