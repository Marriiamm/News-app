import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_tile.dart';

class newsListView extends StatefulWidget {
  const newsListView({
    super.key,
  });

  @override
  State<newsListView> createState() => _newsListViewState();
}

class _newsListViewState extends State<newsListView> {

    List<ArticleModel> articles=[];
    bool isLoading =true;
  @override
  void initState() {
    super.initState();
     getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsServices().getNews(category: "general");
    isLoading =false;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return  isLoading ? const SliverToBoxAdapter
    (child: Center(child:  CircularProgressIndicator())) : SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index){
              return  NewsTile(
                articalModel: articles[index],
              );
            }));
  }
}