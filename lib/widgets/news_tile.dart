import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import '../views/webviewer.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articalModel});

  final ArticleModel articalModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return   WebViewer(articalModel: articalModel,);
              }));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child:articalModel.image !=null ? Image.network(articalModel.image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              ) :Image.network("https://www.mthe.gov.sl/Photo/News/news-noImage.jpg"),
            ),
          ),
          const SizedBox(height: 10.0,),
           Text(articalModel.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 5.0,),
           Text(articalModel.suptitle ?? "",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 14,
            color: Color.fromARGB(255, 84, 78, 78)
          ),),
        ],
      ),
    );
  }
}