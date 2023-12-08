import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

//import 'package:news_app/widgets/categories_list_view.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:  const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("News",
             style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 23,
             ),),
             Text("Cloud",
             style: TextStyle(
              color: Colors.red,
              fontWeight:FontWeight.bold,
              fontSize: 23,
             ),),
          ],
        ),
      ),
      body:   Padding(
        padding: const EdgeInsets.only(left:10.0, right: 10.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child:categoriesListView(),),
            const SliverToBoxAdapter(child:SizedBox(height:20.0),),
            NewListViewWidget(
              categoryy: "general",
            ),
          ],
        )
      )
    );
  }
}

