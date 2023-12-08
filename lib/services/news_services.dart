import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {

 final Dio dio =Dio();

 // NewsServices({required this.dio});

  Future<List<ArticleModel>> getNews({required String category}) async {
  try {
  final response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=2305dc39730b4cafb54a1ca16155636f');
  
  Map<String ,dynamic> jsonData =response.data;
  
  List <dynamic> articles = jsonData['articles'];
  
    // ignore: non_constant_identifier_names
    List<ArticleModel> ArticleList =[];
  
  
  for(var article in articles){
        ArticleModel articleModel= ArticleModel(
          image: article["urlToImage"], 
          title: article["title"], 
          suptitle: article["description"],
          url: article["url"]
          );
  
      ArticleList.add(articleModel);
  }
  return ArticleList;
}catch (e) {
  return [];
}
}
}