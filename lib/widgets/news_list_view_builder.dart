import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/widgets/news_list_view.dart';



// ignore: must_be_immutable
class NewListViewWidget extends StatefulWidget {

  NewListViewWidget({super.key, required this.categoryy});

  final String categoryy;

  @override
  State<NewListViewWidget> createState() => _NewListViewWidgetState();
}

class _NewListViewWidgetState extends State<NewListViewWidget> {
  List<ArticleModel> articles=[];
  var future;


@override
  void initState() {
    future = NewsServices().getNews(category: widget.categoryy);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ArticleModel>>(
      future: future, 
      builder: (context ,Snapshot){
        if(Snapshot.hasData){
        return newsListView(articles: Snapshot.data !,);
      }else if(Snapshot.hasError){
        return const errorMassege();
      }else {
        return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
      }
      });
    
    
    //return isLoading ? 
    //const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())) : 
    //articles.isNotEmpty ?
    //newsListView(articles: articles,) :
    //const SliverToBoxAdapter(child: Center(child: Text("OOP , THERE WAS AN ERROR")));
  }
}

class errorMassege extends StatelessWidget {
  const errorMassege({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(child: Center(child: Text("OOP , THERE WAS AN ERROR")));
  }
}


